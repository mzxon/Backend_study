package oop0313;

public class Test05_conversion {

	public static void main(String[] args) {
		//자료형 변환(Datatype Conversion)
		
		//1. 자동형변환
		//정수형 : byte < short < int < long
		//실수형 : float < double
		//정수형과 실수형이 연산이 되면 자동으로 실수형화 된다
		byte a=3;
		int b=a; //자동형변환
		long c=b;
		//a=c; 에러
		
		float d=3.14f;
		double e=d;	//자동형변환
		
		int kor=80, eng=95, mat=100;
		System.out.println((kor+eng+mat)/3);	//91
		System.out.println((kor+eng+mat)/3.0);	//91.666
		System.out.println((kor+eng+mat)/3.);	//91666
		//////////////////////////////////////////////////
		
		
		//2. 강제형변화 (Cast)연간자
		//-> 필요한 곳에서 일시적으로 변환
		//-> 형식) (자료형) 값
		
		System.out.println((int)3.5);	//3
		System.out.println((double)4);	//4.0
		System.out.println((int)2.6 + (int)5.7);	//2+5
		System.out.println((int)(2.6+5.7));	//(int)(8.3)
		

		//ASCII(American Standard Code for Information Interchange)
        //->문자를 숫자로 기억하기 위한 총 128개의 부호
        //->미국 ANSI에서 표준화한 정보교환용 7비트 부호체계
        //->키보드에 있는 자판은 대부분 아스키코드값이 존재하고, 프로그래밍에서 활용할 수 있다.
		
		System.out.println((int)'A');	//65
		System.out.println((int)'B');	//66
		System.out.println((int)'C');	//67

		System.out.println((int)'a');	//97
		System.out.println((int)'b');	//98
		System.out.println((int)'c');	//99
		
		System.out.println((char)65);
		System.out.println((char)66);
		System.out.println((char)67);
		
		System.out.println((char)97);
		System.out.println((char)98);
		System.out.println((char)99);
		
		System.out.println((int)' ');	//32
		System.out.println((int)'\r'); 	//13
		
		System.out.println('A'<'a'); 	//true
						 //65 < 97
		
		//문) 임의의 문자가 소문자인지 확인하시오
		//	  소문자 'a' ~ 'z'
		char ch='r';
		String result=(ch>='a' && ch<='z') ? "소문자" : "기타";
					// 'r>='a'	  'r'<='z'
					// true			true
					// true
		System.out.println(ch+result);
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}
