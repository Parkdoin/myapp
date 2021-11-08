<!-- home.jsp -->
<%@page import="photoBlog.PReplyBean"%>
<%@page import="photoBlog.PBlogBean"%>
<%@page import="photoBlog.PMemberBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pmgr" class="photoBlog.PBlogMgr"/>
<jsp:useBean id="rmgr" class="photoBlog.PReplyMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		//세션에 id를 가져온다.
		String id = (String)session.getAttribute("idKey");
		if(id==null) //로그인이 안된 상태
			response.sendRedirect("login.jsp");
		//로그인 정보
		PMemberBean mbean = pmgr.getPMember(id);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<title>PhotoBlog</title>
	<%@include file="js_css.html" %>
	<script type="text/javascript">
		function goURL(url, gid) {
			document.frm1.action=url;
			document.frm1.gid.value=gid;
			document.frm1.submit();
		}
		function del(num) {
			document.frm.action = "pBlogDelete";
			document.frm.num.value=num;
			document.frm.submit();
		}
		function heart(num) {
			document.frm.action = "pBlogUpHCnt";
			document.frm.num.value=num;
			document.frm.submit();
		}
		function cmtPost(num) {
			document.frm.action = "pReplyPost";
			cmt = document.getElementById("comment"+num);
			document.frm.comment.value=cmt.value;
			document.frm.num.value=num;
			document.frm.id.value="<%=id%>";
			document.frm.submit();
		}
		function rDel(rnum) {
			document.frm.action = "pReplyDelete";
			document.frm.rnum.value=rnum;
			document.frm.submit();
		}
	</script>
</head>
<body>
<div data-role="page" align="center">
	<div data-role="header">
		<table>
			<tr>
				<td align="left" width="200">
					<h1 style="font-family: fantasy;" align="left">PhotoBlog</h1></td>
				<td>
					<a style="font-size:40px;" href="javascript:goURL('home.jsp','')">H</a>
					<a style="font-size:40px;" href="javascript:goURL('post.jsp','')">P</a>
				</td>
				<td>	
					<div class="box" style="background: #BDBDBD;">
						<img  align="bottom" class="profile" src="photo/<%=mbean.getProfile()%>" 
						width="30" height="30" onclick="location='logout.jsp'">
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div data-role="content">
	<!-- 랜덤한 5명의 리스트 Start-->
	<table>
		<tr>
		<%
				Vector<PMemberBean> mvlist = pmgr.listPMember(id);
				for(int i=0;i<mvlist.size();i++){
					PMemberBean mvbean = mvlist.get(i);
		%>
		<td width="80">
		<div class="box1" style="background: #BDBDBD;">
			<a href="javascript:goURL('guest.jsp','<%=mvbean.getId()%>')">
			<img class="profile"  width="30" height="30"
			src="photo/<%=mvbean.getProfile()%>"></a>
		</div>
		<div><h4><%=mvbean.getName()%></h4></div>
		</td>
		<%}//--for%>
		</tr>
	</table>
	<!-- 랜덤한 5명의 리스트 End-->
	<!-- PhotoBlog List Start -->
	<table>
	<%
			Vector<PBlogBean> pvlist = pmgr.listPBlog(id);
			for(int i=0;i<pvlist.size();i++){
				//포토블로그
				PBlogBean pbean = pvlist.get(i);
				//포토블로그 작성한 사람의 정보
				PMemberBean tmbean = pmgr.getPMember(pbean.getId());			
	%>
		<tr>
			<td width="30">
				<div class="box" style="background: #BDBDBD;">
					<img class="profile" width="30" height="30"
					src="photo/<%=tmbean.getProfile()%>">
				</div>
			</td>
			<td width="250"><%=tmbean.getId() %></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="3">
				<img src="photo/<%=pbean.getPhoto()%>" 
				width="350" height="150">
			</td>
		</tr>
		<tr>
			<td colspan="3"><b><%=pbean.getMessage()%></b></td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="javascript:heart('<%=pbean.getNum()%>')">
					<img src="img/heart.jpg" align="top">
				</a>좋아요 <%=pbean.getHcnt() %>개
			</td>
			<td align="center">
				<a href="javascript:del('<%=pbean.getNum()%>')">DEL</a>
			</td>
		</tr>
		<!-- Reply List Start -->
		<tr>
			<td colspan="3">
			<%
					Vector<PReplyBean> rvlist= rmgr.listPReply(pbean.getNum());
					for(int j=0;j<rvlist.size();j++){
						PReplyBean rbean = rvlist.get(j);
			%>
			<b><%=rbean.getId()%></b>&nbsp;<%=rbean.getComment()%>&nbsp;
			<%if(id.equals(rbean.getId())){%>
				<a href="javascript:rDel('<%=rbean.getRnum()%>')">x</a>
			<%}%><br>
			<%}//--for%>
			</td>
		</tr>
		<!-- Reply List End -->
		<!-- Reply Form Start -->
		<tr>
			<td colspan="2">
				<input id="comment<%=pbean.getNum()%>" placeholder="댓글달기..." size="50">
			</td>
			<td align="center">
				<a href="javascript:cmtPost('<%=pbean.getNum()%>')">게시</a>
			</td>
		</tr>
		<!-- Reply Form End -->
		<tr>
			<td colspan="3"><br></td>
		</tr>
		<%}//--for %>
	</table>
	<!-- PhotoBlog List End -->
	</div>
	<form method="post" name="frm">
		<input type="hidden" name="num">
		<input type="hidden" name="comment">
		<input type="hidden" name="rnum">
		<input type="hidden" name="id">
	</form>
	<form method="post" name="frm1" action="home.jsp">
		<input type="hidden" name="gid">
	</form>
	<%@include file="footer.jsp" %>
</div>
</body>
</html>









