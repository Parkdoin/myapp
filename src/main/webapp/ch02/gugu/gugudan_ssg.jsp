<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>구구단</title>
</head>
<body>
    <center>
        <h1>구구단</h1>
        <table border=3 cellpadding=2 cellspacing=2 width=500 >
            <%
                for (int i = 0; i < 10; i++) {
                    %>
            <tr align= center >
                <%  
                    for (int j = 1; j < 10; j++) {
                        %>
                <% 
                        if(i ==0 && j==1){
                            %><td align= center bgcolor=skyblue></td>
                <%
                        }else if(i==0){
                            %>
                <td padding: 10px 5px bgcolor=skyblue><%= j+ "단" %></td>
                <%
                        } else if(j==1){
                            %>
                <td padding: 10px 5px width = 700 align= center bgcolor=skyblue><%= i %></td>
                <%
                        }else {
                            %>
                <td align= center><%= j+"X"+i+"="+j*i %></td>
                <% 
                        }%>
                <%
                    }
                    %>
            </tr>
            <%
                }
            %>
        </table>
    </center>
</body>
