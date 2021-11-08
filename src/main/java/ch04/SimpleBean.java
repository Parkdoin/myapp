package ch04;

/*자바빈즈(JavaBeans) 네이밍
 * 1.테이블+Bean (TeamBean) - JSP 사용
 * 2.테이블+Dto (Data Transfer Object) - Spring 사용
 * 3.테이블+Vo (Value Object) - Spring 사용
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
