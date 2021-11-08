<!-- response2.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<% 
		request.setCharacterEncoding("EUC-KR");
		//캐시영역에 저장이 안됨(이 페이지는 항상 서버 요청을 해야함.)
		response.setHeader("Progma", "no-cache");
		if(request.getProtocol().equals("HTTP/1.1"))
			response.setHeader("Cache-Control", "no-store");
%>
response2.jsp