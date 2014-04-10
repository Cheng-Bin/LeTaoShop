package com.letao.utils;

import java.util.Arrays;

/**
 * 产生验证码
 * 
 * @author ChengBin
 *
 */
public class SecurityCode {

	/**
	 * 验证码的难易程度选项
	 * 
	 * @author ChengBin
	 *
	 */
	public enum SecurityCodeLevel {Simple,Medium,Hard};
	
	/**
	 * 默认的难易程度
	 * 
	 * @return
	 */
	public static String getSecurityCode(){
		return getSecurityCode(4, SecurityCodeLevel.Medium, false);
	}
	
	 public static String getSecurityCode(int length, SecurityCodeLevel level, boolean isCanRepeat) {
		 
		 char []codes = {
				 '1','2','3','4','5','6','7','8','9',
				 'a','b','c','d','e','f','g','h','i',
				 'j','k','m','n','p','q','r','s','t',
				 'u','v','w','x','y','z','A','B','C',
				 'D','E','F','G','H','I','J','K','L',
				 'M','N','P','Q','R','S','T','U','V',
				 'W','X','Y','Z'
		 }; 
		 
		 if (level == SecurityCodeLevel.Simple) {
			 codes = Arrays.copyOfRange(codes, 0, 9);
		 } else if (level == SecurityCodeLevel.Hard) {
			 codes = Arrays.copyOfRange(codes, 0, 33);
		 }
		 
		 char []results = new char[length];
	
		 int n = codes.length;
		 if (isCanRepeat) {
			 for (int i = 0; i < results.length; i++) {
				 int r = (int) (Math.random()*n);
				 results[i] = codes[r];
			 }
		 } else {
			 for (int i = 0; i < results.length; i++) {
				 int r = (int) (Math.random()*n);
				 results[i] = codes[r];
				 codes[r] = codes[n-1];
				 n--;
			 }
		 }
		 
		 return String.valueOf(results);
	 } 

}
