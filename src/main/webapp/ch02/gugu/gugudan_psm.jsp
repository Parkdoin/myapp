<!-- 备备窜.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<head>
<title>备备窜</title>
 <style>
 table tr:nth-child(even) td {
    background-color: lightgrey;
  }
  
 table tr:hover td{
	background-color: lightskyblue;
 }
 
 table {
 	margin: 10px;
 	padding: 5px;
 }
 
 table th, td {
 	padding: 5px;
 }
 
 table th{
 	color: white;
 }
 
 </style>
</head>
<div align="center">
<h2>备备窜</h2>
<table border="1">
	<tr bgcolor = dodgerblue> 
	<%for(int i = 2; i <= 9; i++){%>
		<th align = "center" width="90"><%=i+"窜"%></th>
	<%}%>
	</tr>
	
	<%for(int i = 1; i < 10; i++){%>
	<tr>
		<%for(int j = 2; j < 10; j++){%>
		<td align = "center" width="90"><%=j%> * <%=i%> = <%=i*j%></td>
	<%}%>
	</tr>
	<%}%>
	
</table>
</div>

