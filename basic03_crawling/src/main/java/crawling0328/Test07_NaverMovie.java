package crawling0328;

import java.io.FileWriter;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test07_NaverMovie {

	public static void main(String[] args) {
		//네이버 영화 평점 후기 크롤링하기
		//예)스즈메의 문단속 영화 평점 제목을 공감순으로 정렬 후 크롤링하기 (대략 9,441건)
		//suzume.txt 파일에 저장하기
		
		try {	
			
			
//			요청 URL: http://movie.naver.com/movie/bi/mi/pointWriteFormList.naver?code=215932&type=after&isActualPointWriteExecute=false&isMileageSubscriptionAlready=false&isMileageSubscriptionReject=false
			//=> / 는 메인바로 밑에 추가해달라는 뜻
//			&page=2
//			id="_filtered_ment_1"
			String URL = "http://movie.naver.com/movie/bi/mi/pointWriteFormList.naver";
			String params="?code=215932";//영화주소
			params+="&type=after";
			params+="&isActualPointWriteExecute=false";
			params+="&isMileageSubscriptionAlready=false";
			params+="&isMileageSubscriptionReject=false";
			params+="&page=0";

			Document doc=Jsoup.connect(URL+params).get();
			
//			for(int p=1; p<=10; p++) {
//				params+="&page=" + p;
//				Document doc=Jsoup.connect(URL+params).get();
//				
//				
//				for(int n=0; n<=9; n++) {
//					Elements elements=doc.select("#_filtered_ment_"+n);	
//					for(Element element : elements) {
//						System.out.println(elements.text());
//					}	 
//				}
//				System.out.println("----------------------");
//			}	
			
			/*
				1.평점제목이 있는 요소
				<div class="score_reple">
					<p>
						<span class="ico_viewr">관람객</span>
						<span id="_filtered_ment_0">
							마지막 클라이막스때 저항없이 울었다
						</span>
					</p>
				</div>	
			*/
			
			Elements elements=doc.select(".score_reple p");
			
			//불필요한 요소 제거하기 <span class="ico_viewer">관람객</span>
			elements.select(".ico_viewer").remove();
			
			for(Element element:elements) {
				System.out.println(element.text());
			}
			
			
			
			
			
		} catch (Exception e) {
			System.out.println("크롤링 실패 : " + e);
		}
	}
} 


