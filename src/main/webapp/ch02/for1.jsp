<!-- for1.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
1.1~10까지의 합을 for문 이용해서 구하시오.<br>
<%
		int sum  = 0;
		for(int i=1;i<11;i++){
			sum+=i;//sum = sum + i
		}
%>
sum : <%=sum%><p>
2.1~10까지의 식과 합을 for문 이용해서 구하시오.(표현식만 사용)<br>
ex) 1 + 2 + 3 ..... 10 = 55 출력<br>
<%
			sum = 0;
			for(int i=1;i<11;i++){
				if(i<10){
			%>
				<%=i + " + " %>
			<%		
				}else{
			%>
				<%=i + " = " %>
			<%		
				}//---if
				sum+=i;
			}//---for
%>
<%=sum%><p>

3.1~10까지의 식과 합을 for문 이용해서 구하시오.(out.println 사용)<br>
<%
		sum = 0;
		for(int i=1;i<11;i++){
			if(i<10)
				out.println(i + " + ");
			else
				out.println(i + " = ");
			sum+=i;
		}
		out.println(sum);
%>









