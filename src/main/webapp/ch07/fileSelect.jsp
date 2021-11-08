<!-- fileSelect.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<!-- 파일업로드 : post, multipart/form-data -->
<form method="post" enctype="multipart/form-data" action="viewPage.jsp">
	user : <input name="user" value="홍길동"><br>
	title : <input name="title" value="파일업로드"><br>
	file : <input type="file" name="upload"><br>
	<input type="submit" value="UPLOAD">
</form>
