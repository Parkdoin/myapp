<%@page contentType="text/html; charset=EUC-KR"%>
<%
String teams [] = {"2��","3��","4��","5��","6��","7��","8��","9��"};
%>

<div align="center"  bgcolor = "skyblue">

<h1>������</h1>

	<table border="1">
	
		<tr> 
			<th width="70">2��</th>
			<th width="70">3��</th>
			<th width="70">4��</th>
			<th width="70">5��</th>
			<th width="70">6��</th>
			<th width="70">7��</th>
			<th width="70">8��</th>
			<th width="70">9��</th>
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