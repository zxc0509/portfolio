package member;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import com.mysql.cj.Session;

import ReviewComment.CommentVO;

@WebServlet("/mem/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberDAO memberDAO;
	MemberVO mvo;

	public void init(ServletConfig config) throws ServletException {
		memberDAO = new MemberDAO();
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
		response.setContentType("text/html;charset=utf-8");
		String action = request.getPathInfo();
		System.out.println("action:" + action);
		
		PrintWriter out = response.getWriter();

		if (action.equals("/join.do")) {
			
			nextPage = "/member/join.jsp";
			
			
		}else if(action.equals("/joincheckId.do")){
			String id = request.getParameter("id");
			
			int result = memberDAO.idCheck(id); //DB에 있는 ID를 가져옴.
				
			if(result == 1) {
				out.write("false");
			}else {
				out.write("success"); //에이잭스로 전송
			}
			return;
			
		}else if (action.equals("/joinPro.do")) {
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String birth = request.getParameter("birth");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String address2 = request.getParameter("address2");
			String address3 = request.getParameter("address3");
			String address4 = request.getParameter("address4");
			
			MemberVO memberVO = new MemberVO(id, passwd, name, birth, email, phone, address, address2,address3,address4);
			memberDAO.addMember(memberVO);
			nextPage = "/member/joinPro.jsp";
			
		} else if (action.equals("/login.do")) {
			
			nextPage = "/member/login.jsp";
			
		} else if (action.equals("/loginPro.do")) {
			
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			int chk = memberDAO.loginCheck(id, passwd);
			if (chk > 0) {
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				nextPage = "/member/loginPro.jsp";
			} else {
				nextPage = "/member/loginFail.jsp";
			}
			
		} else if (action.equals("/index.do")) {
			
			nextPage = "../index.jsp";
			
		} else if (action.equals("/logout.do")) {
			
			HttpSession session = request.getSession();
			session.invalidate();
			nextPage = "/member/logout.jsp";
			
		} else if (action.equals("/myCheck.do")) {

			nextPage = "/member/mypageCheck.jsp";

		} else if (action.equals("/myPage.do")) {
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("id");
			String passwd = request.getParameter("passwd");
			int chk = memberDAO.loginCheck(id, passwd);
			MemberVO vo = new MemberVO();
			if (chk > 0) {
				vo = memberDAO.selectAll(id);
				request.setAttribute("vo", vo);
				nextPage = "/member/mypage.jsp";
			} else {
				nextPage = "/member/mypageFail.jsp";
			}
			
		} else if (action.equals("/mypagePro.do")) {
			
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String birth = request.getParameter("birth");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String address2 = request.getParameter("address2");
			String address3 = request.getParameter("address3");
			String address4 = request.getParameter("address4");

			MemberVO vo2 = new MemberVO(id, passwd, name, birth, email, phone, address,address2,address3,address4);
			memberDAO.updateAll(vo2);
			nextPage = "/member/mypagePro.jsp";
			
		} else if(action.equals("/deleteMem.do")) {
			
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			memberDAO.deleteMem(id);
			session.invalidate();
			nextPage = "/member/deleteMem.jsp";			
		}else if(action.equals("/nomember.do")) {
			nextPage = "/search/MemberChk.jsp";
		}else {
			nextPage = "/mem/index.do";
		}

		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);

	}

}
