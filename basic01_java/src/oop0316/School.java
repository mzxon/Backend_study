package oop0316;

public class School {
	
	//멤버변수 field
	private String name;
	private int kor, eng, mat;
	private int aver;
	
	//생성자 함수
	public School() {
		System.out.println("School() 호출됨");
	}

	//생성자 함수도 오버로드(함수명 중복 정의)가 가능하다
	public School(String n) {
		name=n;
	}
	
	public School(int k, int e, int m) {
		kor=k;
		eng=e;
		mat=m;
	}
	
	public School(String n, int k, int e, int m) {
		name=n;
		kor=k;
		eng=e;
		mat=m;
	}
	
	
	//멤버 함수
	
	void calc() {
		aver=(kor+eng+mat)/3;
	}
	
	public void disp() {
		System.out.println(name);
		System.out.println(kor);
		System.out.println(eng);
		System.out.println(mat);
		System.out.println(aver);
	}
	

}
