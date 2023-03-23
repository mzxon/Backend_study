package oop0323;

import java.io.FileReader;

public class Test03_input {

	public static void main(String[] args) {
		//2)char기반 -> 한글 안깨짐
		
		String filename="I:/java202301/workspace/java_study/basic01_java/src/oop0323/data.txt";
		FileReader fr = null;
		
		try {
			fr = new FileReader(filename);
			
			while(true) {
				int data=fr.read(); //2바이트씩 읽기
				if(data==-1) break;
				System.out.printf("%c",data);
			}
		} catch (Exception e) {
			System.out.println("파일 읽기 실패 : "+ e);
		}finally {
			//자원반납
			try {
				if(fr!=null) {fr.close();}
			}catch (Exception e) {}
		}

	}

}
