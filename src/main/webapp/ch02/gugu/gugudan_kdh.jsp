<%@ page contentType="text/html; charset=EUC-KR"%>
<head>
<title>gugudan_kdh.jsp</title>
</head>
<body>
  
        <h1>������</h1>
        <table border=1  >
            <%
                for (int i = 0; i < 10; i++) {
                    %><!-- ���� i -->
            <tr>
                <%  
                    for (int j = 1; j < 10; j++) {
                        %><!-- ����j -->
                <% 
                        if(i ==0 && j==1){
                            %><td></td>
                            <!-- �𼭸��κ� ��� -->
                <%
                        }else if(i==0){
                            %>
                <td><%= j+ "��" %></td><!-- ù�ٿ� ������ -->
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
