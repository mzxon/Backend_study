--MariaDB 기준
--bbs.sql
--답변형 및 댓글형 게시판

--테이블 삭제
drop table tb_bbs;

--테이블 생성
CREATE TABLE tb_bbs (
       bbsno        INT           NOT NULL AUTO_INCREMENT PRIMARY KEY
       ,wname       VARCHAR(20)   NOT NULL
       ,subject     VARCHAR(100)  NOT NULL
       ,content     TEXT          NOT NULL
       ,grpno       TINYINT       NOT NULL
       ,indent      TINYINT       DEFAULT 0    NOT NULL
       ,ansnum      TINYINT       DEFAULT 0    NOT NULL
       ,regdt       DATETIME      NOT NULL
       ,passwd      VARCHAR(15)   NOT NULL
       ,readcnt     INT           DEFAULT 0    NOT NULL
       ,ip          VARCHAR(15)   NOT NULL
  );


--시퀀스 생성할 필요 없음 -> insert 필요없음
AUTO_INCREMENT


/////////////////////////////////////////////////////////


--새글쓰기
bbsno : 시퀀스를 이용해서 일련번호
wname, subject, content, passwd : 사용자가 입력
(작성자) (글제목)	(글내용)	(글비밀번호)
readcnt, regdt, indent, ansnum  : default 값 (안넣으면 들어감)
(글조회수) (글작성일)(들여쓰기) (글순서)
ip								: 요청 PC의 IP 값
grpno							: max(bbsno) + 1
(글 그룹번호)							  (일련번호)



--그룹번호(grpno) 만들기
select max(bbsno) from tb_bbs;
--ifnull()함수를 이용해서 max(bbsno)값이 비어있을때(null) 0으로 바꾼 후 +1
select nvl(max(bbsno),0)+1 from tb_bbs;


--행추가
insert into tb_bbs(bbsno, wname, subject, content, passwd, ip, grpno)
values (bbs_seq.nextval, ?, ?, ?, ?, ?, (select nvl(max(bbsno),0)+1 from tb_bbs;));


--전체목록
select bbsno, wname, subject, readcnt, regdt, indent
from tb_bbs
order by grpno desc, ansnum asc;


--상세보기
select * from tb_bbs where bbsno=?


--조회수 증가
update tb_bbs
set readcnt=readcnt+1
where bbsno=?


--행삭제
delete from tb_bbs
where bbsno=? and passwd=? --> 비밀번호는 가져오는게 아니라 그때마다 입력받음 -> 게시물 클릭할때마다 입력폼이 나와야함


--행수정
update tb_bbs set wname=?, subject=?, content=?, ip=?
where bbsno=? and passwd=?


///////////////////////////////////////////////////////


● 답변쓰기 알고리즘

- 새글 쓰기 : (부모글)
- 답변 쓰기 : (자식글)-부모와 상속 관계

- 그룹번호 (grpno)		 : 부모글 그룹번호와 동일하게
- 들여쓰기	(indent)	 : 부모글 들여쓰기 + 1
- 글순서	(ansnum)	 : 부모글 글순서 + 1

번호  제목 				그룹번호 들여쓰기 글순서  
1	 제주도				1	   0	 0
	 ▶서귀포				1	   1	 1
	 ▶▶제주공항			1	   2	 2
	 ▶서귀포				1	   1	 3
2	 서울시				2	   0	 0
	 ▶마포구				2	   1     1
	 ▶▶이대				2	   2     2
	 ▶▶신촌				2	   2     3	
	 ▶강남구				2	   1     4
	 ▶▶역삼동				2	   2     5
	 ▶▶▶삼원타워			2	   3     6
	 ▶종로구				2	   1	 7
3	 부산시				3	   0	 0


- 글순서(ansnum) 재조정
update tb_bbs
set ansnum=ansnum+1
where grpno=2 and ansnum>=2
///////////////////////////////////////////////////////

[과제] 제목과 댓글(자식글)의 갯수를 조회하시오 ()

		제목
		---------------------------
		대한민국(3) (댓글수)
		서울시(5)
		오필승코리아
		무궁화 꽃이 피었습니다(2)

select subject, grpno, indent 
from tb_bbs 
order by grpno desc, indent asc;

select grpno, count(*)
from tb_bbs
group by grpno
order by grpno desc;
-> 그룹번호별로 총갯수

select BB.subject, AA.reply
from(
		select grpno, count(*)-1 as reply
		from tb_bbs
		group by grpno
	) AA join tb_bbs BB
on AA.grpno=BB.grpno
where AA.reply>0
order by BB.grpno desc;
-> 그룹번호별 총갯수-1 = 0부터 시작
-> 그룹화된 테이블 - 전체 테이블을 그룹번호가 동일한 것만 조인
-> BB.indent가 0인 행만 즉, 부모글만

select BB.subject, BB.indent, AA.grpno, AA.reply
from(     
        select grpno, count(*)-1 as reply     
        from tb_bbs
        group by grpno
     ) AA join tb_bbs BB
on AA.grpno=BB.grpno
where BB.indent=0
order by BB.grpno desc, BB.indent asc;

////////////////////////////////////////////////////////


● [검색]

-- 제목+내용에서 '파스타'가 있는지 검색
where subject like '%파스타%' or content like '%파스타%'

-- 제목에서 '파스타'가 있는지 검색
where subject like '%파스타%'

-- 내용에서 '파스타'가 있는지 검색
where content like '%파스타%'

-- 작성자에서 '파스타'가 있는지 검색
where wname like '%파스타%'


/////////////////////////////////////////////////////////


● [페이징]

- rownum 줄번호 활용

1)
select bbsno, subject, wname, readcnt, indent, regdt
from tb_bbs
order by grpno desc, ansnum asc;


2)rownum 추가-
select bbsno, subject, wname, readcnt, indent, regdt, rownum
from tb_bbs
order by grpno desc, ansnum asc;


3) 1)의 SQL문을 셀프조인하고, rownum 추가
select bbsno, subject, wname, readcnt, indent, regdt, rownum
from (
		select bbsno, subject, wname, readcnt, indent, regdt
		from tb_bbs
		order by grpno desc, ansnum asc
	);

	
4)줄번호 1~5조회 (1페이지)
select bbsno, subject, wname, indent, regdt, rownum
from (
		select bbsno, subject, wname, readcnt, indent, regdt
		from tb_bbs
		order by grpno desc, ansnum asc
	)
where rownum>=1 and rownum<=5;


5)줄번호 6~10 조회(2페이지)
select bbsno, subject, wname, indent, regdt, rownum
from (
		select bbsno, subject, wname, readcnt, indent, regdt
		from tb_bbs
		order by grpno desc, ansnum asc
	)
where rownum>=6 and rownum<=10;


6)줄번호가 있는 3)의 테이블을 한번 더 셀프조인하고, rownum칼럼명을 r로 바꾼다
select *
from (
		select bbsno, subject, wname, readcnt, indent, regdt, rownum as r
		from (
				select bbsno, subject, wname, readcnt, indent, regdt
				from tb_bbs
				order by grpno desc, ansnum asc
			)
	)
where r>=6 and r<=10;


7)페이징 + 검색
  예) 제목에서 '파스타'가 있는 행을 검색해서 2페이지(6행~10행) 조회하시오
select *
from (
		select bbsno, subject, wname, readcnt, indent, regdt, rownum as r
		from (
				select bbsno, subject, wname, readcnt, indent, regdt
				from tb_bbs
				where subject like '%파스타%'
				order by grpno desc, ansnum asc
			)
	)
where r>=6 and r<=10;
  

























