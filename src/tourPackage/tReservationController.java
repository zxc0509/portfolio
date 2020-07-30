package tourPackage;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;

import member.MemberDAO;
import member.MemberVO;
import notice.noticeVO;
import reservation.ReservationDAO;
import reservation.ReservationVO;


@WebServlet("/tre/*")
public class tReservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static String ARTICLE_IMAGE_REPO = "D:\\workspace_jsp\\bora_tour\\WebContent\\tourImage";
	
	tourDAO dao;
	tboardVO vo;
	tourVO tvo;
	Map<String, Object> list;
	
	public void init(ServletConfig config) throws ServletException {
		
		dao = new tourDAO();
		vo = new tboardVO();
		tvo = new tourVO();
		list = new HashMap<String, Object>();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doHandle(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String nextPage = null;//초기화
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getPathInfo(); //경로를 지정하는 아이
		System.out.println("action:" + action);
		HttpSession session = request.getSession();
		
		if(action.equals("/tourReservation.do")) {
			
			int num = Integer.parseInt(request.getParameter("num"));
			int tour_num = Integer.parseInt(request.getParameter("tour_num"));
			list = dao.getProduct(tour_num);
			
			request.setAttribute("num", num);
			request.setAttribute("list", list);
			request.setAttribute("tour_num", tour_num);
			String id = (String)session.getAttribute("id");
			MemberDAO mdao = new MemberDAO();
			MemberVO mvo = mdao.selectAll(id);
			request.setAttribute("mvo", mvo);
			nextPage = "/tour/tourReservation.jsp";
			
		}else if(action.equals("/tourReserv1.do")) {
			
			int num = Integer.parseInt(request.getParameter("num"));
			int tour_num = Integer.parseInt(request.getParameter("tour_num"));
			list = dao.getProduct(tour_num);
			
			String tour_name = (String)list.get("tour_name");
			Timestamp start_date = (Timestamp)list.get("start_date");
			Timestamp end_date = (Timestamp)list.get("end_date");
			String transport = (String)list.get("transport");
			String stay = (String)list.get("stay");
			int price = (int)list.get("price");
			String img1 = (String)list.get("img1");
			System.out.println(img1);
			String reserv_id = request.getParameter("id");
			String reserv_email = request.getParameter("email");
			int reserv_member = Integer.parseInt(request.getParameter("person"));
			
			tReservationVO rvo = new tReservationVO();
			rvo.setTour_name(tour_name);
			rvo.setTour_num(tour_num);
			rvo.setStart_date(start_date);
			rvo.setEnd_date(end_date);
			rvo.setTransport(transport);
			rvo.setStay(stay);
			rvo.setReserv_member(reserv_member);
			rvo.setReserv_id(reserv_id);
			rvo.setReserv_email(reserv_email);
			rvo.setPrice(price*reserv_member);
			
			
			request.setAttribute("num", num);
			request.setAttribute("list", list);
			request.setAttribute("tour_num", tour_num);
			session.setAttribute("rvo", rvo);
			nextPage = "/tour/tourReservation2.jsp";
			
		}else if(action.equals("/tourReserv2.do")) {
			tReservationVO rvo = (tReservationVO)session.getAttribute("rvo");
			request.setAttribute("rvo", rvo);
			nextPage = "/tour/tourReservation3.jsp";

		}else if(action.equals("/tourReserv3.do")) {
		
			tReservationDAO rdao = new tReservationDAO();
			tReservationVO rvo = (tReservationVO)session.getAttribute("rvo");
			
			int tour_num = Integer.parseInt(request.getParameter("tour_num"));
			int reserv_member=Integer.parseInt(request.getParameter("reserv_member"));
			
			tvo.setReserv_member(reserv_member);
			rdao.updateReservMember(tour_num,reserv_member);
			rdao.addTourReserv(rvo);
			session.removeAttribute("rvo");
			//msg 스크립트 변수 
			request.setAttribute("msg","결제가 완료되었습니다.");
			nextPage = "/mem/index.do";
		}
		
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}//doHandle

}
