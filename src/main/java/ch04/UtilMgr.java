package ch04;

public class UtilMgr {
	//매개변수가 숫자형태의 문자열이면 true, 숫자형태가 아니면 false
	public static boolean isNumeric(String s) /*"22", "two"*/{
		  try {
		      Integer.parseInt(s);
		      return true;
		  } catch(NumberFormatException e) {
		      return false;
		  }
	}
}
