package oop0315;

import java.util.Arrays;

public class Test03_method {

	public static void test1 (int a, int b) {
		System.out.println(a);
		System.out.println(b);
	}
	
	public static void test2(int[] a) {
		for(int i=0; i<a.length; i++) {
			System.out.println(a[i]);
		}
	}
	
	public static void test3(String a, String b) {
		System.out.println(a);
		System.out.println(b);
	}
	
	public static void test4(String[] a) {
		for(int i=0; i<a.length; i++) {
			System.out.println(a[i]);
		}
	}
	
	public static void test5(int a, int b) {
		System.out.println(a);
		System.out.println(b);
	}
	
	public static void test6(int[][] a) {
		for(int i=0; i<a.length; i++) {
			int col=a[i].length;
			for(int j=0; j<col; j++) {
				System.out.println(a[i][j]);
			}
		}
	}
	public static void main(String[] args) {
		//메소드 호출 방식
		//->Call by value
		//->Call by reference
		
		int[] num = {10, 20, 30};
		
		//Call by value 값에 의한 호출 방식
		test1(num[0], num[2]);

		//Call by reference 주소에 의한 호출 방식
		test2(num);	//배열 요소가 저장되어 있는 주소
					//배열 전체
	
		String[] name = {"무궁화", "오필승", "코리아"};
		test3(name[1], name[2]);
		test4(name);
		
		//[2행][3열]
		int[][] su = {
				 {1, 2, 3}
				,{4, 5, 6}
		};
		
		test5(su[0][0], su[1][1]); //1, 5
		
		test6(su);
		////////////////////////////////////////////
		
		
		int[] lotto = {3, 7, 4, 15, 28, 13};
		
		//1차원 배열을 전달하면 오름차순 정렬
		Arrays.sort(lotto);
		
		for(int i=0; i<lotto.length; i++) {
			System.out.println(lotto[i]);
		}
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}
