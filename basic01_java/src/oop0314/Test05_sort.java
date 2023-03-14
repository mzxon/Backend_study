package oop0314;

import java.util.Arrays;

public class Test05_sort {

	public static void main(String[] args) {
		//정렬 Sort
		/*
			- 정렬 유형 : 오름차순과 내림차순
			
			- 정렬 방식
			  삽입정렬 insertion sort
			  선택정렬 selection sort
			  버블정렬 bubble sort
			  
			- selection sort 알고리즘
			  9 8 7 6 5 -> 5 6 7 8 9	
			  
			  9 8 7 6 5
			  8 9 7 6 5
			  7 9 8 6 5
			  6 9 8 7 5
			  5 9 8 7 6
			  -------------step1
			  5 8 9 7 6
			  5 7 9 8 6
			  5 6 9 8 7
			  -------------step2
			  5 6 8 9 7
			  5 6 7 9 8
			  -------------step3
			  5 6 7 8 9
			  -------------step4
			
			  
			  
			- bubble sort 알고리즘
			  9 8 7 6 5 -> 5 6 7 8 9
			  
			  8 9 7 6 5
			  8 7 9 6 5
			  8 7 6 9 5
			  8 7 6 5 9
			  -------------step1
			  7 8 6 5 9
			  7 6 8 5 9
			  7 6 5 8 9
			  -------------step2
			  6 7 5 8 9
			  6 5 7 8 9
			  -------------step3
			  5 6 7 8 9
			  -------------step4
		*/
		
		int[] su= {9, 8, 7, 6, 5};
		
		//숫자형 데이터를 오름차순 정렬
		Arrays.sort(su);
		
		for(int idx=0; idx<su.length; idx++) {
			System.out.println(su[idx]);
		}
	}

}
