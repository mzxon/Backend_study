package oop0316;

public class Test03_quiz {

	public static void main(String[] args) {
		//String 관련 연습문제
		
		//문1) 이메일 주소에 @문자 있으면
        //    @글자 기준으로 문자열을 분리해서 출력하고
        //    @문자 없다면 "이메일주소 틀림" 메세지를 출력하시오        
        /*    
              출력결과
              webmaster
              itwill.co.kr
        */
		
		String email = new String("webmaster@itwill.co.kr");
		
		int num = email.indexOf("@");
		if(num==-1) System.out.println("이메일 주소 틀림");
		System.out.println(email.substring(0, num));
		System.out.println(email.substring(num+1, email.length()));
		
		
		///////////////////////////////////////////////////
		
		//문2) 이미지 파일만 첨부 (.png .jpg .gif)
		/*
		 	출력결과
		 	파일명 : sky2023.03.16
		 	확장명 : jpg
		*/
		
		
		String image = new String("sky2023.03.16.jpg");
		
		int n = image.lastIndexOf(".");
		
		String file1 = new String();
		file1=(image.substring(n+1,image.length()));
		
		System.out.print("파일명 : ");
		System.out.println(image.substring(0, image.length()-file1.length()-1));
		System.out.print("확장명 : ");
		System.out.println(file1);
		
		//
		System.out.println("---------------------");
		
		String path=new String("i:/frontend/images/sky2023.03.16.jpg");
		
		//path에서 마지막 "/" 기호의 순서값
		int lastSlash=path.lastIndexOf("/");
		
		//전체 파일명
		String file = path.substring(lastSlash+1);
		System.out.println("전체파일명 : "+file);
		
		//file에서 마지막 "." 기호의 순서값
		int lastDot = file.lastIndexOf(".");
		
		//파일명
		String filename = file.substring(0, lastDot);
		System.out.println("파일명 : "+filename);
		
		//확장명
		String ext=file.substring(lastDot+1);
		System.out.println("확장명 : "+ext);
		
		//확장명을 전부 소문자로 치환
		ext=ext.toLowerCase();
		if(ext.equals("png") || ext.equals("jpg") || ext.equals("gif")) {
			System.out.println("파일이 전송되었습니다.");
		}
		else System.out.println("이미지 파일만 가능합니다.");
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	}
}
