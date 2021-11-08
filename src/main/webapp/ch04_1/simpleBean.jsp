<%@page import="ch04.SimpleBean"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<% 
		request.setCharacterEncoding("EUC-KR");
		//simpleBean.html에 요청한 값들을 SimpleBean 객체에 저장 -> DB연동
		//자바빈즈 액션태그를 사용하지 않고 구현
		SimpleBean bean = new SimpleBean();
		String msg = request.getParameter("msg");
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		bean.setMsg(msg);
		bean.setCnt(cnt);
%>
msg : <%=bean.getMsg() %><br> 
cnt : <%=bean.getCnt() %>
