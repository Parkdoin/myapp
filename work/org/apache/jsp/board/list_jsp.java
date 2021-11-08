/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.52
 * Generated at: 2021-10-05 07:23:28 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.board;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import board.BoardBean;
import java.util.Vector;
import board.UtilMgr;

public final class list_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("board.BoardBean");
    _jspx_imports_classes.add("java.util.Vector");
    _jspx_imports_classes.add("board.UtilMgr");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=EUC-KR");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<!-- list.jsp -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      board.BoardMgr mgr = null;
      mgr = (board.BoardMgr) _jspx_page_context.getAttribute("mgr", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (mgr == null){
        mgr = new board.BoardMgr();
        _jspx_page_context.setAttribute("mgr", mgr, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write('\r');
      out.write('\n');
      board.BCommentMgr cmgr = null;
      cmgr = (board.BCommentMgr) _jspx_page_context.getAttribute("cmgr", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (cmgr == null){
        cmgr = new board.BCommentMgr();
        _jspx_page_context.setAttribute("cmgr", cmgr, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write('\r');
      out.write('\n');
 
		request.setCharacterEncoding("EUC-KR");
		int totalRecord = 0;//총게시물
		int numPerPage = 10;//페이지당 레코드 개수(5,10,15,30)
		int pagePerBlock = 15;//블럭당 페이지 개수
		int totalPage = 0;//총 페이지 개수
		int totalBlock =0;//총 블럭 개수
		int nowPage = 1;//현재 페이지
		int nowBlock = 1;//현재 블럭
		
		//요청된 numPerPage 처리
		//요청이 있으면 처리가 되지만 요청이 없으면 기본값 10개로 세팅.
		if(request.getParameter("numPerPage")!=null){
			//numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
			numPerPage = UtilMgr.parseInt(request, "numPerPage");
		}
		
		//검색에 필요한 변수
		String keyField = "", keyWord = "";
		//검색일때
		if(request.getParameter("keyWord")!=null){
			keyField = request.getParameter("keyField");
			keyWord = request.getParameter("keyWord");
		}
		
		//검색 후에 다시 처음화면 요청
		if(request.getParameter("reload")!=null&&
		request.getParameter("reload").equals("true")){
			keyField = ""; keyWord = "";
		}
		
		totalRecord = mgr.getTotalCount(keyField, keyWord);
		//out.print("totalRecord : " + totalRecord);
		
		//nowPage 요청
		if(request.getParameter("nowPage")!=null){
			nowPage = UtilMgr.parseInt(request, "nowPage");
		}
		
		//sql문에 limit ?, ? 들어가는 start, cnt  
		int start = (nowPage*numPerPage)-numPerPage;
		int cnt = numPerPage;
		
		//전체페이지 개수
		totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		//전체블럭 개수
		totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
		//현재블럭
		nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>JSP Board</title>\r\n");
      out.write("<link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("	function check() {\r\n");
      out.write("		if(document.searchFrm.keyWord.value==\"\"){\r\n");
      out.write("			alert(\"검색어를 입력하세요.\");\r\n");
      out.write("			document.searchFrm.keyWord.focus();\r\n");
      out.write("			return;\r\n");
      out.write("		}\r\n");
      out.write("		document.searchFrm.submit();\r\n");
      out.write("	}\r\n");
      out.write("\r\n");
      out.write("	function numPerFn(numPerPage) {\r\n");
      out.write("		document.readFrm.numPerPage.value=numPerPage;\r\n");
      out.write("		document.readFrm.submit();\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	function list() {//검색을 통해서 url에 남은 get방식 조건값 초기화\r\n");
      out.write("		document.listFrm.action=\"list.jsp\";\r\n");
      out.write("		document.listFrm.submit();\r\n");
      out.write("	}\r\n");
      out.write("	//list.jsp -> read.jsp 조건 : keyField, keyWord, nowPage, numPerPage\r\n");
      out.write("	function read(num) {\r\n");
      out.write("		document.readFrm.num.value=num;\r\n");
      out.write("		document.readFrm.action=\"read.jsp\";\r\n");
      out.write("		document.readFrm.submit();\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	function pageing(page) {\r\n");
      out.write("		document.readFrm.nowPage.value=page;\r\n");
      out.write("		document.readFrm.submit();\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	function block(block) {\r\n");
      out.write("		document.readFrm.nowPage.value = ");
      out.print(pagePerBlock);
      out.write("*(block-1)+1;\r\n");
      out.write("		document.readFrm.submit();\r\n");
      out.write("	}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body bgcolor=\"#FFFFCC\" >\r\n");
      out.write("<div align=\"center\"><br>\r\n");
      out.write("<h2>JSP Board</h2><br>\r\n");
      out.write("<table>\r\n");
      out.write("	<tr>\r\n");
      out.write("		<td width=\"600\">\r\n");
      out.write("		<b>Total : ");
      out.print(totalRecord);
      out.write("Articles(\r\n");
      out.write("		<font color=\"red\">");
      out.print(nowPage);
      out.write('/');
      out.print(totalPage);
      out.write("</font>)</b>\r\n");
      out.write("		</td>\r\n");
      out.write("		<td align=\"right\">\r\n");
      out.write("			<form name=\"npFrm\" method=\"post\">\r\n");
      out.write("				<select name=\"numPerPage\" size=\"1\" \r\n");
      out.write("				onchange=\"numPerFn(this.form.numPerPage.value)\">\r\n");
      out.write("    				<option value=\"5\">5개 보기</option>\r\n");
      out.write("    				<option value=\"10\" selected>10개 보기</option>\r\n");
      out.write("    				<option value=\"15\">15개 보기</option>\r\n");
      out.write("    				<option value=\"30\">30개 보기</option>\r\n");
      out.write("   				</select>\r\n");
      out.write("   			</form>\r\n");
      out.write("   			<script type=\"text/javascript\">\r\n");
      out.write("   				document.npFrm.numPerPage.value=\"");
      out.print(numPerPage);
      out.write("\";\r\n");
      out.write("   			</script>\r\n");
      out.write("		</td>\r\n");
      out.write("	</tr> \r\n");
      out.write("</table>\r\n");
      out.write("<table>\r\n");
      out.write("	<tr>\r\n");
      out.write("		<td align=\"center\" colspan=\"2\"> \r\n");
      out.write("		");

				Vector<BoardBean> vlist = mgr.getBoardList(keyField, keyWord, start, cnt);
				int listSize = vlist.size();//브라우저 화면에 표시될 번호
				if(vlist.isEmpty()){
					out.println("등록된 게시물이 없습니다.");
				}else{
		
      out.write("\r\n");
      out.write("			<table cellspacing=\"0\">\r\n");
      out.write("				<tr bgcolor=\"#D0D0D0\">\r\n");
      out.write("					<th width=\"100\">번 호</th>\r\n");
      out.write("					<th width=\"250\">제 목</th>\r\n");
      out.write("					<th width=\"100\">이 름</th>\r\n");
      out.write("					<th width=\"150\">날 짜</th>\r\n");
      out.write("					<th width=\"100\">조회수</th>\r\n");
      out.write("				</tr>\r\n");
      out.write("		");
 
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
					//댓글 개수
					int bcount = cmgr.getBCommentCount(num);
		
      out.write("\r\n");
      out.write("				<tr align=\"center\"> \r\n");
      out.write("					<td>");
      out.print(totalRecord-start-i);
      out.write("</td>\r\n");
      out.write("					<td align=\"left\">\r\n");
      out.write("						");
for(int j=0;j<depth;j++){
      out.write("&nbsp;&nbsp;");
}//---for
      out.write("\r\n");
      out.write("						<a href=\"javascript:read('");
      out.print(num);
      out.write("')\">");
      out.print(subject);
      out.write("</a>\r\n");
      out.write("						");
if(filename!=null&&!filename.equals("")){
      out.write("\r\n");
      out.write("							<img alt=\"파일첨부\" src=\"img/icon_file.gif\" align=\"middle\">\r\n");
      out.write("						");
}
      out.write("\r\n");
      out.write("						");
if(bcount>0) {
      out.write("\r\n");
      out.write("							<font color=\"red\">(");
      out.print(bcount);
      out.write(")</font>\r\n");
      out.write("						");
}
      out.write("\r\n");
      out.write("					</td>\r\n");
      out.write("					<td>");
      out.print(name);
      out.write("</td>\r\n");
      out.write("					<td>");
      out.print(regdate);
      out.write("</td>\r\n");
      out.write("					<td>");
      out.print(count);
      out.write("</td>\r\n");
      out.write("				</tr>\r\n");
      out.write("		");
}//--for
      out.write("\r\n");
      out.write("			</table>\r\n");
      out.write("		");
}//--if-else
      out.write("\r\n");
      out.write("		</td>\r\n");
      out.write("	</tr>\r\n");
      out.write("	<tr> \r\n");
      out.write("		<td colspan=\"2\"><br><br></td>\r\n");
      out.write("	</tr>\r\n");
      out.write("	<tr>\r\n");
      out.write("		<td>\r\n");
      out.write("		");
if(totalRecord>0){ 
      out.write("\r\n");
      out.write("			<!-- 이전 블럭 -->\r\n");
      out.write("			");
if(nowBlock>1){
      out.write("\r\n");
      out.write("				<a href=\"javascript:block('");
      out.print(nowBlock-1);
      out.write("')\">prev...</a>\r\n");
      out.write("			");
}
      out.write("\r\n");
      out.write("			<!-- 페이징 -->	\r\n");
      out.write("			");

					int pageStart=(nowBlock-1)*pagePerBlock+1;
					int pageEnd = (pageStart+pagePerBlock)<totalPage?
							pageStart+pagePerBlock:totalPage+1;
					for(;pageStart<pageEnd;pageStart++){
			
      out.write("\r\n");
      out.write("			<a href=\"javascript:pageing('");
      out.print(pageStart);
      out.write("')\">\r\n");
      out.write("			");
if(nowPage==pageStart){ 
      out.write("<font color=\"blue\">");
}
      out.write("\r\n");
      out.write("				[");
      out.print(pageStart);
      out.write("]\r\n");
      out.write("			");
if(nowPage==pageStart){ 
      out.write("</font>");
}
      out.write("\r\n");
      out.write("			</a>\r\n");
      out.write("			");
}//--for
      out.write("\r\n");
      out.write("			<!-- 다음 블럭 -->\r\n");
      out.write("			");
if(nowBlock<totalBlock){
      out.write("\r\n");
      out.write("				<a href=\"javascript:block('");
      out.print(nowBlock+1);
      out.write("')\">..next</a>\r\n");
      out.write("			");
}
      out.write("\r\n");
      out.write("			");
}//---if1
      out.write("\r\n");
      out.write("		</td>\r\n");
      out.write("		<td align=\"right\"> \r\n");
      out.write("			<a href=\"post.jsp\">[글쓰기]</a>\r\n");
      out.write("			<a href=\"javascript:list()\">[처음으로]</a>\r\n");
      out.write("		</td>\r\n");
      out.write("	</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<hr width=\"750\">\r\n");
      out.write("<!-- 검색 Form Start -->\r\n");
      out.write("<form name=\"searchFrm\" method=\"get\" action=\"list.jsp\">\r\n");
      out.write("	<table  width=\"600\" cellpadding=\"4\" cellspacing=\"0\">\r\n");
      out.write(" 		<tr>\r\n");
      out.write("  			<td align=\"center\" valign=\"bottom\">\r\n");
      out.write("   				<select name=\"keyField\" size=\"1\" >\r\n");
      out.write("    				<option value=\"name\"> 이 름</option>\r\n");
      out.write("    				<option value=\"subject\"> 제 목</option>\r\n");
      out.write("    				<option value=\"content\"> 내 용</option>\r\n");
      out.write("   				</select>\r\n");
      out.write("   				<input size=\"16\" name=\"keyWord\">\r\n");
      out.write("   				<input type=\"button\"  value=\"찾기\" onClick=\"javascript:check()\">\r\n");
      out.write("   				<input type=\"hidden\" name=\"nowPage\" value=\"1\">\r\n");
      out.write("  			</td>\r\n");
      out.write(" 		</tr>\r\n");
      out.write("	</table>\r\n");
      out.write("</form>\r\n");
      out.write("<!-- 검색 Form End -->\r\n");
      out.write("<form name=\"readFrm\">\r\n");
      out.write("	<input type=\"hidden\" name=\"keyField\" value=\"");
      out.print(keyField);
      out.write("\">\r\n");
      out.write("	<input type=\"hidden\" name=\"keyWord\" value=\"");
      out.print(keyWord);
      out.write("\">\r\n");
      out.write("	<input type=\"hidden\" name=\"nowPage\" value=\"");
      out.print(nowPage);
      out.write("\">\r\n");
      out.write("	<input type=\"hidden\" name=\"numPerPage\" value=\"");
      out.print(numPerPage);
      out.write("\">\r\n");
      out.write("	<input type=\"hidden\" name=\"num\">\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      out.write("<form name=\"listFrm\" method=\"post\">\r\n");
      out.write("	<input type=\"hidden\" name=\"reload\" value=\"true\">\r\n");
      out.write("	<input type=\"hidden\" name=\"nowPage\" value=\"1\">\r\n");
      out.write("</form>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
