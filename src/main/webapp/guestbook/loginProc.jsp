<!-- loginProc.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr"/>
<jsp:useBean id="login" class="guestbook.JoinBean"/>
<jsp:setProperty property="*" name="login"/>
<%
		String url = "login.jsp";
			
		if(request.getParameter("url")!=null&&
				!request.getParameter("url").equals("null")){
			//login.jsp에서 로그인 요청을 한것이 아니고 다른 페이지에서 로그인 요청시.
			url = request.getParameter("url");
		}		

		boolean result = mgr.loginJoin(login.getId(), login.getPwd());
		String msg = "로그인 실패";
		if(result){
			msg = "로그인 성공";
			login = mgr.getJoin(login.getId());
			session.setAttribute("idKey", login.getId());
			session.setAttribute("login", login);
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>














