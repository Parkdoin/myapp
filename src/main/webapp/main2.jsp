<!-- ���� ������  : DB���� -->
<%@page import="java.util.Random"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		//6���� �ζ� ��ȣ
		Random r = new Random();
		out.print("<h3>");
		for(int i=0;i<6;i++){
	    	out.print(r.nextInt(45)+1+"&nbsp");
	    }
		out.print("</h3>");
		out.print(request.getRealPath("/"));
%>
