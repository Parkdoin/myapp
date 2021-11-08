<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<h2>구구단</h2>
<table border="1">
<tr>
<%
	for(int i=2;i<10;i++){
		out.println("<th>"+i+"단</th>");
	}
%>
</tr>
<%
for (int i = 1; i < 10; i++) {
	out.print("<tr>");
	for (int j = 2; j < 10; j++) {
		out.println("<td>"+ j + "*" + i + "=" + j * i + "</td>");
	}
	out.println("</tr>");
}
%>
</table>