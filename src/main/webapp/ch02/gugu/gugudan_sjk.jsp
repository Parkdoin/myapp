<%@page contentType="text/html; charset=EUC-KR"%>
<%
String teams [] = {"2단","3단","4단","5단","6단","7단","8단","9단"};
%>

<div align="center"  bgcolor = "skyblue">

<h1>구구단</h1>

	<table border="1">
	
		<tr> 
			<th width="70">2단</th>
			<th width="70">3단</th>
			<th width="70">4단</th>
			<th width="70">5단</th>
			<th width="70">6단</th>
			<th width="70">7단</th>
			<th width="70">8단</th>
			<th width="70">9단</th>
		</tr>
		
	<%for (int i = 1; i < 10; i++){%>
		
		<tr align="center">
			<td><%=i*2%></td>
			<td><%=i*3%></td>
			<td><%=i*4%></td>
			<td><%=i*5%></td>
			<td><%=i*6%></td>
			<td><%=i*7%></td>
			<td><%=i*8%></td>
			<td><%=i*9%></td>
		</tr>
		
	<%}%>
	
	
	</table>
</div>