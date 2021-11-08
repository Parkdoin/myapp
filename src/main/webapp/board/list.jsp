<!-- list.jsp -->
<%@page import="board.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="board.UtilMgr"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="board.BoardMgr"/>
<jsp:useBean id="cmgr" class="board.BCommentMgr"/>
<% 
		request.setCharacterEncoding("EUC-KR");
		int totalRecord = 0;//�ѰԽù�
		int numPerPage = 10;//�������� ���ڵ� ����(5,10,15,30)
		int pagePerBlock = 15;//���� ������ ����
		int totalPage = 0;//�� ������ ����
		int totalBlock =0;//�� �� ����
		int nowPage = 1;//���� ������
		int nowBlock = 1;//���� ��
		
		//��û�� numPerPage ó��
		//��û�� ������ ó���� ������ ��û�� ������ �⺻�� 10���� ����.
		if(request.getParameter("numPerPage")!=null){
			//numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
			numPerPage = UtilMgr.parseInt(request, "numPerPage");
		}
		
		//�˻��� �ʿ��� ����
		String keyField = "", keyWord = "";
		//�˻��϶�
		if(request.getParameter("keyWord")!=null){
			keyField = request.getParameter("keyField");
			keyWord = request.getParameter("keyWord");
		}
		
		//�˻� �Ŀ� �ٽ� ó��ȭ�� ��û
		if(request.getParameter("reload")!=null&&
		request.getParameter("reload").equals("true")){
			keyField = ""; keyWord = "";
		}
		
		totalRecord = mgr.getTotalCount(keyField, keyWord);
		//out.print("totalRecord : " + totalRecord);
		
		//nowPage ��û
		if(request.getParameter("nowPage")!=null){
			nowPage = UtilMgr.parseInt(request, "nowPage");
		}
		
		//sql���� limit ?, ? ���� start, cnt  
		int start = (nowPage*numPerPage)-numPerPage;
		int cnt = numPerPage;
		
		//��ü������ ����
		totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		//��ü�� ����
		totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
		//�����
		nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
%>
<!DOCTYPE html>
<html>
<head>
<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function check() {
		if(document.searchFrm.keyWord.value==""){
			alert("�˻�� �Է��ϼ���.");
			document.searchFrm.keyWord.focus();
			return;
		}
		document.searchFrm.submit();
	}

	function numPerFn(numPerPage) {
		document.readFrm.numPerPage.value=numPerPage;
		document.readFrm.submit();
	}
	
	function list() {//�˻��� ���ؼ� url�� ���� get��� ���ǰ� �ʱ�ȭ
		document.listFrm.action="list.jsp";
		document.listFrm.submit();
	}
	//list.jsp -> read.jsp ���� : keyField, keyWord, nowPage, numPerPage
	function read(num) {
		document.readFrm.num.value=num;
		document.readFrm.action="read.jsp";
		document.readFrm.submit();
	}
	
	function pageing(page) {
		document.readFrm.nowPage.value=page;
		document.readFrm.submit();
	}
	
	function block(block) {
		document.readFrm.nowPage.value = <%=pagePerBlock%>*(block-1)+1;
		document.readFrm.submit();
	}
</script>
</head>
<body bgcolor="#FFFFCC" >
<div align="center"><br>
<h2>JSP Board</h2><br>
<table>
	<tr>
		<td width="600">
		<b>Total : <%=totalRecord%>Articles(
		<font color="red"><%=nowPage%>/<%=totalPage%></font>)</b>
		</td>
		<td align="right">
			<form name="npFrm" method="post">
				<select name="numPerPage" size="1" 
				onchange="numPerFn(this.form.numPerPage.value)">
    				<option value="5">5�� ����</option>
    				<option value="10" selected>10�� ����</option>
    				<option value="15">15�� ����</option>
    				<option value="30">30�� ����</option>
   				</select>
   			</form>
   			<script type="text/javascript">
   				document.npFrm.numPerPage.value="<%=numPerPage%>";
   			</script>
		</td>
	</tr> 
