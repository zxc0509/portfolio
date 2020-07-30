package myquestion;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberVO;


@WebServlet("/myque/*")
public class myquestionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	myquestionDAO mqdao;
	myquestionVO mqvo;

	public void init(ServletConfig config) throws ServletException {
		mqdao = new myquestionDAO();
		mqvo = new myquestionVO();
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

		  if(action.equals("/myquestionwrite.do")) { //1:1문의하기 폼으로 가기
		         		         	         
		         nextPage = "/myquestion/myquestionWrite.jsp";
		         
		      
		      }else if(action.equals("/myquestionwritePro.do")) { //1:1문의 글작성
		          
		         ServletContext ctx = getServletContext();
		  		 
		  		 String cate = request.getParameter("cate");
		  		 String title = request.getParameter("title");
		  		 String content = request.getParameter("content");
		  		 String id = (String)session.getAttribute("id");		  				  		 	  		 		  		 		  		
	  		 		  		
		  		request.setAttribute("title", title);
		  		request.setAttribute("content", content);
		  		request.setAttribute("id", id);
		  				  		
		  		mqvo.setTitle(title);
		  		mqvo.setContent(content);
		  		mqvo.setId(id);
		  				
		  		         
		         mqdao.insertmyquestion(mqvo);         
		          
		         nextPage = "/myque/myquestion.do";

		          
		       }else if(action.equals("/myquestion.do")) { //문의내역 리스트
		         
		         String id =(String)session.getAttribute("id");
		         
		         int total = mqdao.getAllmyquestion(id);
		         System.out.println(total);
		         
		         MemberVO mvo = new MemberVO();
		         
		         
		         int pageSize = 3;
		         int nowPage = 1;
		         if(request.getParameter("nowPage") != null) nowPage = Integer.parseInt(request.getParameter("nowPage"));
		         
		         int pageFirst = (nowPage-1) * pageSize;
		         int totalPage = total/pageSize + (total%pageSize==0?0:1);
		         int blockSize = 10;
		         int blockFirst = (nowPage/blockSize-(nowPage%blockSize==0?1:0))*blockSize + 1;
		         int blockLast = blockFirst + blockSize -1;
		         
		         if(blockLast>totalPage) blockLast=totalPage;
		         List<myquestionVO> myquestionList = mqdao.myquestionList(pageFirst, pageSize, id);
		         request.setAttribute("myquestionList", myquestionList);
		         request.setAttribute("blockSize", blockSize);
		         request.setAttribute("blockFirst", blockFirst);
		         request.setAttribute("blockLast", blockLast);
		         request.setAttribute("totalPage", totalPage);
		         request.setAttribute("nowPage", nowPage);

		         nextPage = "/myquestion/myquestion.jsp";

		         
		      } else if(action.equals("/viewQna.do")) { //1:1문의 글 상세보기
		    	  int num = Integer.parseInt(request.getParameter("num"));

		         mqvo = mqdao.viewmyquesstion(num);
		         request.setAttribute("qna",  mqvo);
		         nextPage = "/board/viewQna.jsp";
		         
		      } else if(action.equals("/deleteQna.do")) { //1:1문의 글 삭제
		         int num = Integer.parseInt(request.getParameter("num"));		          
		         mqdao.deleteQna(num);
		         
		         nextPage = "/myque/myquestion.do";
		      
		      } else if(action.equals("/qnaUpdateForm.do")) { //1:1문의하기 수정 폼으로 가기
		         
		         int num =Integer.parseInt(request.getParameter("num"));
		         mqvo = mqdao.getmyquestion(num);
		         
		         request.setAttribute("mqvo", mqvo);
		         
		         nextPage = "/myquestion/myquestionupdate.jsp";
		         
		      } else if(action.equals("/myquestionUpdatePro.do")) { //1:1문의하기 수정
				
		         int num = Integer.parseInt(request.getParameter("num"));		         
		         int status = Integer.parseInt(request.getParameter("status"));
		         String title = request.getParameter("title");
		         String content = request.getParameter("content");
		         
		         
		         mqvo.setNum(num);
		         mqvo.setStatus(status);
		         mqvo.setTitle(title);
		         mqvo.setContent(content);		        
		         
		         mqdao.updatemyquestion(mqvo);
		        
		         
		         nextPage = "/myque/myquestion.do";
		         
		      }		      
	      
		    RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		      
		      
		   }//doHandle끝
}// noticeController끝
