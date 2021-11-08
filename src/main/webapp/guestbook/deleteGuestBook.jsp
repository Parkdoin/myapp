<!-- deleteGuestBook.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr"/>
<% 
		request.setCharacterEncoding("EUC-KR");
		int num = 0;
		if(request.getParameter("num")!=null){
			num = Integer.parseInt(request.getParameter("num"));
			//방명록글 삭제
			mgr.deleteGuestBook(num);
			//방명록 댓글 전체 삭제
			mgr.deleteAllComment(num);
		}
		response.sendRedirect("showGuestBook.jsp");
%>
