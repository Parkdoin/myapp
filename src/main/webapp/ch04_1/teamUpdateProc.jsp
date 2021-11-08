<!-- teamUpdateProc.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="ch04.TeamMgr"/>
<jsp:useBean id="bean" class="ch04.TeamBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
		boolean result = mgr.updateTeam(bean);
		String msg = "수정실패";
		String url = "teamList.jsp";
		if(result) {
			msg= "수정성공";
			url = "teamRead.jsp?num="+bean.getNum();
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>








