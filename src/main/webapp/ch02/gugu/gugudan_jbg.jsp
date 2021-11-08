<%@ page contentType="text/html; charset=EUC-KR"%>

<%
		int number[] = { 2, 3, 4, 5, 6, 7, 8, 9 };
		int numbers[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
%>

<div align="center">
	<h2>구구단</h2>
	<table border="1">
		<tr bgcolor=#F5A9E1 >
			<th width="80">2단</th>
			<th width="80">3단</th>
			<th width="80">4단</th>
			<th width="80">5단</th>
			<th width="80">6단</th>
			<th width="80">7단</th>
			<th width="80">8단</th>
			<th width="80">9단</th>
		</tr>
		<%for(int i=0;i<number.length+1;i++){ %>
		<tr align="center" bgcolor=pink>
		<td><%=2 +" X "+ numbers[i] +"="+ 2*numbers[i] %></td>
		<td><%=3 +" X "+ numbers[i] +"="+ 3*numbers[i] %></td>
		<td><%=4 +" X "+ numbers[i] +"="+ 4*numbers[i] %></td>
		<td><%=5 +" X "+ numbers[i] +"="+ 5*numbers[i] %></td>
		<td><%=6 +" X "+ numbers[i] +"="+ 6*numbers[i] %></td>
		<td><%=7 +" X "+ numbers[i] +"="+ 7*numbers[i] %></td>
		<td><%=8 +" X "+ numbers[i] +"="+ 8*numbers[i] %></td>
		<td><%=9 +" X "+ numbers[i] +"="+ 9*numbers[i] %></td>
			
</tr>
<%}%></table>
</div>

