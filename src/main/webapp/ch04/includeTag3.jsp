<%@page contentType="text/html; charset=EUC-KR"%>
<% 
		request.setCharacterEncoding("EUC-KR");
		String name = "ȫ�浿";
		String bloodType = request.getParameter("bloodType");
%>
<!-- ǥ���Ŀ��� ""���� �������� ''������ ���� -->
<jsp:include page='<%=bloodType+".jsp"%>'>
	<jsp:param value="<%=name %>" name="name"/>
</jsp:include>
