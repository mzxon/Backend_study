package oop0315;

class School {
	private String name;
	private int kor, eng, mat;
	private int aver;
	
	//생성자 함수 Constructor
	//->클래스명과 동일한 함수
	//->리턴형이 없다
	//->public void School(){}
	public School() {//기본생성자 함수
		   			 //default constructor
		System.out.println("Shool()호출됨...");
	} 
	
	public void calc() {
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
