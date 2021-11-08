<%@ page contentType="text/html; charset=EUC-KR"%>

<h1>구구단</h1>

<table border = "1">
		<tr><%
			for(int i =2; i<10; i++){%>
			<td>
				<%= i + "단" %>
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
	

	
	
