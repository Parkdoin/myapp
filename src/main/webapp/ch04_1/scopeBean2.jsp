<%@page contentType="text/html; charset=EUC-KR"%>
<% 
		session.invalidate();//세션제거(무효화)
		response.sendRedirect("scopeBean.jsp");
%>
