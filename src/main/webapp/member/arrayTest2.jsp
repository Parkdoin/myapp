<%@page contentType="text/html; charset=EUC-KR"%>
<% 
		request.setCharacterEncoding("EUC-KR");
		String hobby[] = request.getParameterValues("hobby");
		for(int i=0;i<hobby.length;i++){
			out.println(hobby[i]+"<br>");
		}
%>
<hr>
<jsp:useBean id="bean" class="member.MemberBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
		String hobby2[] = bean.getHobby();
		for(int i=0;i<hobby2.length;i++){
			out.println(hobby2[i]+"<br>");
		}
%>
