<!-- if.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		//String s = new String();
		//request는 jsp 페이지가 서버에서 만들어지 질때 자동적 생성 객체 중에 하나.
		String name = request.getParameter("name");
		String color = request.getParameter("color");
		String msg = "";
		if(color.equals("blue")){
			msg = "파란색";
		}else if(color.equals("red")){
			msg = "빨간색";
		}else if(color.equals("orange")){
			msg = "오렌지색";
		}else{
			msg = "기타색";
			color = "white";
		}
%>
<body bgcolor="<%=color%>">
	<%=name%>님 좋아하는 색상은 <%=msg%>입니다.
</body>






