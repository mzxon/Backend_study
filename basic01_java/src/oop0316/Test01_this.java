package oop0316;

public class Test01_this {

	public static void main(String[] args) {
		//this
		//->클래스가 자신을 가리키는 대명사
		//->일반지역변수와 멤버변수를 구분하기 위함
		Score one = new Score();
		one.disp();
		
		Score two = new Score("김연아", 50, 60, 70);
		two.disp();
		
		Score three = new Score("무궁화", 50, 60, 70);
		three.disp();
		
		//객체가 참조하고 있는 주소
		System.out.println(one.hashCode());
		System.out.println(two.hashCode());
		System.out.println(three.hashCode());
		///////////////////////////////////////////
		
		Score kim = new Score("봉선화", 10, 20, 30);
		Score lee = new Score("라일락", 40, 50, 60);
		Score park = new Score("진달래", 70, 80, 90);
		
		
		//객체 배열
		Score[] score = {
				 new Score("오필승", 11, 22, 33)
				,new Score("코리아", 41, 55, 66)
				,new Score("대한민국", 77, 88, 99)
		};
		
		score[0].disp();
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}
