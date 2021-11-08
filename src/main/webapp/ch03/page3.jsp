<!-- page3.jsp -->
<%@page contentType="text/html; charset=EUC-KR"
                  pageEncoding="UTF-8"
                  trimDirectiveWhitespaces="false"
                  isELIgnored="true"
%>
<!-- 
			charset : Client가 받는 html 소스의 인코딩 방식
			pageEncoding : 현재 소스의 인코딩 방식
			그러나 pageEncoding 선언되지 않으면 charset이 
			이 두가지를 모두 세팅함.
 -->
<%
		request.setAttribute("site", "jspstudy.co.kr");
%>
사이트명 : ${site}
