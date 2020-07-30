package wish;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import Mypage.MypageDAO;
import board.BoardDAO;
import board.BoardVO;
import member.MemberDAO;
import member.MemberVO;
import reservation.ReservationVO;
import tourPackage.tourDAO;

@WebServlet("/bas/*")
public class WishController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	WishDAO dao;
	tourDAO tdao;

	ArrayList<Map<String, Object>> list;

	public void init(ServletConfig config) throws ServletException {
		dao = new WishDAO();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);

	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nextPage = null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String action = request.getPathInfo();
		System.out.println("action:" + action);
		HttpSession session = request.getSession();
		if (action.equals("/list.do")) {

			String id = (String) session.getAttribute("id");
			// id에 해당하는 장바구니 개수
			int count = dao.getOrderCount(id);

			// 하나의 화면마다 보여줄 글 개수 15
			int pageSize = 10;

			// 현재 보여질(선택한) 페이지번호 가져오기
			String pageNum = request.getParameter("pageNum");

			// 현재 보여질(선택한) 페이지번호가 없으면 1페이지 처리
			if (pageNum == null) {
				pageNum = "1";
			}

			// 현재 보여질(선택한) 페이지번호 "1"을 -> 기본정수 1로 변경
			int currentPage = Integer.parseInt(pageNum);

			// (현재 보여질 페이지번호 -1) * 한페이지당 보여줄 글개수 15
			int startRow = (currentPage - 1) * pageSize;

			// 게시판 글객체(BoardBean)를 저장하기 위한 용도
			ArrayList<Map<String, Object>> articleList = new ArrayList<Map<String, Object>>();

			// 만약 게시판에 글이 있다면..
			if (count > 0) {
				// 글목록 가져오기
				// getBoardList(각 페이지마다 맨 위에 첫번째로 보여질 시작 글번호, 한페이지당 보여줄 글개수)
				articleList = dao.getWishList(startRow, pageSize, id);

			}

			// 전체 페이지수 구하기 글 20개 한 페이지 보여줄 글수 10개 => 2페이지
			// 글 25개 한페이지 보여줄 글 수 10개 => 3페이지
			// 조건 (삼항)연산자 조건? 참 : 거짓
			// 전체 페이지수 = 전체글/ 한페이지에 보여줄 글 수 + (전체글수를 한페이지에 보여줄 글수로 나눈 나머지값)
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int pageBlock = 3;

			/* 시작페이지 번호 구하기 */
			// 1 ~ 10 => 1 11~ 20 => 11 21~30 => 21
			// 현재 보여질 (선택한) 페이지 번호/ 한화면(한블럭)에 보여줄 페이지수)-
			// (현재 보여질(선택한) 페이지 번호를 한화면에 보여줄 페이지수로 나눈 나머지값)) *
			// 한화면(한블럭)에 보여줄 페이지수 + 1
			int startPage = ((currentPage / pageBlock) - (currentPage % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;

			// 끝페이지 번호 구하기 1~ 10 => 10 11~ 20 => 20 21~30 => 30
			int endPage = startPage + pageBlock - 1; // 시작페이지번호 + 현재블럭에 보여줄 페이지수 -1

			// 끝페이지번호가 전체페이지수보다 클때...
			if (endPage > pageCount) {
				// 끝페이지번호를 전체페이지수로 저장
				endPage = pageCount;
			}

			request.setAttribute("count", count);
			request.setAttribute("articleList", articleList);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("pageBlock", pageBlock);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageNum", pageNum);

			nextPage = "/Basket/basket.jsp";
		} else if (action.equals("/delBasket.do")) { // 장바구니 삭제

			int num = Integer.parseInt(request.getParameter("num"));
			System.out.println(num);
			dao.delWishList(num);
			request.setAttribute("msg", "deleted");
			nextPage = "/Basket/delBasket.jsp";

//		}else if(action.equals("/basketInfo.do")) {
//			String basket_id = (String)session.getAttribute("id");
//			int basket_num = Integer.parseInt(request.getParameter("basket_num")); 
//			//게시판 글객체(BoardBean)를 저장하기 위한 용도 
//			Map<String, Object> map = new HashMap<String, Object>();
//			
//			map = dao.getBaketInfo(basket_id,basket_num);		
//			request.setAttribute("map", map);
//			nextPage = "/basket/basketInfo.jsp";
		} else if (action.equals("/tourContent.do")) { // 글 상세보기
			
			int tour_num = Integer.parseInt(request.getParameter("tour_num"));
			int num = dao.selectTnum(tour_num);
			 
			nextPage = "/to/tourContent.do?num="+num;

		} else if (action.equals("/insertList.do")) {
			String basket_id = (String) session.getAttribute("id");
			int tour_num = Integer.parseInt(request.getParameter("tour_num"));

			dao.insertList(tour_num, basket_id);
			nextPage = "/bas/list.do";
		}
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}
}