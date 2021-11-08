<%@ page contentType="text/html; charset=EUC-KR"%>
<head>
<title>gugudan_kdh.jsp</title>
</head>
<body>
  
        <h1>구구단</h1>
        <table border=1  >
            <%
                for (int i = 0; i < 10; i++) {
                    %><!-- 세로 i -->
            <tr>
                <%  
                    for (int j = 1; j < 10; j++) {
                        %><!-- 가로j -->
                <% 
                        if(i ==0 && j==1){
                            %><td></td>
                            <!-- 모서리부분 비게 -->
                <%
                        }else if(i==0){
                            %>
                <td><%= j+ "단" %></td><!-- 첫줄에 단적기 -->
                <%
                        } else if(j==1){
                            %>
                <td><%= i %></td>
                <%
                        }else {
                            %>
                <td><%= j+"X"+i+"="+j*i %></td>
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
</body>
