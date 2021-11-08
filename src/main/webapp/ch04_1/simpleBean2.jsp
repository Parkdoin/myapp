<!-- simpleBean2.jsp -->
<%@page import="ch04.SimpleBean"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<!--  SimpleBean bean = new SimpleBean()-->
<jsp:useBean id="bean" class="ch04.SimpleBean"/>
<%-- <jsp:setProperty property="msg" name="bean"/>
<jsp:setProperty property="cnt" name="bean"/> --%>
<jsp:setProperty property="*" name="bean"/>
msg : <jsp:getProperty property="msg" name="bean"/><br>
cnt : <jsp:getProperty property="cnt" name="bean"/><br>
msg2 : <%=bean.getMsg() %><br>
cnt2 : <%=bean.getCnt() %><br>











