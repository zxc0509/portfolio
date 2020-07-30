package myquestion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import question.questionVO;

public class myquestionDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	private Connection getConnection() throws Exception {
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/travel");
		con = ds.getConnection();
		return con;
		}//getConnection 끝
	private void freeResource() {
		try {
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(con != null) {con.close();}
		} catch (Exception e) {
			e.printStackTrace();
		}
	 }//freeResource끝
	
	
	//모든 QNA 모든 목록 가져오기
	public List<myquestionVO> myquestionList(int pageFirst, int pageSize) {
		List<myquestionVO> myquestionList = new ArrayList<myquestionVO>();
		try {
			con = getConnection();
			String query = "select * from qnaboard order by qna_num desc limit ?,?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageFirst);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				myquestionVO mvo = new myquestionVO();
				mvo.setNum(rs.getInt("num"));
				mvo.setTitle(rs.getString("title"));
				mvo.setContent(rs.getString("content"));
				mvo.setDate(rs.getTimestamp("date"));
				mvo.setStatus(rs.getInt("status"));				
				
				myquestionList.add(mvo);
			}		
		}catch (Exception e) {
			System.out.println("myquestionList에서 오류 : e");
		}finally {
			freeResource();
		}
		return myquestionList;
	}//myquestionList끝
	

	//고객id별 QNA 목록 가져오기
	public List<myquestionVO> myquestionList(int pageFirst, int pageSize, String id) {
		List<myquestionVO> myquestionList = new ArrayList<myquestionVO>();
		try {
			con = getConnection();
			String query = "select * from myquestion where id = ? order by num desc limit ?,?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setInt(2, pageFirst);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				myquestionVO mvo = new myquestionVO();
				mvo.setNum(rs.getInt("num"));
				mvo.setId(rs.getString("id"));
				mvo.setTitle(rs.getString("title"));
				mvo.setContent(rs.getString("qna_contents"));
				mvo.setDate(rs.getTimestamp("date"));
				mvo.setStatus(rs.getInt("status"));				
				myquestionList.add(mvo);
			}		
		}catch (Exception e) {
			System.out.println("qnaList에서 오류 : e");
		}finally {
			freeResource();
		}
		return myquestionList;
	}//qnaList()끝
	
	//관리자 고객 전체 문의사항 들고오기
		public List<myquestionVO> myquestionList(int pageFirst, int pageSize, int status) {
			List<myquestionVO> myquestionList = new ArrayList<myquestionVO>();
			try {
				con = getConnection();
				String query = "select * from qnaboard where qna_status = ? order by qna_num desc limit ?,?";
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, status);
				pstmt.setInt(2, pageFirst);
				pstmt.setInt(3, pageSize);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					myquestionVO mqvo = new myquestionVO();
					mqvo.setNum(rs.getInt("qna_num"));
					mqvo.setId(rs.getString("id"));
					mqvo.setTitle(rs.getString("title"));
					mqvo.setContent(rs.getString("content"));
					mqvo.setDate(rs.getTimestamp("date"));
					mqvo.setStatus(rs.getInt("status"));
					
					myquestionList.add(mqvo);
				}		
			}catch (Exception e) {
				System.out.println("myquestionList에서 오류 : e");
			}finally {
				freeResource();
			}
			return myquestionList;
		}//qnaList()끝
	

	//QNA 글 작성 메소드
	public void insertmyquestion(myquestionVO mqvo) {				
		try {
			con = getConnection();
			String query = "select max(num) from myquestion";
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();	
			int num = 0;
			if(rs.next()) {
				num = rs.getInt(1) + 1;
			}else {
				num = 1;
			}
			
			query = "insert into myquestion(num, id,title, content, date, status)"
				+ "values(?,?,?,?,now(),0)";
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setString(2, mqvo.getId());
			pstmt.setString(3, mqvo.getTitle());
			pstmt.setString(4, mqvo.getContent());		
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("insertmyquestion 에서 예외발생 : " + e);
		}finally {
			freeResource();
		}
	}//insertmyquestion끝

	
	
	//모든 글 개수 가져오는 메소드
	public int getAllmyquestion() {
		int count = 0;		
		try {
			con = getConnection();
			String query = "select * from myquestion";
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count ++;
			}
		} catch (Exception e) {
			System.out.println("getAllmyquestion에서 예외발생 : " + e);
		}finally {
			freeResource();
		}
		return count;
	}//getAllmyquestion끝
	
	
	//고객id별 글 개수 가져오는 메소드
	public int getAllmyquestion(String id) {
		int count = 0;		
		try {
			con = getConnection();
			String query = "select * from myquestion where id = ? ";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count ++;
			}
		} catch (Exception e) {
			System.out.println("getAllmyquestion에서 예외발생 : " + e);
		}finally {
			freeResource();
		}
		return count;
	}//getAllQna()끝
	
	//관리자 페이지 답변 상태 조회 
	public int getAllmyquestion(int status) {
		int count = 0;		
		try {
			con = getConnection();
			String query = "select * from myquestion where status = ? ";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, status);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count ++;
			}
		} catch (Exception e) {
			System.out.println(" getAllmyquestion에서 예외발생 : " + e);
		}finally {
			freeResource();
		}
		return count;
	}
	
	//글 상세보기 메소드
	public myquestionVO viewmyquesstion(int num){//1:1 문의 글 상세보기
		 myquestionVO  mqvo = new myquestionVO();
		try {
			con = getConnection();
			String query = "select * from myquestion where num = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mqvo.setNum(rs.getInt("num"));
				mqvo.setId(rs.getString("id"));
				mqvo.setTitle(rs.getString("title"));
				mqvo.setContent(rs.getString("content"));
				mqvo.setStatus(rs.getInt("status"));
			}
		} catch (Exception e) {
			System.out.println("viewQna()에서 예외 발생 : " + e);
		} finally {
			freeResource();
		}
		return mqvo;
	}//viewQna()끝
	
	
	//QNA 글 삭제 메소드
	public void deleteQna(int num) {//1:1 문의 글 삭제
		try {
			con = getConnection();
			String query = "delete from myquestion where num = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteQna()에서 예외 발생: " + e);
		} finally {
			freeResource();
		}
	}//deleteQna()끝

	
	//FAQ 글 수정 메소드
	public int updatemyquestion(myquestionVO mqvo) {
		int result = 0;
	
		try {
			con = getConnection();
			
			String query = "update myquestion set title=?, content=?, status=?, where num = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mqvo.getTitle());
			pstmt.setString(2, mqvo.getContent());
			pstmt.setInt(4, mqvo.getStatus());
			pstmt.setInt(5, mqvo.getNum());
			
			pstmt.executeUpdate();
			
			result = 1;
		} catch (Exception e) {
			System.out.println("updatemyquestion 내부에서 예외발생 : "+ e);
		}finally {
			freeResource();
		}
		return result;
	}//updatefboard()끝

	
	//QNA 게시판 글 번호 가져오는 메서드
	public myquestionVO getmyquestion(int num) {
			
		myquestionVO mqvo = new myquestionVO();
	
		try {
	
			con = getConnection();
			String query = "select * from myquestion where num = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
	
			while (rs.next()) {
				mqvo.setNum(rs.getInt("num"));
				mqvo.setId(rs.getString("id"));
				mqvo.setTitle(rs.getString("title"));
				mqvo.setContent(rs.getString("content"));
				mqvo.setDate(rs.getTimestamp("date"));
				mqvo.setStatus(rs.getInt("status"));
			}
		} catch (Exception e) {
			System.out.println("getmyquestion메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}
		return mqvo;
	}//getmyquestion끝
}//myquestionDAO 끝
