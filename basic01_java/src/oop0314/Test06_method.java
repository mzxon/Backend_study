package oop0314;

public class Test06_method {

	//메소드 작성 영역
	
	//void 리턴값이 없다
	
	public static void test1() {
		System.out.println("JAVA");
	}
	
	public static void test2() {
		System.out.println("PYTHON");
		return; //함수를 호출한 시점으로 되돌아 간다.
			    //마지막 return명령어는 생략 가능하다.
	}
	
	public static void test3(int a) {
		System.out.println(a);
		return;
	}
	
	public static void test4(int a, int b, int c) {
		System.out.println(a+b+c);
		return;
	}
	
	public static void test5(double a, double b) {
		System.out.println(a+b);
		return;
	}

	public static void test6(char c, byte n) {
		for(int a=1; a<=n; a++) {
			System.out.print(c);
		}
	}
	
	public static void main(String[] args) {
		//Method 메소드
		//함수, function, 프로시저
		
		//1. 리턴값이 없는 함수
		
		//1) 전달값(argument value)이 없는 경우
		test1();	//함수 호출
		test2();
		test1();
		
		//2) 전달값이 있는 경우
		test3(10);
		test4(20, 30, 40);
		test5(1.2, 3.4);
		
		//문제) #기호를 100번 출력하시오
		byte num=100;
		char ch='#';
		test6(ch, num);
	}

}
