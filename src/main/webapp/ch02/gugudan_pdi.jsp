<!-- gugudan_pdi -->
<%@ page contentType="text/html; charset=EUC-KR"%>

<div align="center">
<h2>구구단</h2>
<table border="1">
	<tr align="center" bgcolor="lightblue">
	<%for(int i=2;i<=9;i++){%>
 		<td><b> <%= i+"단" %></b></td>
	<%}%>
	</tr>
		<%for(int i=1;i<=9;i++){%>
	<tr align="left">
			<%for(int j=2;j<=9;j++){%>
 				<td><%=j%> X <%=i%> = <%=j*i%></td>
			<%}%>
	</tr>
		<%}%>
</table>
</div>