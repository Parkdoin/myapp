<%@page contentType="text/html; charset=EUC-KR"%>
<% 
		session.invalidate();//��������(��ȿȭ)
		response.sendRedirect("scopeBean.jsp");
%>
