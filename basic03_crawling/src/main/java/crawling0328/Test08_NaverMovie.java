package crawling0328;

import java.io.FileWriter;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test08_NaverMovie {

	public static void main(String[] args) {
		//네이버 영화 평점 후기 크롤링하기
		//suzume.txt 파일에 저장하기
		
		try {	
			
			String fileName="I:/java202301/workspace/suzume.txt";
			FileWriter fw=new FileWriter(fileName, true); //추가모드 true해야 계속 추가됨
			PrintWriter out=new PrintWriter(fw, true);
			
			String URL = "http://movie.naver.com/movie/bi/mi/pointWriteFormList.naver?code=215932&type=after&isActualPointWriteExecute=false&isMileageSubscriptionAlready=false&isMileageSubscriptionReject=false";
			

			for(int p=1; p<=10; p++) {
				String params="&page=" + p;
				Document doc=Jsoup.connect(URL+params).get();
				
				
				for(int n=0; n<=9; n++) {
					Elements elements=doc.select("#_filtered_ment_"+n);	
					for(Element element : elements) {
						System.out.println(elements.text());
						out.println(element.text());
					}
				}

				System.out.println("-----------"+p+"페이지----------");
				params="";
			}	
			
			
			
			out.close();
			fw.close();
			
			
		} catch (Exception e) {
			System.out.println("크롤링 실패 : " + e);
		}
	}
} 


