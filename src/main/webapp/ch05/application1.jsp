<%@page contentType="text/html; charset=EUC-KR"%>
<% 
		request.setCharacterEncoding("EUC-KR");
		String realPath = application.getRealPath("/");
		//application > session > request > page
		application.setAttribute("aaa", "테스트");
%>
서블릿 컨테이너 이름과 버전 <%=application.getServerInfo()%><br>
로컬파일 시스템 경로 <%=realPath%><br>
aaa : <%=application.getAttribute("aaa")%>