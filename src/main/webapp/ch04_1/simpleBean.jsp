<%@page import="ch04.SimpleBean"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<% 
		request.setCharacterEncoding("EUC-KR");
		//simpleBean.html�� ��û�� ������ SimpleBean ��ü�� ���� -> DB����
		//�ڹٺ��� �׼��±׸� ������� �ʰ� ����
		SimpleBean bean = new SimpleBean();
		String msg = request.getParameter("msg");
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		bean.setMsg(msg);
		bean.setCnt(cnt);
%>
msg : <%=bean.getMsg() %><br> 
cnt : <%=bean.getCnt() %>
