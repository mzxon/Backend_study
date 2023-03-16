package oop0316;

class Score {
	//멤버변수
	private String name="손흥민";
	private int kor, eng, mat;
	private int aver;
	
	//생성자함수 constructor
	//생성자함수를 오버로드하면 기본생성자 함수는 자동으로 생성되지 않는다.
	//그래서, 기본생성자함수는 수동으로 생성할 것을 추천
	public Score() {}
	
	//변수 우선순위 : 지역변수 > 멤버변수
	public Score(String name, int kor, int eng, int mat){
		//this.멤버변수=지역변수
		this.name=name;
		this.kor=kor;
		this.eng=eng;
		this.mat=mat;
		this.aver=(kor+eng+mat)/3;
	}
	
	public void disp() {
		System.out.println(this.name);
	}
}
