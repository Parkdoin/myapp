<!-- cookCookie.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<% 
		request.setCharacterEncoding("EUC-KR");
		String cookieName = "myCookie";
		//��Ű ��ü ����
		Cookie cookie = new Cookie(cookieName,"Apple");
		cookie.setMaxAge(60);//1��
		//��Ű�� ���� ����
		cookie.setValue("Melone");
		response.addCookie(cookie);
		//�⺻������ ��Ű�� ����Ǵ� ���� sessionId��
%>
��Ű�� ����ϴ�.<br>
��Ű ������ <a href="tasteCookie.jsp">�����!</a>
