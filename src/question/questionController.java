package question;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/que/*")
public class questionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	questionDAO dao;
	questionVO vo;

	public void init(ServletConfig config) throws ServletException {
		dao = new questionDAO();
		vo = new questionVO();
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
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		String action = request.getPathInfo();
		HttpSession session = request.getSession();
		System.out.println("action " + action);

		if (action.equals("/question.do")) {
			int count = dao.getquestionCount();
			String id =(String)session.getAttribute("id");
			System.out.println(count);
			int pageSize = 10;
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null) {
				pageNum = "1";
			}
			System.out.println("qwsd");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			Calendar cal = Calendar.getInstance();
			String today = null;
			today = formatter.format(cal.getTime());
			Timestamp ts = Timestamp.valueOf(today);

			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage - 1) * pageSize;
			List<questionVO> articleList = null;

			if (count > 0) {
				articleList = dao.getquestionList(startRow, pageSize);
			}
			
			
			
			int num = 0;
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int pageBlock = 3;
			int startPage = ((currentPage / pageBlock) - (currentPage % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount) {
				endPage = pageCount;
			}
			System.out.println(pageCount);
			System.out.println(pageBlock);
			System.out.println(startPage);
			System.out.println(endPage);
			request.setAttribute("count", count);
			request.setAttribute("articleList", articleList);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("pageBlock", pageBlock);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("ts", ts);
			request.setAttribute("pageNum", pageNum);
			nextPage = "/question/question.jsp";	
			
		} else if(action.equals("/myquestion.do")) {
			String id =(String)session.getAttribute("id");
			int count = dao.getmyquestion(id);
			
			System.out.println(count);
			int pageSize = 10;
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null) {
				pageNum = "1";
			}

			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage - 1) * pageSize;
			List<questionVO> articleList = null;
			if (count > 0) {
				articleList = dao.mylist(startRow, pageSize, id);
			}
			int num = 0;
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int pageBlock = 3;
			int startPage = ((currentPage / pageBlock) - (currentPage % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount) {
				endPage = pageCount;
			}
		
			request.setAttribute("count", count);
			request.setAttribute("articleList", articleList);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("pageBlock", pageBlock);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageNum", pageNum);
			nextPage = "/question/myquestion.jsp";	

		} else if (action.equals("/questionwrite.do")) {
			nextPage = "/question/questionWrite.jsp";

		} else if (action.equals("/questionwritePro.do")) {
			String id = (String) session.getAttribute("id");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			questionVO vo = new questionVO();
			vo.setId(id);			
			vo.setTitle(title);
			vo.setContent(content);
			vo.setDate(new Timestamp(System.currentTimeMillis()));

			dao.insertquestion(vo);
			nextPage = "/que/question.do";

		} else if (action.equals("/questionContent.do")) {
			int num = Integer.parseInt(request.getParameter("num"));

			vo = dao.getquestion(num);
			int readcount = 0;
			dao.questionCount(num);
			request.setAttribute("vo", vo);
			request.setAttribute("num", num);

			nextPage = "/question/questionContent.jsp";

		} else if (action.equals("/questionUpdate.do")) {
			int num = Integer.parseInt(request.getParameter("num"));

			vo = dao.getquestion(num);

			request.setAttribute("vo", vo);
			request.setAttribute("num", num);
			nextPage = "/question/questionUpdate.jsp";

		} else if (action.equals("/questionUpdatePro.do")) {
			int num = Integer.parseInt(request.getParameter("num"));
			String id = (String) session.getAttribute("id");
			vo.setId(id);
			vo.setTitle(request.getParameter("title"));
			vo.setContent(request.getParameter("content"));

			dao.updatequestion(vo, num);
			request.setAttribute("num", num);
			request.setAttribute("vo", vo);		

				nextPage = "/question/updateok.jsp";


		} else if (action.equals("/questionDelete.do")) {
			int num = Integer.parseInt(request.getParameter("num"));
			vo = dao.getquestion(num);		
			
				dao.deletequestion(vo);
				nextPage = "/que/question.do";

			} else if (action.equals("/questionreply.do")) {

			int num = Integer.parseInt(request.getParameter("num"));

			int re_ref = Integer.parseInt(request.getParameter("re_ref"));

			int re_lev = Integer.parseInt(request.getParameter("re_lev"));

			int re_seq = Integer.parseInt(request.getParameter("re_seq"));

			vo = dao.getquestion(num);
			request.setAttribute("num", num);
			request.setAttribute("vo", vo);
			request.setAttribute("re_ref", re_ref);
			request.setAttribute("re_lev", re_lev);
			request.setAttribute("re_seq", re_seq);

			nextPage = "/question/questionreply.jsp";

		} else if (action.equals("/replyWrite.do")) {
			int re_ref = Integer.parseInt(request.getParameter("re_ref"));

			int re_lev = Integer.parseInt(request.getParameter("re_lev"));

			int re_seq = Integer.parseInt(request.getParameter("re_seq"));
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			questionVO qvo = new questionVO(id,title,content,re_ref,re_lev,re_seq);
			dao.reInsertBoard(qvo);
			nextPage = "/que/question.do";

		}

		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);

	}// doHandle끝
}// noticeController끝
