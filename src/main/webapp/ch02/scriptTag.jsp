<!-- scriptTag.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<!-- SUN 정책 : jsp안에 자바코드를 0% -->
<%
		String str = new String();
		int a = 10;//자바 기본형 Date 5.0 새롭게 나온 문법
		Integer a1 = a;//클래스 타입
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









 