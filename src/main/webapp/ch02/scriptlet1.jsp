<!-- scriptlet1.jsp -->
<%@page import="java.util.Date"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		double d = 2.3;
		int i = (int)Math.round(d);
		Date d1 = new Date();
%>
�Ǽ� d�� �ݿø���? <%=i %><br>
��¥�� �ð� <%=d1.toLocaleString() %>
