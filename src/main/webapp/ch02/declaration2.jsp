<!-- declaration2.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%!
		//필드 초기화 안되면 자바기본형 data 타입은 0, 참조형(클래스타입) null
		//왜 선언문 사용을 많이 안 하는지?
		int one;
		int two = 2;
		public int plus(){
			int three = one + two;
			return three;
		}
%>
<%
		int one1;//지역변수는 반드시 초기화, 사용하는 시점에 컴파일 에러
		int two1 = 2;
		//int three1 = one1 + two1;
		int four = Math.max(10, 20);
%>










