package mail;

public class MailSend {

	//�������� id�� email�� �Է� ������ true �����ϸ鼭 ������ ����.
	public boolean sendPwd(String id, String email) {
		boolean flag = false;
		MemberMgr mgr = new MemberMgr();
		String pwd = mgr.findPwd(id, email);
		if(pwd!=null) {
			String title = "OOO.com���� id�� pwd�� �����մϴ�.";
			String content = "id/ pwd :"+id+"/"+pwd;
			GmailSend.send(title, content, email);
			flag=true;
		}
		return flag;
	}
}