</table>
<table>
	<tr>
		<td align="center" colspan="2"> 
		<%
				Vector<BoardBean> vlist = mgr.getBoardList(keyField, keyWord, start, cnt);
				int listSize = vlist.size();//������ ȭ�鿡 ǥ�õ� ��ȣ
				if(vlist.isEmpty()){
					out.println("��ϵ� �Խù��� �����ϴ�.");
				}else{
		%>
			<table cellspacing="0">
				<tr bgcolor="#D0D0D0">
					<th width="100">�� ȣ</th>
					<th width="250">�� ��</th>
					<th width="100">�� ��</th>
					<th width="150">�� ¥</th>
					<th width="100">��ȸ��</th>
				</tr>
		<% 
				for(int i=0;i<numPerPage;i++){
					if(i==listSize) break;
					BoardBean bean = vlist.get(i);
					int num = bean.getNum();
					String subject = bean.getSubject();
					String name = bean.getName();
					String regdate = bean.getRegdate();
					int depth = bean.getDepth();
					int count = bean.getCount();
					String filename = bean.getFilename();
					//��� ����
					int bcount = cmgr.getBCommentCount(num);
		%>
				<tr align="center"> 
					<td><%=totalRecord-start-i%></td>
					<td align="left">
						<%for(int j=0;j<depth;j++){%>&nbsp;&nbsp;<%}//---for%>
						<a href="javascript:read('<%=num%>')"><%=subject%></a>
						<%if(filename!=null&&!filename.equals("")){%>
							<img alt="����÷��" src="img/icon_file.gif" align="middle">
						<%}%>
						<%if(bcount>0) {%>
							<font color="red">(<%=bcount%>)</font>
						<%}%>
					</td>
					<td><%=name%></td>1
					<td><%=regdate%></td>
					<td><%=count%></td>
				</tr>
		<%}//--for%>
			</table>
		<%}//--if-else%>
		</td>
	</tr>
	<tr> 
		<td colspan="2"><br><br></td>
	</tr>
	<tr>
		<td>
		<%if(totalRecord>0){ %>
			<!-- ���� �� -->
			<%if(nowBlock>1){%>
				<a href="javascript:block('<%=nowBlock-1%>')">prev...</a>
			<%}%>
			<!-- ����¡ -->	
			<%
					int pageStart=(nowBlock-1)*pagePerBlock+1;
					int pageEnd = (pageStart+pagePerBlock)<totalPage?
							pageStart+pagePerBlock:totalPage+1;
					for(;pageStart<pageEnd;pageStart++){
			%>
			<a href="javascript:pageing('<%=pageStart%>')">
			<%if(nowPage==pageStart){ %><font color="blue"><%}%>
				[<%=pageStart%>]
			<%if(nowPage==pageStart){ %></font><%}%>
			</a>
			<%}//--for%>
			<!-- ���� �� -->
			<%if(nowBlock<totalBlock){%>
				<a href="javascript:block('<%=nowBlock+1%>')">..next</a>
			<%}%>
			<%}//---if1%>
		</td>
		<td align="right"> 
			<a href="post.jsp">[�۾���]</a>
			<a href="javascript:list()">[ó������]</a>
		</td>
	</tr>
</table>
<hr width="750">
<!-- �˻� Form Start -->
<form name="searchFrm" method="get" action="list.jsp">
	<table  width="600" cellpadding="4" cellspacing="0">
 		<tr>
  			<td align="center" valign="bottom">
   				<select name="keyField" size="1" >
    				<option value="name"> �� ��</option>
    				<option value="subject"> �� ��</option>
    				<option value="content"> �� ��</option>
   				</select>
   				<input size="16" name="keyWord">
   				<input type="button"  value="ã��" onClick="javascript:check()">
   				<input type="hidden" name="nowPage" value="1">
  			</td>
 		</tr>
	</table>
</form>
<!-- �˻� Form End -->
<form name="readFrm">
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
	<input type="hidden" name="num">
</form>

<form name="listFrm" method="post">
	<input type="hidden" name="reload" value="true">
	<input type="hidden" name="nowPage" value="1">
</form>
</div>
</body>
</html>











