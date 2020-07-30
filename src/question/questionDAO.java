package question;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class questionDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//DB연결하는 메소드
	private Connection getConnection() throws Exception {
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/travel");
		con = ds.getConnection();
		return con;
		}//getConnection 끝
	
	//자원해제 메소드
	private void freeResource() {
		try {
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(con != null) {con.close();}
		} catch (Exception e) {
			e.printStackTrace();
		}
	 }//freeResource끝
	
	//고객 전체 문의사항을 불러오는 메소드
	public List<questionVO> getquestionList(int startRow, int pageSize) {
		List<questionVO> questionlist = new ArrayList<questionVO>();
		try {
			con = getConnection();
			String query = "select* from question order by re_ref desc, re_seq asc limit ?,?";					
			pstmt = con.prepareStatement(query);			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				questionVO q = new questionVO();
				q.setId(rs.getString("id"));
				q.setStatus(rs.getInt("status"));
				q.setContent(rs.getString("content"));
				q.setDate(rs.getTimestamp("date"));
				q.setNum(rs.getInt("num"));				
				q.setRe_lev(rs.getInt("re_lev"));
				q.setRe_ref(rs.getInt("re_ref"));
				q.setRe_seq(rs.getInt("re_seq"));
				q.setTitle(rs.getString("title"));
				q.setCount(rs.getInt("count"));
				questionlist.add(q);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return questionlist;
	}
	
	//id별 문의사항 목록 가져오기
	public List<questionVO> mylist(int startRow, int pageSize, String id) {
		List<questionVO> mylist = new ArrayList<questionVO>();
		try {
			con = getConnection();
			String query = "select * from question where id = ? order by num desc limit ?,?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				questionVO qvo = new questionVO();
				qvo.setNum(rs.getInt("num"));
				qvo.setId(rs.getString("id"));
				qvo.setTitle(rs.getString("title"));
				qvo.setContent(rs.getString("content"));
				qvo.setRe_lev(rs.getInt("re_lev"));
				qvo.setRe_ref(rs.getInt("re_ref"));
				qvo.setRe_seq(rs.getInt("re_seq"));
				qvo.setDate(rs.getTimestamp("date"));
				qvo.setStatus(rs.getInt("status"));					
				mylist.add(qvo);
			}		
		}catch (Exception e) {
			System.out.println("qnaList에서 오류 : e");
		}finally {
			freeResource();
		}
		return mylist;
	}//mylist()끝
	
	
	public questionVO getquestion(int num) {
		questionVO qvo = new questionVO();
		try {
			con = getConnection();
			String query = "select * from question where num=? ";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				qvo.setId(rs.getString("id"));
				qvo.setStatus(rs.getInt("status"));
				qvo.setContent(rs.getString("content"));
				qvo.setDate(rs.getTimestamp("date"));
				qvo.setNum(rs.getInt("num"));
				qvo.setRe_ref(rs.getInt("re_ref"));
				qvo.setRe_lev(rs.getInt("re_lev"));
				qvo.setRe_seq(rs.getInt("re_seq"));
				qvo.setTitle(rs.getString("title"));
			}
			
		} catch (Exception e) {
			System.out.println("questionVO메서드에서 예외발생 : " + e);
		}finally {
			freeResource();
		}
		return qvo;
	}
	
	//글작성하는 메소드
	public void insertquestion(questionVO q) {
		
		String sql="";
		int num=0;
		
		try {
			con = getConnection();			
			sql="select max(num) from question";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				num=rs.getInt(1)+1;
			}else {
				num=1;
			}

			sql = "insert into question"
					+ "(id,title,content,re_ref,re_seq,re_lev,date,count,status)"
					+ "values(?,?,?,?,?,?,now(),0,0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, q.getId());
			pstmt.setString(2, q.getTitle());			
			pstmt.setString(3, q.getContent());
			pstmt.setInt(4, num);	//num 주글번호 기준 == re_ref 그룹번호 
			pstmt.setInt(5, 0);	//답글순서 
			pstmt.setInt(6, 0);	//들여쓰기 
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertquestion메서드에서 예외 발생 : " + e);
		}
	}//insertquestion끝
	
	
	//글수정 메소드
	public void updatequestion(questionVO qvo, int num) {

		try {
			con = getConnection();
			String qeury = "select * from question where num=?";
			pstmt = con.prepareStatement(qeury);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {		
				qeury = "update question set id=?, title=?, content=? where num=?";
				pstmt = con.prepareStatement(qeury);
				pstmt.setString(1, qvo.getId());
				pstmt.setString(2, qvo.getTitle());
				pstmt.setString(3, qvo.getContent());
				pstmt.setInt(4, num);
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println("updatequestion메서드에서 예외 발생:" + e);
		}finally {
			freeResource();
		}
	}
	//조회수 증가 메소드
	public void questionCount(int num) { 
		
		String sql="";

		try {
			con=getConnection();
			sql="update question set count=count+1 where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
	  }
	//모든 글 개수 가져오는 메소드
	public int getquestionCount() {
		int count = 0;
		try {
			con = getConnection();
			String query = "select count(*) from question";
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getquestionCount메서드에서 예외 발생 : " + e);
		} finally {
			freeResource();
		}
		return count;
	}
	
	//글 삭제하는 메소드
	public void deletequestion(questionVO qvo) {
		try {
			con = getConnection();
			String query = "select * from question where num=?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, qvo.getNum());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
			  query = "delete from question where num=?";
			  pstmt = con.prepareStatement(query);
			  pstmt.setInt(1, qvo.getNum());
			  pstmt.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println("deletqeustion메서드에서 예외발생 : " +e);
		}finally {
			freeResource();
		}
	}
	//답변글 작성하는 메소드
	public void reInsertBoard(questionVO qvo) {		
		try {
			con = getConnection();							
			
			/*re_seq 답글순서 재배치 */
			//부모글 그룹과 같은 같은 그룹이면서... 부모글의 seq값보다 큰 답변글들은 ? seq값을 1증가시킨다.
			String query="update question set re_seq = re_seq+1 where re_ref = ? and re_seq>?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, qvo.getRe_ref());
			pstmt.setInt(2, qvo.getRe_seq());
			pstmt.executeUpdate();

			/*답변글 달기 */
			//3 insert // re_seq + 1 re_lev + 1 답글달기 
			query = "insert into question (id,title,content,re_ref,re_seq,re_lev,date,count) values(?,?,?,?,?,?,now(),0)";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, qvo.getId());
			pstmt.setString(2, qvo.getTitle());			
			pstmt.setString(3, qvo.getContent());
			pstmt.setInt(4, qvo.getRe_ref());	//부모글 그룹번호 re_ref사용 
			pstmt.setInt(5, qvo.getRe_seq()+1);	//부모글의 re_seq에 +1을 하여 답글을 단 순서 정하기  
			pstmt.setInt(6, qvo.getRe_lev()+1);	//부모글의 re_lev에 +1을 하여 들여쓰기 
			pstmt.executeUpdate();
			
			query = "update question set status = 1 where re_ref = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, qvo.getRe_ref());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
	}
	//고객id별 글 개수 가져오는 메소드
		public int getmyquestion(String id) {
			int count = 0;			
			try {
				con = getConnection();
				String query = "select * from question where id = ? ";
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					count ++;
				}
			} catch (Exception e) {
				System.out.println("getmyquestion에서 예외발생 : " + e);
			}finally {
				freeResource();
			}
			return count;
		}//getmyquestion()끝
		
		
}// questionDAO끝





