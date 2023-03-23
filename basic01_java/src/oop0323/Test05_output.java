package oop0323;

import java.io.FileWriter;
import java.io.PrintWriter;

public class Test05_output {

	public static void main(String[] args) {
		//메모장 파일에 출력하기
		
		//출력파일 (sungjuk.txt)이
		//->없으면 파일은 생성된다(create)
		//->있으면 덮어쓰기(overwrite) 또는 추가(append)

		String filename="I:/java202301/workspace/java_study/basic01_java/src/oop0323/sungjuk.txt";
		
		FileWriter fw=null;
		PrintWriter out=null;
		
		try {
			//true : append 모드
			//false : overwrite 모드
			fw=new FileWriter(filename, false);
			
			//autoFlush : true 버퍼클리어
			out=new PrintWriter(fw, true);
			
			//oop0313.Test07_format.java
			//out.printf();
			
			out.println("무궁화,95,90,100");
			out.println("홍길동,100,100,100");
			out.println("라일락,90,95,35");
			out.println("개나리,85,70,78");
			out.println("진달래,35,40,60");
			
			System.out.println("sungjuk.txt 데이터 파일 완성!");
			
		} catch (Exception e) {
			System.out.println("파일 쓰기 실패 : "+e);
		} finally {
			//자원반납
			try {
				if(out!=null) out.close();
			} catch (Exception e2) {}
			try {
				if(fw!=null) fw.close();
				
			} catch (Exception e2) {}
		}
		
		
	}

}
