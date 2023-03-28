package crawling0328;

import java.io.FileWriter;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test05_soldesk {

	public static void main(String[] args) {
		//과제) 솔데스크 웹페이지에서 공지사항 제목만 크롤링해서
		//	  soldesk.txt 파일에 저장하기
		
		try {	
			
			String fileName="I:/java202301/eGovFrame.txt";
			FileWriter fw=new FileWriter(fileName, true); //추가모드 true해야 계속 추가됨
			PrintWriter out=new PrintWriter(fw, true);
			
			String URL = "https://www.egovframe.go.kr/home/sub.do?menuNo=74";
			
			
//			for(int p=0; p<=210; p++) {
//				String params="&amp;bbsId=6&amp;pagerOffset=" + p;
//				Document doc=Jsoup.connect(URL+params).get();
//				System.out.println(doc.toString());
//				p=p+10;
//			}
			
			
//			list_item
//			al
//			
			for(int p=0; p<=30; p+=10) {
				String params="&amp;bbsId=6&amp;pagerOffset=" + p;
				Document doc=Jsoup.connect(URL+params).get();
				Elements elements=doc.select(".list_item .al");
				for(Element element : elements) { 
					System.out.println(element.text());
					out.println(element.text());
				}
			}
			

			out.close();
			fw.close();
			
			System.out.println("-------choongang.txt 공지사항 제목 저장 완성!!");
			
			
			
			
			
		} catch (Exception e) {
			System.out.println("크롤링 실패 : " + e);
		}

	}

} 
