<%@ page contentType="text/html; charset=EUC-KR"%>
<div>
	<h1>GUGUDAN</h1>
	<table border=1 >
	<tr align=center>
<%
for (int i = 0; i <= 9; i++) {
%>
<%
for (int j = 2; j <= 9; j++) {
%>
<%
if (i == 0) {
%>
<td><%=j%></td>
<%
} else {
%>
<td align=center><%=j + "x" + i + "=" + j * i%></td>
<%
}
%>
<%
}
%>
	</tr><%
	}
	%>
	</table>
</div>


