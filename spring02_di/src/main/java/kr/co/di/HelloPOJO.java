package kr.co.di;

public class HelloPOJO {
	
	public static void main(String[] args) {
		//POJO방식의 객체생성
		
		IHello hello = null;
		
		hello = new MessageKO();
		hello.sayHello("손흥민");
		
		
	}
}
