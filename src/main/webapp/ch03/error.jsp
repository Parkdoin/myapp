<!-- error.jsp -->
<%@page contentType="text/html; charset=EUC-KR" 
                  isErrorPage="true" 
%>
<%
		String msg = exception.getMessage();
%>
오류 메세지 : <%=msg%>
