<!-- viewPage.jsp -->
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<% 
		request.setCharacterEncoding("EUC-KR");
		//���ε� ���� ���� ��ġ
		final String savaFolder = 
		"C:/Jsp/eclipse-workspace/myapp/src/main/webapp/ch07/upload/";
		//���ε� ���ϸ� ���ڵ�
		final String encoding = "EUC-KR";
		//���ε� ���� ũ�� 
		final int maxSize = 1024*1024*10;//10mb
		try{
			//out.println(request.getParameter("user"));
			//new DefaultFileRenamePolicy() : �ߺ����� �ذ��� ���� Ŭ����
			//������ ���ε� �Ǵ� ���� : MultipartRequest ���������� ��ü ����
			MultipartRequest multi = 
					new MultipartRequest(request,savaFolder,maxSize,encoding,
							new DefaultFileRenamePolicy());
			//form�� file Ÿ������ ������ name��
			String fileName = multi.getFilesystemName("upload");
			//�ߺ��� ���ϸ��� ����Ǳ� ���� ���ε� ���ϸ�
			String original = multi.getOriginalFileName("upload");
			String type = multi.getContentType("upload");
			long len = 0;
			//������ ������ ������ؼ��� java.io.File ��ü ����
			File f = multi.getFile("upload");
			if(f!=null) len = f.length();
			String user = multi.getParameter("user");
			String title = multi.getParameter("title");
%>
����� ���� : <%=fileName %><br> 
���� ���� : <%=original %><br> 
���� Ÿ�� : <%=type %><br> 
���� ũ�� : <%=len %>byte <br>
user : <%=user %><br> 
title : <%=title %><br> 
<%			
		}catch(Exception e){
			e.printStackTrace();
		}
%>





















