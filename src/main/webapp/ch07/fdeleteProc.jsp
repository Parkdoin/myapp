<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="ch07.FileloadMgr"/>
<% 
		request.setCharacterEncoding("EUC-KR");
		String snum[] = request.getParameterValues("fch");
		// 0, 2, 4 => ũ��� 3������ ���� �տ� 0�� �ʿ���� ���̱� ������ �ϳ� �۰� ���� �迭�� ����
		int num[] = new int[snum.length-1];
		for(int i=0;i<num.length;i++){
			num[i] = Integer.parseInt(snum[i+1]);//0�� ���� 2���� ���� �ֱ� ����
		}
		mgr.deleteFile(num);
		response.sendRedirect("flist.jsp");
%>
