package oop0316;

public class Test01_constructor {

	public static void main(String[] args) {
		//생성자 함수
		//->클래스명과 동일한 함수
		//->오버로드가 가능하다
		//->new 연산자 함께 메모리 할당할 때 사용한다

		
		//new School();
		
		School one = new School("개나리");
		one.calc();
		one.disp();
		
		School two=new School(70, 80, 90);
		two.calc();
		two.disp();
		
		School three=new School("진달래",70, 80, 90);
		three.calc();
		three.disp();
		
		
	
	}
}
