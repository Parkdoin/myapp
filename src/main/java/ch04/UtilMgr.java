package ch04;

public class UtilMgr {
	//�Ű������� ���������� ���ڿ��̸� true, �������°� �ƴϸ� false
	public static boolean isNumeric(String s) /*"22", "two"*/{
		  try {
		      Integer.parseInt(s);
		      return true;
		  } catch(NumberFormatException e) {
		      return false;
		  }
	}
}
