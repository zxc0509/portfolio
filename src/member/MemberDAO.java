package member;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//커넥션풀(DataSource)을 얻은 후 ConnecionDB접속
		private Connection getConnection() throws Exception{
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/travel");
			//커넥션풀에 존재하는 커넥션 얻기
			Connection con = ds.getConnection();
			//커넥션 반환
			return con;
		}
		
		private void freeResource() {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(con != null) {con.close();}
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}

	
	public void addMember(MemberVO m) {
		try {
			con = getConnection();
			String id = m.getId();
			String passwd = m.getPasswd();
			String name = m.getName();
			String birth = m.getBirth();
			String email = m.getEmail();
			String phone = m.getPhone();
			String address = m.getAddress();
			String address2 = m.getAddress2();
			String address3 = m.getAddress3();
			String address4 = m.getAddress4();
			
			String query = "INSERT INTO member(id,passwd,name,birth,email,phone,address,address2,address3,address4) VALUES(?,?,?,?,?,?,?,?,?,?)";
			
			System.out.println(query);
			//PreparedStatement객체를 생성하면서 SQL문을 인자로 전달합니다.
			pstmt = con.prepareStatement(query);
			//?값 셋팅
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			pstmt.setString(3, name);
			pstmt.setString(4, birth);
			pstmt.setString(5, email);
			pstmt.setString(6, phone);
			pstmt.setString(7, address);
			pstmt.setString(8, address2);
			pstmt.setString(9, address3);
			pstmt.setString(10, address4);
			
			//SQL문을 실행합니다.
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
	}
	
	
	public int loginCheck(String id,String passwd) {
		int chk = 0;
		try {
			con = getConnection();
			String query = "select * from member where id = ?";
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				if(rs.getString("passwd").equals(passwd)) {
					System.out.println(rs.getString("passwd"));
					System.out.println(passwd);
					chk = 1;
				}
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		return chk;
	}
	
	
	public MemberVO selectAll(String id) {
		MemberVO vo = new MemberVO();
		try {
			con = getConnection();
			String query = "select * from member where id = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				vo.setId(rs.getString("id"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setName(rs.getString("name"));
				vo.setBirth(rs.getString("birth"));
				vo.setEmail(rs.getString("email"));
				vo.setPhone(rs.getString("phone"));
				vo.setAddress(rs.getString("Address"));
				vo.setAddress2(rs.getString("Address2"));
				vo.setAddress3(rs.getString("Address3"));
				vo.setAddress4(rs.getString("Address4"));
				
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return vo;
	}
	
	
	public void updateAll(MemberVO vo) {
		try {
			con = getConnection();
			String query = "update member set passwd=?,name=?,birth=?,email=?,phone=?,address=?,address2=?,address3=?,address4=? where id=?";
			pstmt = con.prepareStatement(query);
			 
			pstmt.setString(1,vo.getPasswd());
			pstmt.setString(2,vo.getName());
			pstmt.setString(3,vo.getBirth());
			pstmt.setString(4,vo.getEmail());
			pstmt.setString(5,vo.getPhone());
			pstmt.setString(6,vo.getAddress());
			pstmt.setString(7,vo.getAddress2());
			pstmt.setString(8,vo.getAddress3());
			pstmt.setString(9,vo.getAddress4());
			pstmt.setString(10,vo.getId());
			
			pstmt.executeUpdate();	//update 실행 

				
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
	}
	
	
	public void deleteMem(String id) {
		try {
			con = getConnection();
			String query = "delete from member where id = ?";
			pstmt = con.prepareStatement(query);
			 
			pstmt.setString(1,id);
			
			pstmt.executeUpdate();	//delete 실행 

				
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		
		}
	}
	
	public int idCheck(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		
		int check = 0;
		
		try {
			con = getConnection();
			sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				check = 1;
			}else {
				check = 0;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();}catch(Exception e) {e.printStackTrace();}
			if(pstmt != null) try {rs.close();}catch(Exception e) {e.printStackTrace();}
			if(con != null) try {rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		return check;
		
	}
	

}
