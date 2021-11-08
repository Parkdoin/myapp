<!-- postGuestBookProc.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr"/>
<jsp:useBean id="bean" class="guestbook.GuestBookBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
		if(bean.getSecret()==null){
			//비밀글 체크를 안 한 경우
			bean.setSecret("0");
		}
		mgr.insertGuestBook(bean);
		response.sendRedirect("showGuestBook.jsp");
%>