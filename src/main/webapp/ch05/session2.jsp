<!-- session2.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<% 
		request.setCharacterEncoding("EUC-KR");
		String season = request.getParameter("season");
		String fruit = request.getParameter("fruit");
		//id�� ���ǿ��� ������. �����ߵ� Ÿ������ �����;� �Ѵ�.
		//��ü�Һ��� ��Ģ : new�����ڵ� ������ ��ü�� �Һ�
		String id = (String)session.getAttribute("idKey");
		String sessionId = session.getId();
		int intelvalTime = session.getMaxInactiveInterval();
		if(id!=null){
%>
<%=id%>���� �����ϴ� ������ ������
<%=season%>�� <%=fruit%>�Դϴ�.<br>
����ID : <%=sessionId %><br>
���� ���� �ð� : <%=intelvalTime%>��
<%
		//���ǿ� ����� idKey���� ����
		session.removeAttribute("idKey");
		//���ǰ�ü�� ��ü�� ����(��ȿȭ)
		session.invalidate();
%>
<%}else{
			out.println("������ �ð��� ����� �Ͽ��ų� �ٸ� ������ ������ �� ���� �����ϴ�.");
			out.println("<a href='session1.html'>�α���</a>");
	
}%>







