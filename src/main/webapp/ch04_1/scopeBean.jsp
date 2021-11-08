<!-- scopeBean.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		//session.setMaxInactiveInterval(10);//10檬
%>
<jsp:useBean id="pBean" class="ch04.ScopeBean" scope="page"/>
<jsp:useBean id="sBean" class="ch04.ScopeBean" scope="session"/>

<jsp:setProperty property="num" name="pBean" 
value="<%=pBean.getNum()+10%>"/>

<jsp:setProperty property="num" name="sBean" 
value="<%=sBean.getNum()+10%>"/>

<h1>Scope Bean</h1>
pBean : <jsp:getProperty property="num" name="pBean"/><br>
sBean : <jsp:getProperty property="num" name="sBean"/><p>

技记id : <%=session.getId()%><br>
<a href="scopeBean2.jsp">技记力芭</a>








