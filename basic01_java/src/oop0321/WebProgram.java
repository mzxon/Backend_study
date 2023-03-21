package oop0321;


//웹페이지를 작성할 때 사용하는 언어
//.jsp .py .php .asp

class WebProgram {
	String title = "Java Program";
	
	class Language {
		String basic="Java, HTML, CSS, JavaScript";
		void display() {
			System.out.println("기초수업 :"+basic);
		}
	}
	class Smart{
		String basic = "Objective-c, Java OPP, C#";
		void display() {
			System.out.println("기초수업 : " + basic);
		}
	}
	
	void print() {
		Language lang = new Language();
		lang.display();
		
		Smart sm=new Smart();
		sm.display();
	}
	
}
