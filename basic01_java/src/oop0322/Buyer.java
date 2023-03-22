package oop0322;

//상품 구매 관련 클래스
class Buyer {
	private int myMoney=1000;	//나의 총 재산
	private int myMileage=0;	//나의 마일리지 점수(bonusPoint 누적)
	private int i=0;
	
	//상품을 구매했을 때 어떤 상품을 구매했는지 저장(나의 구매상품 목록)
	Product[] item=new Product[10];
	/*
		    			Product
		+------------+-------------+-------------+--
		|  SmartTV   |   Notebook  |  HandPhone  |   ~~
		+------------+-------------+-------------+--
			item[0]       item[1]       item[2]      ~~
	*/
	
	public Buyer() {}
	
//	메소드 오버로드 (함수명 중복 정의)
	/*
	public void buy(SmartTV a) {}
	public void buy(Notebook a) {}
	public void buy(HandPhone a) {}
	*/
	
	public void buy(Product p) {//다형성
		//Product -> SmartTV, Notebook, HandPhone 클래스의 부모클래스
		
		if(this.myMoney<p.price) {
			System.out.println("잔액이 부족합니다!!");
			return;
		}
		
		
		item[i++]=p;
		this.myMoney=this.myMoney-p.price; 			//나의 재산은 감소
										   			//Product p에 자식클래스의 객체가 오면 변수가 자식의 변수로 변경
		this.myMileage=this.myMileage+p.bonusPoint; //나의 마일리지는 증가
	}
	
	public void disp() {
		
		//문제) 구매 상품 목록과 구매한 상품의 총 합계금액을 구하시오
		//	   (item 배열 활용)
		
		//구매한 상품 목록
		StringBuilder shoplist = new StringBuilder();
		
		//사용금액
		int hap=0;
		
		for(int n=0; n<item.length; n++) {
			if(item[n]==null) break;
			shoplist.append(item[n].toString()+" ");
			hap=hap+item[n].price;
		}
	
		System.out.println("구매 상품 목록 : " + shoplist);
		System.out.println("사용금액 : " + hap);
		System.out.println("나의 남은 재산 : " + this.myMoney);
		System.out.println("나의 마일리지 : " + this.myMileage);	
	}
	
	
	
	
	
	
	
	
	
	
	
}
