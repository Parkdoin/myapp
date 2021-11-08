<!-- updateGuestBookProc.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr"/>
<jsp:useBean id="bean" class="guestbook.GuestBookBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
		if(bean.getSecret()==null){
			//비밀글 체크를 안 한 경우
			bean.setSecret("0");
		}
		mgr.updateGuestBook(bean);
%>
<!-- 부모창(opener)은 새로고침, open창은 close  -->
<script>
	opener.location.reload();
	self.close();
</script>