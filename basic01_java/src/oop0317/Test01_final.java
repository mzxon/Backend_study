package oop0317;

import java.util.Calendar;

//1)final 클래스 (종단클래스)
/*
final class Animal{}
class Elephant extends Animal{} 에러. final클래스는 상속 받을 수 없다
*/

//2)final 메소드
class Fruit{
	void view() {}
	final void disp() {}
}

class Apple extends Fruit { //자식클래스 extends 부모클래스

	@Override	//<-annotation
	void view() {}
	
	/*
	@Override
	void disp() {} 에러. final메소드는 더이상 오버라이드 할 수 없다.
	*/
}

public class Test01_final {

	public static void main(String[] args) {
		//final 마지막
		//변수 : 변수를 상수화
		//함수 : 더 이상 리폼(override 재정의)할 수 없다.
		//클래스 : 종단클래스. 후손클래스를 생성할 수 없다.
		
		int a=3;
		a=5; //변수는 다른값으로 대입 가능
		
		final int b=2;
		//b=4; 에러. final변수는 다른값으로 대입 불가능
		
		System.out.println(Calendar.YEAR);		//1
		System.out.println(Calendar.MONTH);		//2
		System.out.println(Calendar.DATE);		//5

		System.out.println(Calendar.HOUR);		//10
		System.out.println(Calendar.MINUTE);	//12
		System.out.println(Calendar.SECOND);	//13


		/*
			class Calendar {
				static final int YEAR=1;
				static final int MONTH=2;
				static final int DATE=5;
		
			}
		*/
		
		//Calendar.YEAR=3; final변수값은 변경할 수 없다
		
	}

}
