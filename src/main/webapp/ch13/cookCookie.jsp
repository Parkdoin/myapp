<!-- cookCookie.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<% 
		request.setCharacterEncoding("EUC-KR");
		String cookieName = "myCookie";
		//쿠키 객체 생성
		Cookie cookie = new Cookie(cookieName,"Apple");
		cookie.setMaxAge(60);//1분
		//쿠키의 값을 수정
		cookie.setValue("Melone");
		response.addCookie(cookie);
		//기본적으로 쿠키에 저장되는 값은 sessionId값
%>
쿠키를 만듭니다.<br>
쿠키 내용은 <a href="tasteCookie.jsp">여기로!</a>
