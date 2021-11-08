<!-- pollForm.jsp -->
<%@page import="java.util.Vector"%>
<%@page import="poll.PollListBean"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="poll.PollMgr"/>
<% 
		request.setCharacterEncoding("EUC-KR");
		int num = 0;
		if(request.getParameter("num")!=null)
			num = Integer.parseInt(request.getParameter("num"));
		//설문에 대한 정보
		PollListBean plBean = mgr.getPoll(num);
		//아이템 리스트
		Vector<String> vItem = mgr.getItemList(num);
		String question = plBean.getQuestion();
		int type = plBean.getType();//라디오 or 체크박스
		int active = plBean.getActive();//투표 활성 or 비활성
		int sumCount = mgr.sumCount(num);//총 투표수
%>
<form action="pollFormProc.jsp"> 
<table border="1">
	<tr>
		<td colspan="2" width="300">
			Q : <%=question%><font color="blue"> (<%=sumCount%>)</font>
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<%
				for(int i=0;i<vItem.size();i++){
		%>
		<%if(type==1){%>
			<input type="checkbox" name="itemnum" value="<%=i%>">
		<%}else if(type==0){%>
			<input type="radio" name="itemnum" value="<%=i%>">
		<%}%>
		<%=vItem.get(i)%><br>
		<%}//--for%>
		</td>
	</tr>
	<tr>
		<td width="150">
			<%if(active==1){%>
				<input type="submit" value="투표">
			<%}else{%>
				투표종료
			<%}%>
		</td>
		<td>
			<input type="button" value="결과" 
			onclick="javascript:window.open('pollView.jsp?num=<%=num%>'
			,'pollView','width=500, height=350')">
		</td>
	</tr>
</table>	
<input type="hidden" name="num" value="<%=num%>">
</form>









