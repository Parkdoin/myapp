<!-- teamRead.jsp -->
<%@page import="ch04.UtilMgr"%>
<%@page import="ch04.TeamBean"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="ch04.TeamMgr"/>
<%
		int num = 0;
		String url = "teamList.jsp";
		TeamBean bean =  null;
		//num���� ��û�� ���ٸ� teamList.jsp�� ����
		if(request.getParameter("num")==null){
			response.sendRedirect(url);
		}else if(!UtilMgr.isNumeric(request.getParameter("num"))){
			//���������� ���ڿ� �� ����.�� "two" �̷� ���ڿ� ��������
			response.sendRedirect(url);
		}else{
			//���������� ���ڰ� �� �Ѿ��.
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
		<td>��ȣ</td>
		<td><%=bean.getNum()%></td>
	</tr>
	<tr>
		<td>�̸�</td>
		<td><%=bean.getName()%></td>
	</tr>
	<tr>
		<td>��°�</td>
		<td><%=bean.getCity()%></td>
	</tr>
	<tr>
		<td>����</td>
		<td><%=bean.getAge()%></td>
	</tr>
	<tr>
		<td>����</td>
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













