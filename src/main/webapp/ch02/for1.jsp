<!-- for1.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
1.1~10������ ���� for�� �̿��ؼ� ���Ͻÿ�.<br>
<%
		int sum  = 0;
		for(int i=1;i<11;i++){
			sum+=i;//sum = sum + i
		}
%>
sum : <%=sum%><p>
2.1~10������ �İ� ���� for�� �̿��ؼ� ���Ͻÿ�.(ǥ���ĸ� ���)<br>
ex) 1 + 2 + 3 ..... 10 = 55 ���<br>
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

3.1~10������ �İ� ���� for�� �̿��ؼ� ���Ͻÿ�.(out.println ���)<br>
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









