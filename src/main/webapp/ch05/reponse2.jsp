<!-- response2.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<% 
		request.setCharacterEncoding("EUC-KR");
		//ĳ�ÿ����� ������ �ȵ�(�� �������� �׻� ���� ��û�� �ؾ���.)
		response.setHeader("Progma", "no-cache");
		if(request.getProtocol().equals("HTTP/1.1"))
			response.setHeader("Cache-Control", "no-store");
%>
response2.jsp