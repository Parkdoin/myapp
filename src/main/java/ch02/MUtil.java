package ch02;

import java.util.Random;

public class MUtil {

	//Random 색상을 리턴
	public static String randomColor() {
		Random r = new Random();
		String rgb = Integer.toHexString(r.nextInt(256));
		rgb += Integer.toHexString(r.nextInt(256));
		rgb += Integer.toHexString(r.nextInt(256));
		return "#"+rgb;
	} 
	
}
