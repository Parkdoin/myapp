<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>

<!-- 소스보내기: gugudan_JHB.jsp -->

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF=8">
<title>구구단을 외자~!</title>
</head>

<body bgcolor="339933">
  <%
   String[] gugudan = request.getParameterValues("dan");
  
  for(int j=0; j<gugudan.length;j++)
  {
	  int dan = Integer.parseInt(gugudan[j]);
	  for(int i=1; i<=9; i++)
	  {
		  
		  out.println(dan+"*"+i+"="+dan*i+"<br>");
		  
	  }
	  out.println("<p>");
	
  }
  %>
</body>
</html>