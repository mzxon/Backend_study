package crawling0328;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test03_choongang {

	public static void main(String[] args) {
		//중앙정보처리학원의 공지사항 제목만 전부 크롤링하기 (1~12페이지 전부)
		try {	
			
			String URL = "https://www.choongang.co.kr/html/sub07_01_n.php";
			
			//공지사항 웹페이지 1~11 페이지 소스 가져오기
			for(int p=1; p<=12; p++) {
				String params="?page=" + p + "&mod=&idx=";
				//System.out.println(params);
				Document doc=Jsoup.connect(URL+params).get();
				//System.out.println(doc.toString());
				/*
					요소 선택하기
					<tr class="board_default_list">
						<td class="default_title">청년취업아카데미 취업캠프</td>
				*/
				Elements elements=doc.select(".board_default_list .default_title");
				for(Element element : elements) { //for(개별 : 덩어리)
					System.out.println(element.text());
				}
			}
			
			
				
			
			
		} catch (Exception e) {
			System.out.println("크롤링 실패 : " + e);
		}

	}

} 
