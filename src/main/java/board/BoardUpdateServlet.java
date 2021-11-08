package board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/boardUpdate")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		//���信 ���� ���ڵ�(��� Ʋ���� �ѱ۷� �ڹٽ�ũ��Ʈ �ڵ� ����)
		response.setContentType("text/html; charset=EUC-KR");
		HttpSession session = request.getSession();
		BoardBean bean = (BoardBean)session.getAttribute("bean");
		String dbPass = bean.getPass();
		//update.jsp���� �Է��� ���
		String inPass = request.getParameter("pass");
		if(dbPass.equals(inPass)) {//����� ��ġ
			BoardMgr mgr = new BoardMgr();
			bean.setName(request.getParameter("name"));
			bean.setSubject(request.getParameter("subject"));
			bean.setContent(request.getParameter("content"));
			mgr.updateBoard(bean);
			
			String nowPage = request.getParameter("nowPage");
			String numPerPage = request.getParameter("numPerPage");
			response.sendRedirect("read.jsp?nowPage="+nowPage
					+"&numPerPage="+numPerPage+"&num="+bean.getNum());
		}else{//��� Ʋ�ȴٰ� ���â
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('�Է��Ͻ� ��й�ȣ�� �ƴմϴ�.');");
			out.println("history.back();");
			out.println("</script>");
		}
	}
}


















