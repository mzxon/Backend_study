package crawling0328;

import java.io.FileWriter;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test05_egovframe {

	public static void main(String[] args) {
		//과제) 솔데스크 웹페이지에서 공지사항 제목만 크롤링해서
		//	  eGovFrame.txt 파일에 저장하기
		
		try {	
			
			String fileName="I:/java202301/workspace/eGovFrame.txt";
			FileWriter fw=new FileWriter(fileName, true); //추가모드 true해야 계속 추가됨
			PrintWriter out=new PrintWriter(fw, true);
			
			String URL = "https://www.egovframe.go.kr/home/sub.do?menuNo=74";
		
//			list_item
//			al
			
			for(int p=0; p<=210; p+=10) {
				String params="&pagerOffset=" + p;
				Document doc=Jsoup.connect(URL+params).get();
				
				Elements elements=doc.select(".list_item .al");
				/*
					<div class="list_item">
						<div class="al">
					</div>
						<div class="al">
					</div>
						<div class="al">
					</div>
					
					Elements elements=doc.select(".list_item");
					//class="al" 요소 제거하기
					elements.select(".al").remove()
				*/
				
				for(Element element : elements) { 
					System.out.println(element.text());
					out.println(element.text());
				}
			}
			

			out.close();
			fw.close();
			
			System.out.println("-------eGovFrame.txt 공지사항 제목 저장 완성!!");
			
			
			
			
			
		} catch (Exception e) {
			System.out.println("크롤링 실패 : " + e);
		}

	}

} 
