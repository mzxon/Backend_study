package oop0320;

class School extends Object {
    String name="학교";
    public School() {
        System.out.println("School()...");
    }
}//class end


class MiddleSchool extends School {
	public MiddleSchool() {
		//상속관계에서 부모 생성자 함수 호출 명령어
		super();//생략가능하다
		
		System.out.println("MiddleSchool()...");
	}
	
	public void disp() {
		System.out.println(name); //학교. 부모가 물려준 값 그대로
	}	
}//class end


class HighSchool extends School {
	String name="고등학교";
	
	public HighSchool() {
		super();
		System.out.println("HighSchool()...");
	}
	
	public void disp() {
		String name="강남 고등학교";
		System.out.println(name);      //강남고등학교 지역변수
		System.out.println(this.name); //고등학교    나의 멤버변수
		System.out.println(super.name);//학교       부모의 멤버변수
	}
}//class end






