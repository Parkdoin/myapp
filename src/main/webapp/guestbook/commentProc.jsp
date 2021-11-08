<!-- commentProc.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr"/>
<jsp:useBean id="cbean" class="guestbook.CommentBean"/>
<!-- get방식, post 관계없이 요청되는 모든값 다 받아서 빈즈에 저장 -->
<jsp:setProperty property="*" name="cbean"/>
<%
		String flag = request.getParameter("flag");
		if(flag.equals("insert")){
			mgr.insertComment(cbean);
		}else if(flag.equals("delete")){
			mgr.deleteComment(cbean.getCnum());
		}
		response.sendRedirect("showGuestBook.jsp");
%>
