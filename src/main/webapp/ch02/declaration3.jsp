<!-- declaration3.jsp -->
<%@ page import="ch02.Ex02"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		Ex02 e = new Ex02();
	    e.one = 10;
	    e.two = 20;
	    int  i = e.plus();
%>
<%=i %>









