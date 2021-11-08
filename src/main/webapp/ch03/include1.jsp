<!-- include1.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%@include file="top.jsp"%>
include 지시자의 Body입니다.<br>
<%
		//top.jsp에서 변수 d를 이미 선언 되어서 에러남.
		//include 지시자는 세개의 파일이 합쳐져서 하나의 서블릿 코드 변환
		//String d = "하하";
%>
Date&Time : <%=d.toLocaleString() %>
<%@include file="bottom.jsp"%>