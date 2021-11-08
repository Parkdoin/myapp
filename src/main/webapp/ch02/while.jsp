<!-- while.jsp -->
<%@page import="ch02.MUtil"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		//post방식 한글 처리 : 반드시 요청된 값을 받기 전에 세팅
		request.setCharacterEncoding("EUC-KR");
		String msg = request.getParameter("msg");
		//네트워크로 넘어오는 모든 값들은 문자열 변환
		int number = Integer.parseInt(request.getParameter("number"));
		int cnt = 0;
		while(number>cnt){
		%>
			<font color="<%=MUtil.randomColor()%>">
			<b><%=msg%></b><br>
			</font>
		<%
			cnt++;
		}%>

		
		