<!-- error.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%@page isErrorPage="true"%>
<% 
		request.setCharacterEncoding("EUC-KR");
		String msg = exception.getMessage();
		String obj = exception.toString();
%>
���� �޼��� : <%=msg%><br>
���� �޼��� �� Ŭ���� : <%=obj %>