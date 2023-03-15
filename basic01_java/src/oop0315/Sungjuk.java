package oop0315;

public class Sungjuk { //package 생략되어 있음
					   //클래스명의 첫글자는 대문자로 한다
	//멤버변수 field
	public String name; //클래스 외부에서 접근 가능함
	int kor, eng, mat;  //package 생략되어 있다
	private int aver;	//Sungjuk클래스 내부에서만 접근 가능하다
	
	//멤버함수 method
	private void view() {}
	
	void calc() {//package생략가능
		//클래스 내부의 멤버들 간에는 Access Modifier와 상관없이 접근 가능하다.
		aver=(kor+eng+mat)/3;
		view();
	}
	public void disp() {
		System.out.println(name);
		System.out.println(kor);
		System.out.println(eng);
		System.out.println(mat);
		System.out.println(aver);
	}

}
