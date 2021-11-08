<!-- 동적 페이지  : DB연동 -->
<%@page import="java.util.Random"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		//6개의 로또 번호
		Random r = new Random();
		out.print("<h3>");
		for(int i=0;i<6;i++){
	    	out.print(r.nextInt(45)+1+"&nbsp");
	    }
		out.print("</h3>");
		out.print(request.getRealPath("/"));
%>
