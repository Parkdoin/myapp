<!-- gugudan_JMA.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>

<div align="center">
<h2>������</h2>
<table border="1">
		<tr> 
			<th width= "100">2��</th>
			<th width= "100">3��</th>
			<th width= "100">4��</th>
			<th width= "100">5��</th>
			<th width= "100">6��</th>
			<th width= "100">7��</th>
			<th width= "100">8��</th>
			<th width= "100">9��</th>
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