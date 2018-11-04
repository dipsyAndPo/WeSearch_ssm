package test1;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class testPing {
	public static void main(String[] args) {
		aa("https://www.baidu.com");
		aa("http://www.baidu.com");
		aa("www.baidu.com");
		aa("lol.baidu.com");
	}
	
	public static void aa(String url) {
		boolean b1=url.contains("http://");
		boolean b2=url.contains("https://");
		if(b1) {
			System.out.println(url.substring(7)); 
		}else if(b2) {
			System.out.println(url.substring(8));
		}else {
			System.out.println(url);
		}
	}
}