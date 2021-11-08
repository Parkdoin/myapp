package mail;

public class MailSend {

	//정상적인 id와 email를 입력 받으면 true 리턴하면서 메일을 보냄.
	public boolean sendPwd(String id, String email) {
		boolean flag = false;
		MemberMgr mgr = new MemberMgr();
		String pwd = mgr.findPwd(id, email);
		if(pwd!=null) {
			String title = "OOO.com에서 id와 pwd를 전송합니다.";
			String content = "id/ pwd :"+id+"/"+pwd;
			GmailSend.send(title, content, email);
			flag=true;
		}
		return flag;
	}
}
