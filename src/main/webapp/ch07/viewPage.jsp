<!-- viewPage.jsp -->
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<% 
		request.setCharacterEncoding("EUC-KR");
		//업로드 파일 저장 위치
		final String savaFolder = 
		"C:/Jsp/eclipse-workspace/myapp/src/main/webapp/ch07/upload/";
		//업로드 파일명 인코딩
		final String encoding = "EUC-KR";
		//업로드 파일 크기 
		final int maxSize = 1024*1024*10;//10mb
		try{
			//out.println(request.getParameter("user"));
			//new DefaultFileRenamePolicy() : 중복파일 해결을 위한 클래스
			//파일이 업로드 되는 순간 : MultipartRequest 정상적으로 객체 생성
			MultipartRequest multi = 
					new MultipartRequest(request,savaFolder,maxSize,encoding,
							new DefaultFileRenamePolicy());
			//form에 file 타입으로 지정한 name값
			String fileName = multi.getFilesystemName("upload");
			//중복된 파일명이 변경되기 전에 업로드 파일명
			String original = multi.getOriginalFileName("upload");
			String type = multi.getContentType("upload");
			long len = 0;
			//파일의 정보를 얻기위해서는 java.io.File 객체 생성
			File f = multi.getFile("upload");
			if(f!=null) len = f.length();
			String user = multi.getParameter("user");
			String title = multi.getParameter("title");
%>
저장된 파일 : <%=fileName %><br> 
실제 파일 : <%=original %><br> 
실제 타입 : <%=type %><br> 
파일 크기 : <%=len %>byte <br>
user : <%=user %><br> 
title : <%=title %><br> 
<%			
		}catch(Exception e){
			e.printStackTrace();
		}
%>





















