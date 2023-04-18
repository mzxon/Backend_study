package crawling0328;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class Test02_choongang {

	public static void main(String[] args) {
		//중앙정보처리학원의 공지사항 웹페이지 소스 (1~12페이지) 가져오기
		/*
			https://www.choongang.co.kr/html/sub07_01_n.php?page=1&mod=&idx=
			https://www.choongang.co.kr/html/sub07_01_n.php?page=2&mod=&idx=
			https://www.choongang.co.kr/html/sub07_01_n.php?page=3&mod=&idx=
			
			
			https://www.choongang.co.kr/html/sub07_01_n.php?page=11&mod=&idx=
			https://www.choongang.co.kr/html/sub07_01_n.php?page=12&mod=&idx=
		*/
		
		
		try {	
			
			String URL = "https://www.choongang.co.kr/html/sub07_01_n.php";
			
			//공지사항 웹페이지 1~11 페이지 소스 가져오기
			for(int p=1; p<=12; p++) {
				String params="?page=" + p + "&mod=&idx=";
				//System.out.println(params);
				
				Document doc=Jsoup.connect(URL+params).get();
				System.out.println(doc.toString());
				
			}
				
			
			
		} catch (Exception e) {
			System.out.println("크롤링 실패 : " + e);
		}

	}

} 
