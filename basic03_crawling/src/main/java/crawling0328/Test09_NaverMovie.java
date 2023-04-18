package crawling0328;

import java.io.FileWriter;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test09_NaverMovie {

	public static void main(String[] args) {
		//네이버 영화 평점 후기 크롤링하기
		//예)스즈메의 문단속 영화 평점 제목을 공감순으로 정렬 후 크롤링하기 (대략 9,441건)
		//suzume.txt 파일에 저장하기
		
		try {	
			
			String fileName="I:/java202301/workspace/suzume2.txt";
			FileWriter fw=new FileWriter(fileName, true); //추가모드 true해야 계속 추가됨
			PrintWriter out=new PrintWriter(fw, true);
			
			String URL = "http://movie.naver.com/movie/bi/mi/pointWriteFormList.naver";
			String params="?code=215932&type=after";
			params+="&isActualPointWriteExecute=false";
			params+="&isMileageSubscriptionAlready=false";
			params+="&isMileageSubscriptionReject=false";
			params+="&order=sympathyScore"; //공감순
			params+="&page";				//대략1~945 페이지
			

			for(int p=1; p<=945; p++) {
				System.out.println("데이터 수집중 ..."+p);
				Document doc=Jsoup.connect(URL+params).get();
				for(int m=0; m<=9; m++) {
					Elements elements=doc.select("#_filtered_ment_"+m);
					for(Element element:elements) {
						out.println(element.text());;
					}
				}
			}
			out.close();
			fw.close();
			
			
		} catch (Exception e) {
			System.out.println("크롤링 실패 : " + e);
		}
	}
} 


