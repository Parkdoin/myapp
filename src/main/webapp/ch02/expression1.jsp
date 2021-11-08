<!-- expression1.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		String subject[] = {"Java","JSP","Android","Spring"};
%>
<table border="1" >
	<tr>
		<td>번호</td>
		<td>과목</td>
	</tr>
	<%
			for(int i=0;i<subject.length;i++){
	%>
	<tr>
		<td><%=i+1%></td>
		<td><%=subject[i] %></td>
	</tr>		
	<%
		}//--for 
	%>
</table><p>
<!-- out.println 이용해서 for문을 출력 -->
<table border="1" >
	<tr>
		<td>번호</td>
		<td>과목</td>
	</tr>
	<%
			for(int i=0;i<subject.length;i++){
				out.println("<tr>");
				out.println("<td>"+(i+1)+"</td>");
				out.println("<td>"+subject[i]+"</td>");
				out.println("</tr>");
			}
	%>
</table>









