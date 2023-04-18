<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<title>04_배열.jsp</title>
</head>
<body>
	<h3>배열</h3>

<%
	String[] uname={"라일락","진달래","개나리","무궁화","홍길동"};
	int[] kor={100, 50, 95, 80, 60};
	int[] eng={100, 55, 95, 85, 40};
	int[] mat={100, 60, 35, 90, 30};
	int size=uname.length;
	
	//평균 구하기
	int[] aver={0, 0, 0, 0, 0};
	for(int i=0; i<size; i++){
		aver[i]=(kor[i]+eng[i]+mat[i])/3;
	}
	
	//등수 구하기 (평균을 기준으로)
	int[] rank={1, 1, 1, 1, 1};
	for(int a=0; a<size; a=a+1){
		for(int b=0; b<size; b=b+1){
			if(aver[a]<aver[b]){
				rank[a]=rank[a]+1;
			}
		}
	}

%>

	<!-- 츨력 -->
	<div class="container">
		<table class="table">
		<thead>
			<tr class="success">
				<td>이름</td>
				<td>국어</td>
				<td>영어</td>
				<td>수학</td>
				<td>평균</td>
				<td>등수</td>
				<td>결과</td>
			</tr>
		</thead>
		<tbody>
<%
		for(int i=0; i<size; i++){
%>			
			<tr>
				<td><%=uname[i] %></td>
				<td><%=kor[i] %></td>
				<td><%=eng[i] %></td>
				<td><%=mat[i] %></td>
				<td><%=aver[i] %></td>
				<td><%=rank[i] %></td>
				<td>				
				<!-- 재시험, 합격, 불합격
				평균 10점당 * 한개씩
				평균 95이상이면 장학생
				 -->
			<%
				if(aver[i]>=70){
					if(kor[i]<40 || eng[i]<40 || mat[i]<40){
						out.println("재시험");
					}else{
						out.println("합 격");
					}
				}else{
					out.println("불합격");
				}
			
				for(int star=0; star<aver[i]/10; star++){
					out.println("*");
				}
				
				//평균95점이상이면 장학생(진하게, 빨강색)
				if(aver[i]>=95){
					out.println("<span style='color:red; font-weight:bold;'>");
					out.println("장학생");
					out.println("</span>");
				}
			
			%>
				</td>
			</tr>		
	
	
	
<%	
		}
%>
		
		</tbody>
		</table>
	</div>
	

</body>
</html>