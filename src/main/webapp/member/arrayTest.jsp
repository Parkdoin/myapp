<!-- arrayTest.jsp -->
<%@page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<form action="arrayTest2.jsp">
��� : ���ͳ�<input type="checkbox" name="hobby" value="���ͳ�" checked>
		����<input type="checkbox" name="hobby" value="����"> 
		����<input type="checkbox" name="hobby" value="����" checked> 
		��ȭ<input type="checkbox" name="hobby" value="��ȭ"> 
		�<input type="checkbox" name="hobby" value="�" checked>
		<input type="submit">
</form>