<!-- orderProc.jsp -->
<%@page import="shop.UtilMgr"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="orderMgr" class="shop.OrderMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	String flag = request.getParameter("flag");
	int no = UtilMgr.parseInt(request, "no");
	boolean result = false;
	String msg = "오류가 발생하였습니다.";
	if(flag.equals("update")){
		String state = request.getParameter("state");
		if(orderMgr.updateOrder(no, state))
			msg = "수정 하였습니다.";
	}else if(flag.equals("delete")){
		if(orderMgr.deleteOrder(no))
			msg = "삭제 하였습니다.";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href = "orderMgr.jsp";
</script>