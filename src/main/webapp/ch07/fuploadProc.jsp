<!-- fuploadProc.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="ch07.FileloadMgr"/>
<%
		mgr.uploadFile(request);
		//파일업로드 후에 flist.jsp로 응답
		response.sendRedirect("flist.jsp");
%>
