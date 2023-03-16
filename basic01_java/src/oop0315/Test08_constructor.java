package oop0315;

public class Test08_constructor {

	public static void main(String[] args) {
		//생성자 함수
	
		//new School(); 객체 또는 Instance
		//new School();
		
		School one = new School();
		System.out.println(one.hashCode());
		one.calc();
		one.disp();
		
		String a=new String(); //빈문자열
		String b=null;		   //메모리할당은 하지 않고 b라는 참조변수 선언만 해놓음
		System.out.println(a.length());
		System.out.println(b.length());
		
		System.out.println("null");		
		
	}
}