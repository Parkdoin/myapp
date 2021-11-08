package photoBlog;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/photoBlog/pReplyPost")
public class PReplyPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		PReplyMgr rMgr = new PReplyMgr();
		//서블릿에는 jsp:setProperty 기능을 사용못함.
		PReplyBean rbean = new PReplyBean();
		rbean.setNum(Integer.parseInt(request.getParameter("num")));
		rbean.setId(request.getParameter("id"));
		rbean.setComment(request.getParameter("comment"));
		rMgr.insertPReply(rbean);
		//guest.jsp에서 댓글 입력 기능에는 gid값이 넘어옴.
		String gid = request.getParameter("gid");
		if(gid==null)
			response.sendRedirect("home.jsp");
		else
			response.sendRedirect("guest.jsp?gid="+gid);
	}
}







