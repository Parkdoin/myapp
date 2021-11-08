<!-- zipSearch.jsp -->
<%@page import="member.ZipcodeBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="member.MemberMgr"/>
<% 
		request.setCharacterEncoding("EUC-KR");
		String search = request.getParameter("search");
		Vector<ZipcodeBean> vlist = null;
		String area3 = null;
		//�˻��� �ƴϰ� â�� opne ������ search�� n�̰� �˻��϶��� y
		if(search.equals("y")){
			area3 = request.getParameter("area3");
			vlist = mgr.searchZipcode(area3);
			//out.print(vlist.size());
		}
%>
<!DOCTYPE html>
<html>
<head>
<title>�����ȣ �˻�</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function loadSearch() {
		frm = document.zipFrm;
		if(frm.area3.value==""){
			alert("���θ��� �Է��ϼ���.");
			return;
		}
		frm.action = "zipSearch.jsp";
		frm.submit();
	}

	function sendAdd(zipcode, adds) {
		//opener�� â�� ���½�Ų �θ�â
		opener.document.regFrm.zipcode.value=zipcode;
		opener.document.regFrm.address.value=adds;
		self.close();
	}
</script>
</head>
<body bgcolor="#FFFFCC">
	<div align="center"><br>
	<h3>�����ȣ �˻�</h3>
		<form name="zipFrm" method="post">
			<table>
				<tr>
					<td>
					<br/>���θ� �Է� : 	<input name="area3" value="�������">
						<input type="button" value="�˻�" onclick="loadSearch()">
					</td>
				</tr>
				<!-- �˻� ��� Start -->
				<%
						if(search.equals("y")){
							if(vlist.isEmpty()){
				%>				
				<tr>
					<td align="center"><br>�˻��� ����� �����ϴ�.</td>
				</tr>
				<%
							}else{
				%>
				<tr>
					<td align="center"><br>�ذ˻� ��, �Ʒ� �����ȣ�� Ŭ���ϸ� �ڵ����� �Էµ˴ϴ�.</td>
				</tr>
				<%
								for(int i=0;i<vlist.size();i++){
									ZipcodeBean bean = vlist.get(i);
									String zipcode = bean.getZipcode();
									String adds = bean.getArea1()+" ";
									adds+=bean.getArea2()+" ";
									adds+=bean.getArea3()+" ";
				%>
				<tr>
					<td><a href="#" onclick="javascript:sendAdd('<%=zipcode%>','<%=adds%>')">
					<%=zipcode +" "+ adds%></a></td>
				</tr> 
				<%						
								}//--for
							}//--if-else
						}//--if
				%>
				<!-- �˻� ��� End -->
				<tr>
					<td align="center"><br/>
					<a href="#" onClick="self.close()">�ݱ�</a></td>
				</tr>
			</table>
			<input type="hidden" name="search" value="y">
		</form>
	</div>
</body>
</html>



