package oop0317;

public class test04_ox {

	public static void main(String[] args) {
		//문제) 성적프로그램 OX 표시하기
		//		Jumsu 클래스 생성후 실습
		/*
			         ** 시험결과 **
			====================================
			번호  이름   1  2  3  4  5  점수  등수      
			------------------------------------    
			1   홍길동  O  X  O  O  O   80   2    
			2   무궁화  O  O  O  O  O  100   1
			3   라일락  X  X  X  X  O   20   5
			4   진달래  X  O  X  O  O   60   3
			5   봉선화  O  O  X  X  X   40   4
			------------------------------------ 
			
			- 맞은문제 O, 틀린문제 X표시
			- 점수: O당 20점씩
			- 등수: 점수를 기준으로 높은사람이 1등 
		*/
		
		//1) 1명을 대상으로 성적 구하기
		Jumsu student = new Jumsu(1, "홍길동", 3, 4, 3, 3, 3);
		student.compute();
		student.disp();
		System.out.println("-----------------------");
		
		//2) 여러명
		Jumsu[] students = new Jumsu[5];
		students[0]= new Jumsu(1, "홍길동", 3, 4, 3, 3, 3);
		students[1]= new Jumsu(2, "무궁화", 3, 3, 3, 3, 3);
		students[2]= new Jumsu(3, "라일락", 4, 4, 4, 4, 3);
		students[3]= new Jumsu(4, "진달래", 4, 3, 4, 3, 3);
		students[4]= new Jumsu(5, "봉선화", 3, 3, 4, 4, 4);
		
		for(int i=0; i<students.length; i++) {
			students[i].compute();
			students[i].disp();
		}
		
		
		
		
		
		
		
		
		
	}

}
