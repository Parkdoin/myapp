<!-- exception1.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%@page errorPage="error.jsp"%>
<% 
		request.setCharacterEncoding("EUC-KR");
		int num = Integer.parseInt("aaa");
%>
exception1.jsp
