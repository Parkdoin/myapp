<!-- gugudan_JMA.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>

<div align="center">
<h2>구구단</h2>
<table border="1">
		<tr> 
			<th width= "100">2단</th>
			<th width= "100">3단</th>
			<th width= "100">4단</th>
			<th width= "100">5단</th>
			<th width= "100">6단</th>
			<th width= "100">7단</th>
			<th width= "100">8단</th>
			<th width= "100">9단</th>
		</tr>
<%
	for(int i=1; i<=9 ; i++) { 
		out.println("<tr>");
		for (int j=2; j <=9; j++) {
			out.println("<td>" + j + "x" + i + "=" + (j*i)+ "</td>");
		}
		out.println("</tr>");
	}
%>
</table>
</div>