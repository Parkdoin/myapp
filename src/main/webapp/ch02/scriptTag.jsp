<!-- scriptTag.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<!-- SUN ��å : jsp�ȿ� �ڹ��ڵ带 0% -->
<%
		String str = new String();
		int a = 10;//�ڹ� �⺻�� Date 5.0 ���Ӱ� ���� ����
		Integer a1 = a;//Ŭ���� Ÿ��
%>
<jsp:useBean id="str1" class="java.lang.String"/>
<jsp:declaration>
	public int max(int a, int b){ 
		return a>b?a:b;
	}
</jsp:declaration>
<jsp:scriptlet>
	int x = 22;
	int y = 23;
</jsp:scriptlet>
<jsp:expression>max(x,y)</jsp:expression>









 