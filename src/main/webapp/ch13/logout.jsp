<!-- logout.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<% 
		request.setCharacterEncoding("EUC-KR");
		//application  > session  > request > page : setAttribute getAttribute removeAttribute
		session.removeAttribute("idKey");//���ǿ� ������ Ű���� ����
		session.invalidate();//���� �������� ����(��ȿȭ)
		response.sendRedirect("login.jsp");
%>
