<!-- productProc.jsp -->
<%@page import="shop.UtilMgr"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pMgr" class="shop.ProductMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	//insert, update, delete
	String flag = request.getParameter("flag");
	String msg = "������ �߻��Ͽ����ϴ�.";
	if(flag.equals("insert")){
		if(pMgr.insertProduct(request))
			msg = "��ǰ�� ����Ͽ����ϴ�.";
	}else if(flag.equals("update")){
		if(pMgr.updateProduct(request))			
			msg = "��ǰ�� �����Ͽ����ϴ�.";
	}else if(flag.equals("delete")){
		if(pMgr.deleteProduct(UtilMgr.parseInt(request, "no")))
			msg = "��ǰ�� �����Ͽ����ϴ�.";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href = "productMgr.jsp";
</script>