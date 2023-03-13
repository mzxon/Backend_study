package oop0313;

public class Test4_operator {

	public static void main(String[] args) {
		//연산자
		//산술, 비교(관계), 논리연산자
		//삼항, 대입, 1증감 연산자
		
		System.out.println(5/3); //1
		System.out.println(5%3); //2

		System.out.println(3/5); //0 정수값과의 연산은 결과값도 정수형으로 반한된다.
		System.out.println(3%5); //3

		System.out.println(3.0/5.0); //0.6
		System.out.println(3/5.0);   //0.6
		System.out.println(3.0/5);   //0.6
		System.out.println(3/5.);    //0.6
		//////////////////////////////////////////////
	
		
		//bit 연산자
		
		//1) 비트곱, 비트합연산자
		System.out.println(5&3);	//1
		System.out.println(5|3);	//7
		/*
			2진수 : 0 1
			8진수 : 0 1 2 3 4 5 6 7
		   10진수 : 0 1 2 3 4 5 6 7 8 9
		   10진수 : 0 1 2 3 4 5 6 7 8 9 a b c d e f
		   
		   10진수 5를 2진수 변환 -> 101
		   
		   5 -> 	00000101		00000101
		   3 ->   & 00000011	   |00000011
				  -----------      ----------
				  	00000001		----1111
		
		*/
		
		
		//2) 비트 부정 연산자
		System.out.println(~5); 	//-6
		//	~(00000101)
		//	  11111010 
		
		//3) shift 연산자
		System.out.println(16<<3);	//128 left shift
		System.out.println(16>>3);	//2   right shift
		/*
		 	16을 2진수 변환		
		 		 00010000		00010000
		 	<<3  10000000   <<3 00000010
		 	--------------  -------------
		 		  128			 	  2	
		 			
		 			
		 */	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}
