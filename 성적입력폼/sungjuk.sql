--sungjuk.sql

● [오라클 DB 서비스 확인]
  - 명령프롬프트
  	-> sqlplus system/1234
  	

● 오라클 콘솔창 예쁘게 출력 (sqlplus 사용자 추천)
set linesize 1000;
col uname for a10; --col 칼럼명 for 20자
col addr  for a10;


-- 성적테이블 삭제
drop table sungjuk;

-- 성적테이블 생성
create table sungjuk(
     sno   int         not null --일련번호
    ,uname varchar(50) not null --이름
    ,kor   int         not null --국어
    ,eng   int         not null --영어
	,mat   int         not null --수학
    ,aver  int         null     --평균
    ,addr  varchar(50)          --주소
    ,wdate date                 --등록일(년월일시분초)
    ,primary key(sno)
);

-- 성적시퀀스 삭제
drop sequence sungjuk_seq;

-- 성적시퀀스 생성
create sequence sungjuk_seq;

commit;
/////////////////////////////////////////////////////////

● [게시판 페이지 흐름]

  입력 -> 목록 -> 상세보기 -> 삭제/수정 --보통 목록페이지를 먼저 만듬

1) 입력
   sungjukForm.jsp -> sungjukIns.jsp
   
2) 목록
					 sno=1		 상세보기			sno=1		  
   sungjukList.jsp ---------> sungjukRead.jsp ---------> 삭제 sungjukDel.jsp
   
   												sno=1
   											  ---------> 수정 sungjukUpdate.jsp

   												
3) 수정
   ① sungjukUpdate.jsp
   -> 수정하고자 하는 행을 DB에서 가져와서(select문), 사용자가 작성했던 내용을 그대로 성적폼에 출력하고
   	  sungjukRead.jsp와 sungjukForm.jsp 참조 
   
   ② sungjukUpdateProc.jsp
   -> 사용자가 다시 입력한 내용으로 수정(update문)
  
////////////////////////////////////////////////////////////////////////////////////
   												
   												
   												
● [행추가] sungjukIns.jsp
insert into sungjuk(sno, uname, kor, eng, mat, aver, addr, wdate)
values (sungjuk_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate)


● [전체목록] sungjukList.jsp
select *
from sungjuk
order by wdate desc; --가장 최신게 맨위로 올라오게


● [상세보기] sungjukRead.jsp
select * from sungjuk where sno=?

● [행삭제] sungjukDel.jsp
delete from sungjuk where sno=?

● [행수정] sungjukUpdate.jsp
-> sungjukUpdate.jsp     : select 문
-> sungjukUpdateProc.jsp : update sungjuk
						   set uname=?, kor=?, eng=?, mat=?, aver=?, addr=?, wdate=sysdate
						   where sno=?

-- 수정하고자 하는 데이터를 먼저 가져오고
-- 수정하기



















