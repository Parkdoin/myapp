<%@ page contentType="text/html; charset=EUC-KR"%>

<h1>������</h1>

<table border = "1">
		<tr><%
			for(int i =2; i<10; i++){%>
			<td>
				<%= i + "��" %>
			</td>
			<% 	}
			%>
		</tr>
		<%
			for(int i=1; i<10; i++){
		%>
		<tr><%for(int j=2; j<10; j++){
			%>
				<td>
					<%= j+ "*" + i + " = " + i*j%>
				</td>
				<% 
				}
				%>
		</tr>
			<% 
				}
			%>
	</table>
	

	
	
