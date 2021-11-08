<!-- script.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<!-- 선언문 : 필드 및 메소드 선언 영역 -->
<%!
      	String declaration  = "선언문";
		
		public String decMethod(){
			return declaration;	
		}
%>
<!-- 스크립트릿 : _jspService 메소드 안에 사용되는 영역 -> 메소드 선언 불가-->
<%
      	String scriptlet = "스크립트릿";
		String comment = "주석";
		out.println("내장객체를 이용한 출력 : " + declaration +"<p>");
		//public void prn(){} -> 스크립트릿 안에는 메소드 선언 불가 -> 서블릿 확인
%>
<!-- 표현식 : _jspService 메소드 안에 사용이 되지만 브라우저에 출력되는 코드-->
<%=declaration%><p>
<!-- 이클립스 단축키 : ctrl+alt+방향키 : 현재 커서 복사 -->
<%=decMethod()%><p>
<%=scriptlet%><p>










