<!-- deleteGuestBook.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr"/>
<% 
		request.setCharacterEncoding("EUC-KR");
		int num = 0;
		if(request.getParameter("num")!=null){
			num = Integer.parseInt(request.getParameter("num"));
			//���ϱ� ����
			mgr.deleteGuestBook(num);
			//���� ��� ��ü ����
			mgr.deleteAllComment(num);
		}
		response.sendRedirect("showGuestBook.jsp");
%>
