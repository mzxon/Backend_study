package oop0314;

public class Test04_quiz {

	public static void main(String[] args) {
		//배열 연습문제
		
		char[] ch= {'I', 't', 'W', 'i', 'l', 'l'};
		int size=ch.length; //6
		
		//문1) 대, 소문자의 갯수를 각각 구하시오
		//->대문자 : 2개
		//->소문자 : 4개
		
		int CnT=0;
		int cnt=0;
		for(int i=0; i<size; i++) {
			if(ch[i]>='A' && ch[i]<='Z') CnT++;
			else if(ch[i]>='a' && ch[i]<='z') cnt++;
		}
		System.out.printf("대문자 : %d개 \n",CnT);
		System.out.printf("대문자 : %d개 \n",cnt);
		
		System.out.println("----------------------");
		
		//문2) 대소문자를 서로 바꿔서 출력하시오
		//-> iTwILL

		for(int i=0; i<size; i++) {
			if(ch[i]>='A' && ch[i]<='Z') {
				System.out.print(Character.toLowerCase(ch[i]));
			}
			else if(ch[i]>='a' && ch[i]<='z') {
				System.out.print(Character.toUpperCase(ch[i]));
			}
		}
		
		System.out.println();
		System.out.println("----------------------");
			
		
		//문3) 모음의 갯수를 구하시오 AEIOUaeiou
		//-> 모음의 갯수 : 
		
		char[] mo = {'A', 'E', 'I', 'O', 'U',
					 'a', 'e', 'i', 'o', 'u'};
		int numm=0;
		
		for(int i=0; i<size; i++) {
			for(int j=0; j<mo.length; j++) {
				if(ch[i]==mo[j]) numm++;
			}
		}
		System.out.printf("%d개",numm);

		System.out.println();
		System.out.println("----------------------");
		
		numm=0;
		
		/////////////////////////////////////
		
		//문4) 각 행의 모음의 갯수를 구하시오
		//->str[0]행 : 2개
		//->str[1]행 : 1개
		//->str[2]행 : 2개
		
		char[][] str = {
				 {'Y', 'e', 'a', 'r'}
				,{'M', 'o', 'n', 't', 'h'}
				,{'D', 'a', 't', 'e'}
		};
	
		for(int i=0; i<str.length; i++) {
			for(int j=0; j<str[i].length; j++) {
				for(int z=0; z<mo.length; z++) {
					if(str[i][j]==mo[z]) numm++;
				}
			}
			System.out.printf("str[%d]행 : %d개",i , numm);
			numm=0;
			System.out.println();
		}
		System.out.println("----------------------");
		
		numm=0;
		
		// 문5) 대각선 방향의 각 요소의 합을 구하시오
		// 대각선 ↘ 방향의 합 (4+9+7)
		// 대각선 ↙ 방향의 합 (2+9+6)
		int [][] num= {
				 {4, 3, 2}
				,{5, 9, 1}
				,{6, 8, 7}
		};
		
		int sum=0;
		int nmm=0;
		int cntt=num.length-1;
		for(int i=0; i<num.length; i++) {
			sum=sum+num[i][numm];
			numm++;
			nmm=nmm+num[i][cntt];
			cntt--;
		}
		System.out.printf("대각선 ↘ 방향의 합 (4+9+7) : %d\n",sum);
		System.out.printf("대각선 ↙ 방향의 합 (2+9+6) : %d ",nmm);
	}
}
