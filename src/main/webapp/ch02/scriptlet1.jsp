<!-- scriptlet1.jsp -->
<%@page import="java.util.Date"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		double d = 2.3;
		int i = (int)Math.round(d);
		Date d1 = new Date();
%>
실수 d의 반올림은? <%=i %><br>
날짜와 시간 <%=d1.toLocaleString() %>
