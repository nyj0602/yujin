package AES128;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

public class Exam {
	public static void main(String[] args) throws Exception {
		AES128Cipher aes = new AES128Cipher();
		String a = "안녕하세요";
		String b = aes.encAES(a);
		String c = aes.decAES(b);
		System.out.println("암호화안된키 = "+a);
		System.out.println("암호화된키 = "+b);
		System.out.println("복호화된키 = " + c);
		
	}
}

