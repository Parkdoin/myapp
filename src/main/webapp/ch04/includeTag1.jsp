<!-- includeTag1.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<!-- include 액션태그는 현재페이지에 요청된 정보까지 같이 넘어감. -->
<!-- include 액션태그 요청되는 정보에 따라 동적인 페이지가 포함. -->
<jsp:include page="includeTagTop1.jsp"/>
include Action Tag의 Body입니다.