<!-- page2.jsp -->
<%@page contentType="text/html; charset=EUC-KR" %>
<%@page import="java.util.*,java.net.*" %>
<%@page import="java.sql.*" %>
<%@page session="true" 
                  buffer="8kb"
                  autoFlush="true"
                  isThreadSafe="true"
%>
<%
		String sessionId = session.getId();
		session.setMaxInactiveInterval(60);//1ºÐ
%>
¼¼¼Ç ID : <%=sessionId%>