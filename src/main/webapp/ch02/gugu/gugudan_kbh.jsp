<!-- gugudan.jsp -->
<%@  page contentType="text/html; charset=EUC-KR"%>


<!-- �ҽ�������: gugudan_kbh.jsp-->

<div align="center">
<h1>������</h1>
<table border="1" >

	<%for(int i=2;i<10;i++){ %>
	<tr align="center">
		<td>
		<%=i+"��"%>
		</td>
		<%for(int j=1;j<10;j++){
		%>
		<td>
 		<%=i %> x <%= j%>  = <%= i *j %>
 		</td>
 		<%
 		}//--for(j)
 		%>
	<%
	}//--for(i)
	%>
	
</tr>
</table>
</div>