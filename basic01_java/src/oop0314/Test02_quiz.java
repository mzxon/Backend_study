package oop0314;

public class Test02_quiz {

	public static void main(String[] args) {
		//연습문제
		
		//문1)알파벳을 아래와 같이 한줄에 5개씩 출력하시오
        /*
            ABCDE
            FGHIJ
            KLMNO
            PQRST
            UVWXY
            Z
        */
		
		int cnt=0;
		for(char ch='A'; ch<='Z'; ch++) {
			System.out.print(ch);
			cnt++;
			if(cnt%5==0) System.out.println();
		}	
	
		System.out.println();
		System.out.println("--------------------");
		
		//문2)아래와 같이 출력하시오
        /*
            ####
             ###
              ##
               #
        */
	
		for(int i=4; i>0; i--) {
		    for(int j=4; j>i; j--) {
		    	System.out.print(" ");
		    }
		    for(int j=0; j<i; j++) {
		    	System.out.print("#");
		    }
		    System.out.println();
		}
		
		System.out.println();
		System.out.println("--------------------");
		
		
		
		//문3)다음식의 결과값을 구하시오
        /*
               1   2   3   4   5      99
               ─ - ─ + ─ - ─ + ─ ...  ──   = 0.688172
               2   3   4   5   6      100
        */

		double sum=0;
		for(int i=1; i<=99; i++) {
			for(int j=1; j<2; j++) {
				if(i%2==0) sum=sum-(double)i/(j+i);
				else sum=sum+(double)i/(j+i);
			}
		}
		System.out.printf("%.6f",sum);
		System.out.println();
		System.out.println("-------++++---------");
		
		double hap=0.0;
		boolean flag=false;
		for(int a=1; a<=99; a++) {
			if(flag) {
				hap = hap - (a/(double)(a+1));
				flag=false;
			}
			else {
				hap= hap + (a/(double)(a+1));
				flag=true;
			}
		}
		System.out.println(hap);
		System.out.println("--------------------");
		
		
		
		//문4)아래와 같이 계산해서 출력하시오
        /*    
             1+....+10=55
            11+....+20=155
            21+....+30=255

            81+....+90=
            91+....+100=955   
        */
		
		int ssum=0;
		for(int i=0; i<10; i++) {
			for(int j=1; j<=10; j++) {
				ssum=ssum+(i*10+j);
			}
			System.out.println(ssum);
			ssum=0;
		}
		System.out.println("-------++++---------");
		
		int summ=0;
		for(int a=10; a<=100; a+=10) {
			for(int b=a-9; b<=a; b++) {
				summ+=b;
			}
			System.out.printf("%d + ... + %d = %d\n", (a-9), a, summ);
			summ=0;
		}
		System.out.println("--------------------");
		
		
		//문5)어느 달팽이는 낮에는 3cm올라가고, 밤에는 2.5cm 내려온다고 할때
        //   달팽이가 13cm의 나무 꼭대기에 올라가려면 며칠이 걸리는지 구하시오
		//21일
		//sum
		
		
		int day=0;		 	//결과값
		double snail=0.0;	//달팽이
		while(true) {
			day++;
			snail=snail+3.0;
			if(snail>=13.0) {
				break;
			}
			else {
				snail=snail-2.5;
			}
		}
		System.out.printf("%d일",day);
		
		
			
	}

}
