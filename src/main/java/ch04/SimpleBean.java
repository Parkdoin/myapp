package ch04;

/*�ڹٺ���(JavaBeans) ���̹�
 * 1.���̺�+Bean (TeamBean) - JSP ���
 * 2.���̺�+Dto (Data Transfer Object) - Spring ���
 * 3.���̺�+Vo (Value Object) - Spring ���
 * */

public class SimpleBean {

	private String msg;
	private int cnt;
	
	//getter -> getXxx
	public String getMsg() {
		return msg;
	}
	//setter -> setXxx
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
}
