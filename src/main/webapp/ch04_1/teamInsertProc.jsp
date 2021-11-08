<!-- teamInsertProc.jsp -->
<%@page import="ch04.TeamMgr"%>
<%@page import="ch04.TeamBean"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<% 
		request.setCharacterEncoding("EUC-KR");
		TeamBean bean = new TeamBean();
		String name = request.getParameter("name");
		String city = request.getParameter("city");
		int age = Integer.parseInt(request.getParameter("age"));
		String team = request.getParameter("team");
		bean.setName(name);
		bean.setCity(city);
		bean.setAge(age);
		bean.setTeam(team);
		TeamMgr mgr = new TeamMgr();
		mgr.insertTeam(bean);
		//저장후에 teamList.jsp로 응답
		response.sendRedirect("teamList.jsp");
%>








