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
	}
}
