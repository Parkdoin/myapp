<!-- fuploadProc.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="ch07.FileloadMgr"/>
<%
		mgr.uploadFile(request);
		//���Ͼ��ε� �Ŀ� flist.jsp�� ����
		response.sendRedirect("flist.jsp");
%>
