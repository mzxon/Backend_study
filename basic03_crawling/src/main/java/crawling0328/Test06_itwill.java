package crawling0328;

import java.io.FileWriter;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test06_itwill {

	public static void main(String[] args) {
		//아이티윌 웹페이지의 공지사항 제목만 크롤링
		
		try {	
			
			String fileName="I:/java202301/workspace/itwill.txt";
			FileWriter fw=new FileWriter(fileName, true); //추가모드 true해야 계속 추가됨
			PrintWriter out=new PrintWriter(fw, true);

			String URL = "https://www.itwill.co.kr/cmn/board/BBSMSTR_000000000071/bbsList.do";
		
//			class="bgcol01"
//			href="?pageIndex=2"
			
//			bsId: BBSMSTR_000000000071
//			currentMenuNo: 1031100
//			pageIndex: 1	
//			searchCondition: 0
//			searchKeyword: 
			
//			https://www.itwill.co.kr/cmn/board/BBSMSTR_000000000071/bbsList.do
//			?BBSMSTR_000000000071
//			&currentMenuNo=1031100
//			&pageIndex=1
			
//			정확하게 크롤링하기
			
			
			for(int p=1; p<=4; p++) {
				String params="?BBSMSTR_000000000071&currentMenuNo=1031100&searchKeyword=";
				params+="&pageIndex=" + p;
				Document doc=Jsoup.connect(URL+params).get();
				
				Elements elements=doc.select(".bgcol01");
				elements.select(".ac").remove();
				
				//다른방법
				//.bgcol01>td:nth-child(2)
				//Elements elements = doc.select(" .bgcol01 a");
				for(Element element : elements) { 
					System.out.println(element.text());
					out.println(element.text());
				}
			}
			

			out.close();
			fw.close();
			
			System.out.println("-------itwill.txt 공지사항 제목 저장 완성!!");
			
			
			
			
			
		} catch (Exception e) {
			System.out.println("크롤링 실패 : " + e);
		}

	}

} 
