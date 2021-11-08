<!-- teamList.jsp -->
<%@page import="ch04.TeamMgr"%>
<%@page import="ch04.TeamBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="ch04.TeamMgr"/>
<% TeamMgr mgr1 = new  TeamMgr();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Team Mgr</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div align="center"><p/>
<h1>Team List</h1>
<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>사는곳</th>
			<th>나이</th>
			<th>팀명</th>
	</tr>
	<%
			Vector<TeamBean> vlist = mgr.listTeam();
			//배열 및 Vector 밑에는 무조건 for문이 있다.
			for(int i=0;i<vlist.size();i++){
				TeamBean bean = vlist.get(i);
				int num = bean.getNum();
	%>
	<tr align="center">
		<td>
			<a href="teamRead.jsp?num=<%=num%>"><%=i+1%></a>
			
			
		</td>
		<td><%=bean.getName()%></td>
		<td><%=bean.getCity()%></td>
		<td><%=bean.getAge()%></td>
		<td><%=bean.getTeam()%></td>
	</tr>	
	<%}//---for%>
</table><p>
<a href="teamInsert.html">INSERT</a>
</div>
</body>













