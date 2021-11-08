<!-- teamDelete.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="ch04.TeamMgr" />
<% 
		request.setCharacterEncoding("EUC-KR");
		int num = 0;
		if(request.getParameter("num")==null){
			response.sendRedirect("teamList.jsp");
		}
		num = Integer.parseInt(request.getParameter("num"));
		mgr.deleteTeam(num);
		response.sendRedirect("teamList.jsp");
%>
