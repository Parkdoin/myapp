package photoBlog;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/photoBlog/pBlogLogin")
public class PBlogLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		PBlogMgr pMgr = new PBlogMgr();
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String url = "login.jsp";
		HttpSession session = request.getSession();
		if(pMgr.loginPMember(id, pwd)) {
			//�α��� ����, ���ǿ� id����
			session.setAttribute("idKey", id);
			url = "home.jsp";
		}else {
			session.setAttribute("msg", "���̵�� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		}
		response.sendRedirect(url);
	}
}







