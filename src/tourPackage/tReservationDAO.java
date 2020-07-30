package tourPackage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import reservation.ReservationVO;

public class tReservationDAO {
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
		
		public void updateReservMember(int tour_num, int reserv_member) {
			String sql="";
			
			
			try {
				con=getConnection();
				sql="update tour set reserv_member=reserv_member+? where tour_num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, reserv_member);
				pstmt.setInt(2, tour_num);
				pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null)try {rs.close();}catch(SQLException ex) {}
				if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {}
				if(con!=null)try {con.close();}catch(SQLException ex) {}
			}
			
		}
		
		public void addTourReserv(tReservationVO vo) {
			try {
				con = getConnection();
				String query = "INSERT INTO tourreservation(tour_num,tour_name,start_date,end_date,transport,stay,reserv_member,reserv_email,reserv_id,price) VALUES(?,?,?,?,?,?,?,?,?,?)";
				
				System.out.println(query);
				//PreparedStatement객체를 생성하면서 SQL문을 인자로 전달합니다.
				pstmt = con.prepareStatement(query);
				//값 셋팅
				pstmt.setInt(1, vo.getTour_num());
				pstmt.setString(2, vo.getTour_name());
				pstmt.setTimestamp(3, vo.getStart_date());
				pstmt.setTimestamp(4, vo.getEnd_date());
				pstmt.setString(5, vo.getTransport());
				pstmt.setString(6, vo.getStay());
				pstmt.setInt(7, vo.getReserv_member());
				pstmt.setString(8, vo.getReserv_email());
				pstmt.setString(9, vo.getReserv_id());
				pstmt.setInt(10, vo.getPrice());
				//SQL문을 실행합니다.
				pstmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				freeResource();
			}
		}
		
		public List payTourMemberlist() {
			List payTourMemberList = new ArrayList();
			try {
				con = getConnection();
				String query = "select * from tourreservation";
				System.out.println(query);
				pstmt = con.prepareStatement(query);
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next()) {
					int num = Integer.parseInt(rs.getString("num"));
					int tour_num = Integer.parseInt(rs.getString("tour_num"));
					String tour_name = rs.getString("tour_name");
					Timestamp start_date = rs.getTimestamp("start_date");
					Timestamp end_date = rs.getTimestamp("end_date");
					String transport = rs.getString("transport");
					String stay = rs.getString("stay");
					int reserv_member = Integer.parseInt(rs.getString("reserv_member"));
					String reserv_email = rs.getString("reserv_email");
					String reserv_id = rs.getString("reserv_id");;
					int price = Integer.parseInt(rs.getString("price"));

					ReservationVO rVO = new ReservationVO();
					payTourMemberList.add(rVO);
				}
				freeResource();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return payTourMemberList;
		}
		public List<tReservationVO> getReadpayTourList(int startRow, int pageSize) {
			String sql = "";
			List<tReservationVO> payList = new ArrayList<tReservationVO>();

			try {
				// DB연결
				con = getConnection();
				// SQL문 만들기
				// 정렬 re_ref 내림차순 정렬하여 검색한 후 re_seq 오름차순정렬하여 검색해 오는데
				// limit 각 페이지마다 맨위에 첫번째로 보여질 시작글 번호, 한 페이지당 보여줄 글개수
				sql = "select * from tourreservation order by num desc limit ?,?";

				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, pageSize);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					tReservationVO vo = new tReservationVO();
					vo.setNum(rs.getInt("num"));
					vo.setTour_num(rs.getInt("tour_num"));
					vo.setTour_name(rs.getString("tour_name"));
					vo.setStart_date(rs.getTimestamp("start_date"));
					vo.setEnd_date(rs.getTimestamp("end_date"));
					vo.setTransport(rs.getString("transport"));
					vo.setStay(rs.getString("stay"));
					vo.setReserv_member(rs.getInt("reserv_member"));
					vo.setReserv_email(rs.getString("reserv_email"));
					vo.setReserv_id(rs.getString("reserv_id"));
					vo.setPrice(rs.getInt("price"));
					payList.add(vo);
				} // while 반복
			} catch (Exception e) {
				System.out.println("getReadpayTourList메소드에서 예외발생 : " + e);
			} finally {
				freeResource();
			}
			return payList;
		}// getBoardList메소드 끝


}
