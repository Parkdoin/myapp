<!-- script.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<!-- ���� : �ʵ� �� �޼ҵ� ���� ���� -->
<%!
      	String declaration  = "����";
		
		public String decMethod(){
			return declaration;	
		}
%>
<!-- ��ũ��Ʈ�� : _jspService �޼ҵ� �ȿ� ���Ǵ� ���� -> �޼ҵ� ���� �Ұ�-->
<%
      	String scriptlet = "��ũ��Ʈ��";
		String comment = "�ּ�";
		out.println("���尴ü�� �̿��� ��� : " + declaration +"<p>");
		//public void prn(){} -> ��ũ��Ʈ�� �ȿ��� �޼ҵ� ���� �Ұ� -> ���� Ȯ��
%>
<!-- ǥ���� : _jspService �޼ҵ� �ȿ� ����� ������ �������� ��µǴ� �ڵ�-->
<%=declaration%><p>
<!-- ��Ŭ���� ����Ű : ctrl+alt+����Ű : ���� Ŀ�� ���� -->
<%=decMethod()%><p>
<%=scriptlet%><p>










