<!-- flist.jsp -->
<%@page import="ch07.UtilMgr"%>
<%@page import="ch07.FileloadBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="ch07.FileloadMgr"/>
<% 
		Vector<FileloadBean> vlist = mgr.listFile();	
		//out.print(vlist.size());
%>
<!doctype html>
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function allChk() {
		f=document.frm;
		if(f.allCh.checked/*체크가 된 상태*/){
			for(i=1;i<f.fch.length;i++){
				f.fch[i].checked=true;
			}
			f.btn.disabled=false;//버튼의 활성화
			f.btn.style.color ="blue";
		}else{
			for(i=1;i<f.fch.length;i++){
				f.fch[i].checked=false;
			}
			f.btn.disabled=true;//버튼의 비활성화
			f.btn.style.color ="gray";
		}
	}
	
	function chk() {
		f=document.frm;
		for(i=1;i<f.fch.length;i++){
			if(f.fch[i].checked/*fch 체크인 경우*/){
				f.btn.disabled=false;//버튼의 활성화
				f.btn.style.color ="blue";
				return;//function 전체를 빠져 나감.
			}//---if
		}//---for
		f.allCh.checked=false;
		f.btn.disabled=true;//버튼의 비활성화
		f.btn.style.color ="gray";
	}
	
	function downFn(file) {
		df=document.downFrm;
		df.upFile.value=file;
		df.submit();
	}
</script>
</head>
<body>
<div align="center">
<h2>File List</h2>
<form name="frm" action="fdeleteProc.jsp">
<!-- 업로된 파일이 한개이면 fch가 배열이 안되기 때문에 fch value값을 0을 히든타입으로 추가 -->
<input type="hidden" name="fch" value="0">
<table border="1" width="300">
	<tr align="center">
		<td><input type="checkbox" name="allCh" onclick="allChk()"></td>
		<td>번호</td>
		<td>파일명</td>
		<td>파일크기</td>
	</tr>
	<%
			for(int i=0;i<vlist.size();i++){
				FileloadBean bean = vlist.get(i);
				int num = bean.getNum();
				String upFile = bean.getUpFile();
				int size = bean.getSize();
	%>
	<tr align="center">
		<td><input type="checkbox" value="<%=num%>" name="fch" 
		onclick="chk()"></td>
		<td><%=i+1%></td>
		<td>
			<%-- <a href="upload/<%=upFile%>" download><%=upFile%></a> --%>
			<a href="javascript:downFn('<%=upFile%>')"><%=upFile%></a>
		</td>
		<td><%=UtilMgr.monFormat(size)%>byte</td>
	</tr>
	<%}//---for%>
	<tr>
		<td colspan="4">
			<!-- disabled : 비활성화 -->
			<input type="submit" name="btn" value="DELETE" disabled>
		</td>
	</tr> 
</table>
</form><p>
<a href="fupload.jsp">입력폼</a>
<form name="downFrm" method="post" action="fdownload.jsp">
	<input type="hidden" name="upFile">
</form>
</div>
</body>
</html>








