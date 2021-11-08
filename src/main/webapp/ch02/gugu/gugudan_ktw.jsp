<%-- <%@page import="ch02.MUtil"%> --%>
<%-- <%@page import="java.util.Random"%> --%>
<%@ page contentType="text/html; charset=UTF-8"%>

 <div align="center">
<h2>구구단</h2>
<table border="1">
	<tr align ="center" bgcolor = "skyblue">
	<%for(int i = 1; i<10; i++){%>
	<th width ="100"><%out.print(i);%>단</th>
	<%}%>
  </tr>
  <%-- <font color = "<%=MUtil.randomColor()%>"> --%>
	<%for(int i = 1; i<10; i++){%>
		<tr align = "center">	
		<%for(int j =1; j<10; j++){%>
			<td><%=i%>*<%=j%> = <%=i * j%></td>
		<%}%>
		</tr>
		<!-- </font> -->
	<%}%>
</table>
</div>
