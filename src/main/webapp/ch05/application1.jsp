<%@page contentType="text/html; charset=EUC-KR"%>
<% 
		request.setCharacterEncoding("EUC-KR");
		String realPath = application.getRealPath("/");
		//application > session > request > page
		application.setAttribute("aaa", "�׽�Ʈ");
%>
���� �����̳� �̸��� ���� <%=application.getServerInfo()%><br>
�������� �ý��� ��� <%=realPath%><br>
aaa : <%=application.getAttribute("aaa")%>