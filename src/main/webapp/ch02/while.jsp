<!-- while.jsp -->
<%@page import="ch02.MUtil"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		//post��� �ѱ� ó�� : �ݵ�� ��û�� ���� �ޱ� ���� ����
		request.setCharacterEncoding("EUC-KR");
		String msg = request.getParameter("msg");
		//��Ʈ��ũ�� �Ѿ���� ��� ������ ���ڿ� ��ȯ
		int number = Integer.parseInt(request.getParameter("number"));
		int cnt = 0;
		while(number>cnt){
		%>
			<font color="<%=MUtil.randomColor()%>">
			<b><%=msg%></b><br>
			</font>
		<%
			cnt++;
		}%>

		
		