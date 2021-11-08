/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.52
 * Generated at: 2021-10-05 03:14:27 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.board;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class update2_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes = null;
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

      out.write('\r');
      out.write('\n');
      out.write(' ');
      board.BoardBean bean = null;
      synchronized (session) {
        bean = (board.BoardBean) _jspx_page_context.getAttribute("bean", javax.servlet.jsp.PageContext.SESSION_SCOPE);
        if (bean == null){
          bean = new board.BoardBean();
          _jspx_page_context.setAttribute("bean", bean, javax.servlet.jsp.PageContext.SESSION_SCOPE);
        }
      }
      out.write('\r');
      out.write('\n');
 
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  String numPerPage = request.getParameter("numPerPage");
	  String subject = bean.getSubject();
	  String name = bean.getName(); 
	  String content = bean.getContent();
	  //read.jsp에서 session에 빈즈 단위로 저장 했기 때문에 파일명도 가져 올 수 있다.
	  String filename = bean.getFilename();

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>JSP Board</title>\r\n");
      out.write("<link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<script>\r\n");
      out.write("	function check() {\r\n");
      out.write("	   if (document.updateFrm.pass.value == \"\") {\r\n");
      out.write("		 alert(\"수정을 위해 비밀번호를 입력하세요.\");\r\n");
      out.write("		 document.updateFrm.pass.focus();\r\n");
      out.write("		 return false;\r\n");
      out.write("		 }\r\n");
      out.write("	   document.updateFrm.submit();\r\n");
      out.write("	}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body bgcolor=\"#FFFFCC\">\r\n");
      out.write("<div align=\"center\"><br/><br/>\r\n");
      out.write("<table width=\"600\" cellpadding=\"3\">\r\n");
      out.write("  <tr>\r\n");
      out.write("   <td bgcolor=\"#FF9018\"  height=\"21\" align=\"center\">수정하기2</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("<form name=\"updateFrm\" method=\"post\" action=\"boardUpdate2\" enctype=\"multipart/form-data\">\r\n");
      out.write("<table width=\"600\" cellpadding=\"7\">\r\n");
      out.write(" <tr>\r\n");
      out.write("  <td>\r\n");
      out.write("   <table>\r\n");
      out.write("    <tr>\r\n");
      out.write("     <td width=\"20%\">성 명</td>\r\n");
      out.write("     <td width=\"80%\">\r\n");
      out.write("	  <input name=\"name\" value=\"");
      out.print(name);
      out.write("\" size=\"30\" maxlength=\"20\">\r\n");
      out.write("	 </td>\r\n");
      out.write("	</tr>\r\n");
      out.write("	<tr>\r\n");
      out.write("     <td>제 목</td>\r\n");
      out.write("     <td>\r\n");
      out.write("	  <input name=\"subject\" size=\"50\" value=\"");
      out.print(subject);
      out.write("\" maxlength=\"50\">\r\n");
      out.write("	 </td>\r\n");
      out.write("    <tr>\r\n");
      out.write("     <td>내 용</td>\r\n");
      out.write("     <td>\r\n");
      out.write("	  <textarea name=\"content\" rows=\"10\" cols=\"50\">");
      out.print(content);
      out.write("</textarea>\r\n");
      out.write("	 </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("    <td>첨부파일</td>\r\n");
      out.write("     <td>\r\n");
      out.write("     	");
      out.print(filename!=null?filename:"첨부된 파일이 없습니다.");
      out.write("\r\n");
      out.write("     	<input type=\"file\" name=\"filename\" size=\"50\" maxlength=\"50\">\r\n");
      out.write("     </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("	<tr>\r\n");
      out.write("     <td>비밀 번호</td> \r\n");
      out.write("     <td><input type=\"password\" name=\"pass\" size=\"15\" maxlength=\"15\">\r\n");
      out.write("      수정 시에는 비밀번호가 필요합니다.</td>\r\n");
      out.write("    </tr>\r\n");
      out.write("	<tr>\r\n");
      out.write("     <td colspan=\"2\" height=\"5\"><hr/></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("	<tr>\r\n");
      out.write("     <td colspan=\"2\">\r\n");
      out.write("	  <input type=\"button\" value=\"수정완료\" onClick=\"check()\">\r\n");
      out.write("      <input type=\"reset\" value=\"다시수정\"> \r\n");
      out.write("      <input type=\"button\" value=\"뒤로\" onClick=\"history.go(-1)\">\r\n");
      out.write("	 </td>\r\n");
      out.write("    </tr> \r\n");
      out.write("   </table>\r\n");
      out.write("  </td>\r\n");
      out.write(" </tr>\r\n");
      out.write("</table>\r\n");
      out.write(" <input type=\"hidden\" name=\"nowPage\" value=\"");
      out.print(nowPage );
      out.write("\">\r\n");
      out.write(" <input type='hidden' name=\"num\" value=\"");
      out.print(num);
      out.write("\">\r\n");
      out.write(" <input type='hidden' name=\"numPerPage\" value=\"");
      out.print(numPerPage);
      out.write("\">\r\n");
      out.write("</form> \r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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
