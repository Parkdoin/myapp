<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="ch07.FileloadMgr"/>
<% 
		request.setCharacterEncoding("EUC-KR");
		String snum[] = request.getParameterValues("fch");
		// 0, 2, 4 => 크기는 3이지만 제일 앞에 0은 필요없는 값이기 때문에 하나 작게 정수 배열을 선언
		int num[] = new int[snum.length-1];
		for(int i=0;i<num.length;i++){
			num[i] = Integer.parseInt(snum[i+1]);//0은 제외 2부터 값을 넣기 위해
		}
		mgr.deleteFile(num);
		response.sendRedirect("flist.jsp");
%>
