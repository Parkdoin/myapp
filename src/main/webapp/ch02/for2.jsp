<!-- for2.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		String teams [] = {"리버풀","맨시티","레스터","첼시","아스널"};
		int wins[] = {10,8,7,7,4};
		int tie[] = {1,1,2,2,5};
		int lose[] = {0,2,2,2,2};
		int point[] = {31,25,23,23,17};
%>
<div align="center">
<h2>프리미어리그 순위</h2>
<table border="1">
	<tr> 
		<th width="40">순위</th>
		<th width="70">팀명</th>
		<th width="50">승</th>
		<th width="50">무</th>
		<th width="50">패</th>
		<th width="50">승점</th>
	</tr>
	<%for(int i=0;i<teams.length;i++){ %>
		<tr align="center">
			<td><%=i+1%></td>
			<td><%=teams[i]%></td>
			<td><%=wins[i]%></td>
			<td><%=tie[i]%></td>
			<td><%=lose[i]%></td>
			<td><%=point[i]%></td>
		</tr>
	<%}%>
</table><p>

<table border="1">
	<tr> 
		<th width="40">순위</th>
		<th width="70">팀명</th>
		<th width="50">승</th>
		<th width="50">무</th>
		<th width="50">패</th>
		<th width="50">승점</th>
	</tr>
	<!-- out.prtinln만 사용해서 출력 -->
	<%
			for(int i=0;i<teams.length;i++){
				out.println("<tr align='center'>");
				out.println("<td>"+(i+1)+"</td>");
				out.println("<td>"+teams[i]+"</td>");
				out.println("<td>"+wins[i]+"</td>");
				out.println("<td>"+tie[i]+"</td>");
				out.println("<td>"+lose[i]+"</td>");
				out.println("<td>"+point[i]+"</td>");
				out.println("</tr>");
			}
	%>
</table>
</div>
	







