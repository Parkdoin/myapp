<!-- error.jsp -->
<%@page contentType="text/html; charset=EUC-KR" 
                  isErrorPage="true" 
%>
<%
		String msg = exception.getMessage();
%>
���� �޼��� : <%=msg%>
