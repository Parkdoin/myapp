<!-- include1.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%@include file="top.jsp"%>
include �������� Body�Դϴ�.<br>
<%
		//top.jsp���� ���� d�� �̹� ���� �Ǿ ������.
		//include �����ڴ� ������ ������ �������� �ϳ��� ���� �ڵ� ��ȯ
		//String d = "����";
%>
Date&Time : <%=d.toLocaleString() %>
<%@include file="bottom.jsp"%>