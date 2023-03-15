package oop0315;

public class Test04_quiz {

	public static double avg(int[] aver2) { //평균구하는 메소드
		double sum = 0, aver =0;
		for(int i=0; i<aver2.length; i++) {
			sum=sum+aver2[i];
		}
		aver=sum/aver2.length;
		return aver;
	}
	
	public static double sd(int[] aver) {
		int size=aver.length;
		
		double hap=0.0;
		for(int i=0; i<size; i++) {
			hap=hap+aver[i];
		}
		
		double avg=hap/size;
		
		double sum=0.0;
		for(int i=0; i<size; i++) {
			double d=aver[i]-avg;
			
			d=Math.abs(d);
			
			sum=sum+d;	
		}
		
		return sum/size;
	}
	
	
	public static void main(String[] args) {
		//문제) 표준편차(Standard deviation) 구하기
		
		int[] aver = { 85, 90, 93, 86, 82};
		double avg = avg(aver);
		System.out.println(avg);
		double sum = 0;

		double [] minus = new double[5];

		System.out.println("1)----------");
		for(int i=0; i<aver.length; i++) {
			minus[i]=(aver[i]-avg);
			System.out.printf("%.2f",minus[i]);
			System.out.println();
		}
		
		System.out.println("2)----------");
		for(int i=0; i<minus.length; i++) {
			minus[i]=Math.abs(minus[i]);
			System.out.printf("%.2f",minus[i]);
			System.out.println();
		}
		
		System.out.println("3)----------");
		for(int i=0; i<minus.length; i++) {
			sum=sum+minus[i];
		}
		System.out.printf("%.2f",sum/minus.length);
		
		System.out.println("\n------------");
		
		/*
			1) aver의 평균(87.2)를 구하고, aver의 각 요소에서 87.2를 뺀다.
				85-87.2 = -2.2
				...
				
			2) 1)의 값을 전부 양수로 바꾼다 -> 편차
				2.2
				...
				
			3) 2)의 편차들의 평균값 -> 표준편차
				(2.2 + ... + 5.2) /5 -> 3.44
		*/
		double result = sd(aver);
		System.out.printf("표준편차 : %.2f", result);

	}

}
