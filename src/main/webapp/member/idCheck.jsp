<!-- idCheck.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="member.MemberMgr"/>
<% 
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		boolean result = mgr.idCheck(id);
		//out.print(result);
%>
<!DOCTYPE html>
<html>
<head>
<title>ID 중복체크</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
<div align="center">
<br><b><%=id%></b>
<%
		if(result){
			out.println("는 이미 존재하는 ID입니다.<p>");
		}else{
			out.println("는 사용 가능한 ID입니다.<p>");
		}
%>
<a href="#" onclick="self.close()">닫기</a>
</div>
</body>
</html>






