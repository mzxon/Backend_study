package oop0321;

abstract class Animal { //추상클래스
	String name;
	void view() {}	//일반메소드
	abstract void disp();	//추상메소드(미완성)
}

class Elephant extends Animal{
	@Override
	void disp() {
		System.out.println("점보");
		
	}
}

class Tuna extends Animal{
	@Override
	void disp() {
		System.out.println("니모");
		
	}
}
