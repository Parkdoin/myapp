<!-- memberProc.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<!-- post방식으로 보낸 data는 반드시 인코딩에 setProperty보다 위에 있어야 함. -->
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="member.MemberMgr"/>
<jsp:useBean id="bean" class="member.MemberBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
		boolean result = mgr.insertMember(bean);
		String msg = "가입 실패";
		String url = "member.jsp";
		if(result){
			msg = "가입 성공";
			url = "login.jsp";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>






