package oop0314;

public class Test01_for {

	public static void main(String[] args) {
		// 반복문
		
		//1. for문
		for(int a=1; a<=3; a++) {
			System.out.println("JAVA");
		}
		//for문에 선언된 변수는 for문에서만 사용가능함
		//System.out.println(a); 에러
		
		int b=0;
		for(b=1;b<=3;b++) {
			System.out.println("PYTHON");
		}
		System.out.println(b);//4
		
		
		//2. while문
		int i=0;
		while(i<=3) {
			System.out.println("SEOUL");
			i++;
		}
		
		//3. do~while문
		int j=0;
		do {
			System.out.println("JEJU");
			j++;
		}while(j<=3);
		
		
		//4. break와 continue
		for(int a=1; a<10; a++) {
			if(a==5) {
				break;
			}
			System.out.println(a + " ");
		}
		System.out.println();
		
		for(int a=1; a<10; a++) {
			if(a==5) {
				continue;
			}
			System.out.println(a + " ");
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
