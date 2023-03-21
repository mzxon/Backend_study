package oop0317;


class Sungjuk {
	private String name;
	private int kor, eng, mat;
	private int aver;
	
	//기본 생성자 함수 default constructor
	public Sungjuk() {
		//생성자 함수도 자신의 다른 생성자 함수를 호출할 수 있다.
		//Sungjuk("손흥민");에러
		
		this("손흥민"); //다른 생성자 함수를 호출할 때는 this
	}
	
	public Sungjuk(String name) {
		this.name=name;
	}
	
	public Sungjuk(int kor, int eng, int mat) {
		this("박지성");
		this.kor=kor;
		this.eng=eng;
		this.mat=mat;
		//this("박지성"); //에러 자신의 생성자 함수를 호출하는 경우 첫줄에서 호출한다.
	}
	
	public Sungjuk(int aver) {
		disp(); //생성자 함수에서 일반 메소드를 호출 가능하다.
	}
	
	public void disp() {
		//this(85); 에this는 생성자 함수들끼리만 가능. 일반 메소드에서 생성자함수 호출 불가능
	}
}

public class Test03_this {

	public static void main(String[] args) {
		//this()
		//->자신의 생성자 함수가 자신의 생성자 함수를 호출할 때
		
		
		
		
	}

}
