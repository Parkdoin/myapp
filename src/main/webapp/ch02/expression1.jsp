<!-- expression1.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		String subject[] = {"Java","JSP","Android","Spring"};
%>
<table border="1" >
	<tr>
		<td>��ȣ</td>
		<td>����</td>
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
<!-- out.println �̿��ؼ� for���� ��� -->
<table border="1" >
	<tr>
		<td>��ȣ</td>
		<td>����</td>
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









