package wish;

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

import admin.adminVO;
import board.BoardVO;
import member.MemberVO;
import reservation.ReservationVO;

public class WishDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	// 커넥션풀(DataSource)을 얻은 후 ConnecionDB접속
	private Connection getConnection() throws Exception {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/travel");
		// 커넥션풀에 존재하는 커넥션 얻기
		Connection con = ds.getConnection();
		// 커넥션 반환
		return con;
	}

	private void freeResource() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (SQLException e2) {
			e2.printStackTrace();
		}
	}

	public int getOrderCount(String id) {
		String sql = "";
		int count = 0; // 검색한 전체 글수를 저장할 용도

		try {
			// DB연결
			con = getConnection();
			sql = "select count(*) from wishlist where wish_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); // select문 실행

			if (rs.next()) {
				count = rs.getInt("count(*)"); // 검색한 전체 글 개수 얻기
				System.out.println(count);
			}
		} catch (Exception e) {
			System.out.println("getBoardCount메소드에서 예외발생 : " + e);
		} finally {
			freeResource();
		}
		return count; // 검색한 전체 글 수 notice.jsp로 반환

	}

	public ArrayList<Map<String, Object>> getWishList(int startRow, int pageSize, String id) {
		String sql = "";
		ArrayList<Map<String, Object>> List = new ArrayList<Map<String, Object>>();

		try {
			// DB연결

			con = getConnection();
			// SQL문 만들기
			// 정렬 re_ref 내림차순 정렬하여 검색한 후 re_seq 오름차순정렬하여 검색해 오는데
			// limit 각 페이지마다 맨위에 첫번째로 보여질 시작글 번호, 한 페이지당 보여줄 글개수
			sql = "select b.wish_num,t.tour_num,t.tour_name, t.start_date,t.end_date,t.transport,"
					+ " t.stay,t.reserv_member,t.price,l.img1,l.num" + " from wishlist b join tour t "
					+ " on(b.tour_num = t.tour_num) " + " join tboard l on(b.tour_num = l.tour_num)"
					+ " where b.wish_id = ? " + " order by b.wish_num desc limit ?,?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();

				map.put("basket_num", rs.getInt("wish_num"));
				map.put("tour_num", rs.getInt("tour_num"));
				map.put("tour_name", rs.getString("tour_name"));
				map.put("start_date", rs.getTimestamp("start_date"));
				map.put("end_date", rs.getTimestamp("end_date"));
				map.put("transport", rs.getString("transport"));
				map.put("stay", rs.getString("stay"));
				map.put("reserv_member", rs.getInt("reserv_member"));
				map.put("price", rs.getString("price"));
				map.put("img1", rs.getString("img1"));
				map.put("i_num", rs.getInt("num"));
				List.add(map);
			} // while반복
		} catch (Exception e) {
			System.out.println("getReadBoardList메소드에서 예외발생 : " + e);
			// TODO: handle exception
		} finally {
			freeResource();
		}
		return List; // ArrayList를 notice.jsp로 리턴
	}

	// 장바구니 삭제
	public void delWishList(int num) {
		try {
			con = getConnection();
			String query = "delete from wishlist where wish_num = ?";
			System.out.println(query);
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		freeResource();
	}// delBasket

	public Map<String, Object> getWishInfo(String wish_id, int wish_num) {

		String sql = "";
		Map<String, Object> map = new HashMap<String, Object>();

		try {
			// DB연결

			con = getConnection();
			// SQL문 만들기
			// 정렬 re_ref 내림차순 정렬하여 검색한 후 re_seq 오름차순정렬하여 검색해 오는데
			// limit 각 페이지마다 맨위에 첫번째로 보여질 시작글 번호, 한 페이지당 보여줄 글개수
			sql = "select b.basket_num,t.tour_name, t.start_date,t.end_date,t.transport,"
					+ " t.stay,t.reserv_member,t.price,l.img1,l.num" + " from basket b join tour t "
					+ " on(b.tour_num = t.tour_num) " + " join tboard l on(b.tour_num = l.tour_num)"
					+ " where b.basket_id = ? and b.basket_num = ? ";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, wish_id);
			pstmt.setInt(2, wish_num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				map.put("basket_num", rs.getInt("wish_num"));
				map.put("tour_name", rs.getString("tour_name"));
				map.put("start_date", rs.getTimestamp("start_date"));
				map.put("end_date", rs.getTimestamp("end_date"));
				map.put("transport", rs.getString("transport"));
				map.put("stay", rs.getString("stay"));
				map.put("reserv_member", rs.getInt("reserv_member"));
				map.put("price", rs.getString("price"));
				map.put("img1", rs.getString("img1"));
				map.put("i_num", rs.getInt("num"));
			} // while반복
		} catch (Exception e) {
			System.out.println("getReadBoardList메소드에서 예외발생 : " + e);
			// TODO: handle exception
		} finally {
			freeResource();
		}
		return map; // ArrayList를 notice.jsp로 리턴
	}

	public void insertList(int tour_num, String id) {
		String sql = "";

		try {
			// DB연결
			con = getConnection();
			sql = "INSERT INTO wishlist (wish_id,tour_num)" + " VALUES (?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, tour_num);
			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("insertList메소드에서 예외발생 : " + e);
		} finally {
			freeResource();
		}
	}

	public int selectTnum(int tour_num) {
		String sql = "";
		int num=0 ;
		try {
			// DB연결
			con = getConnection();
			sql = "select num from tboard where tour_num = ?" ;
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tour_num);
			rs=pstmt.executeQuery();

			if(rs.next()) {
				num = rs.getInt("num");
			}
		} catch (Exception e) {
			System.out.println("selectTnum메소드에서 예외발생 : " + e);
		} finally {
			freeResource();
		}
			return num ;
	}
}
