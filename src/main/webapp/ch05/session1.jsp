<!-- session1.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<% 
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		//DB연동
		//세션이라는 저장 공간에 키값이 idKey로 id를 저장
		session.setAttribute("idKey", id);
		//세션의 생명 주기 : 기본 30분
		session.setMaxInactiveInterval(2*60);//2분
%>
<FORM METHOD="POST" ACTION="session2.jsp">
    1.가장 좋아하는 계절은?<br>
	<INPUT TYPE="radio" NAME="season" VALUE="봄">봄
	<INPUT TYPE="radio" NAME="season" VALUE="여름">여름
	<INPUT TYPE="radio" NAME="season" VALUE="가을">가을
	<INPUT TYPE="radio" NAME="season" VALUE="겨울">겨울<p>

	2.가장 좋아하는 과일은?<br>
	<INPUT TYPE="radio" NAME="fruit" VALUE="watermelon">수박
	<INPUT TYPE="radio" NAME="fruit" VALUE="melon">멜론
	<INPUT TYPE="radio" NAME="fruit" VALUE="apple">사과
	<INPUT TYPE="radio" NAME="fruit" VALUE="orange">오렌지<p>
	<INPUT TYPE="submit" VALUE="결과보기">
</FORM>
