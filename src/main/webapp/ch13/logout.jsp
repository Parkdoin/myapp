<!-- logout.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<% 
		request.setCharacterEncoding("EUC-KR");
		//application  > session  > request > page : setAttribute getAttribute removeAttribute
		session.removeAttribute("idKey");//세션에 저장한 키값만 제거
		session.invalidate();//세션 서버에서 제거(무효화)
		response.sendRedirect("login.jsp");
%>
