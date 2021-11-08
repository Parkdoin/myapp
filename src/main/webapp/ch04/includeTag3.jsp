<%@page contentType="text/html; charset=EUC-KR"%>
<% 
		request.setCharacterEncoding("EUC-KR");
		String name = "홍길동";
		String bloodType = request.getParameter("bloodType");
%>
<!-- 표현식에서 ""값이 있을때는 ''값으로 시작 -->
<jsp:include page='<%=bloodType+".jsp"%>'>
	<jsp:param value="<%=name %>" name="name"/>
</jsp:include>
