<!-- teamRead.jsp -->
<%@page import="ch04.UtilMgr"%>
<%@page import="ch04.TeamBean"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="ch04.TeamMgr"/>
<%
		int num = 0;
		String url = "teamList.jsp";
		TeamBean bean =  null;
		//num값이 요청이 없다면 teamList.jsp로 응답
		if(request.getParameter("num")==null){
			response.sendRedirect(url);
		}else if(!UtilMgr.isNumeric(request.getParameter("num"))){
			//숫자형태의 문자열 안 들어옴.즉 "two" 이런 문자열 들어왔을때
			response.sendRedirect(url);
		}else{
			//정상적으로 숫자가 잘 넘어놈.
			num = Integer.parseInt(request.getParameter("num"));
			bean = mgr.getTeam(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Team Mgr</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div align="center"><p/>
<h1>Team Read</h1>
<table border="1">
	<tr>
		<td>번호</td>
		<td><%=bean.getNum()%></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><%=bean.getName()%></td>
	</tr>
	<tr>
		<td>사는곳</td>
		<td><%=bean.getCity()%></td>
	</tr>
	<tr>
		<td>나이</td>
		<td><%=bean.getAge()%></td>
	</tr>
	<tr>
		<td>팀명</td>
		<td><%=bean.getTeam()%></td>
	</tr>
</table><p>
<a href="teamList.jsp">LIST</a>&nbsp;&nbsp;
<a href="teamInsert.html">INSERT</a>&nbsp;&nbsp;
<a href="teamUpdate.jsp?num=<%=num%>">UPDATE</a>&nbsp;&nbsp;
<a href="teamDelete.jsp?num=<%=num%>">DELETE</a>&nbsp;&nbsp;
</div>
</body>
</html>
<%}%>














