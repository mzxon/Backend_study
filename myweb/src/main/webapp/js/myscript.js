/*
 *  my script.js
*/


function bbsCheck(){
    //게시판 유효성 검사

    //1) 작성자 2글자 이상 입력
    let wname=document.getElementById("wname").value; //작성자 가져오기
    wname=wname.trim();
    if(wname.length<2){
        alert("작성자 2글자 이상 입력해주세요");
        document.getElementById("wname").focus();
        return false;
    }

    //2) 제목 2글자 이상 입력
    let subject=document.getElementById("subject").value;
    subject=subject.trim();
    if(subject.length<2){
        alert("제목 2글자 이상 입력해주세요");
        document.getElementById("subject").focus();
        return false;
    }

    //3) 내용 2글자 이상 입력
    let content=document.getElementById("content").value;
    content=content.trim();
    if(content<2){
        alert("내용 2글자 이상 입력해주세요");
        document.getElementById("content").focus();
        return false;
    }

    //4) 비밀번호는 4글자이상이면서, 숫자형 기호만 입력
    let passwd=document.getElementById("passwd").value;
    passwd=passwd.trim();
    if(passwd.length<4 || isNaN(passwd)){
        alert("비밀번호 4글자 이상 숫자로 입력해주세요");
        document.getElementById("passwd").focus();
        return false;
    }
    
    return true;
}


function pwCheck(){
	let passwd=document.getElementById("passwd").value;
    passwd=passwd.trim();
    if(passwd.length<4 || isNaN(passwd)){
        alert("비밀번호 4글자 이상 숫자로 입력해주세요");
        document.getElementById("passwd").focus();
        return false;
    }
    
    let message="진행된 내용은 복구되지 않습니다. \n계속 진행할까요?";
    if(confirm(message)){ //확인true, 취소false
		return true;
	}else{
		return false;
	}
}


function searchCheck(){
	let word=document.getElementById("word").value;
    word=word.trim();
    if(word.length==0){
        alert("검색어를 입력해주세요");
        return false;
    }
    return true;
}


function loginCheck(){//로그인 유효성 검사 (아이디, 비번)

	//1)아이디 5~10글자 이내인지 검사
	let id=document.getElementById("id").value;
	id=id.trim();
	if(!(id.length>=5 && id.length<=10)){
		alert("아이디 5~10글자 이내로 입력해주세요");
		document.getElementById("id").focus();
		return false;
	}
	
	//2)비밀번호 5~10글자 이내인지 검사
	let passwd=document.getElementById("passwd").value;
	passwd=passwd.trim();
	if(!(passwd.length>=5 && passwd.length<=10)){
		alert("비밀번호 5~10글자 이내로 입력해주세요");
		document.getElementById("passwd").focus();
		return false;
	}
	
	return true;
}

function idCheck(){ //아이디 중복확인
	
	//모달창 만들기
	//->부모창과 자식창이 한몸으로 구성되어 있음
	//->참조 https://www.w3schools.com/bootstrap/bootstrap_modal.asp
	
	
	//새창 만들기
	//->부모창과 자식창이 별개로 구성되어 있음
	//->모바일에 기반을 둔 frontend단에서는 사용하지 말것!!
	//->참조 https://www.w3schools.com/jsref/met_win_open.asp
	//window.open("파일명", "새창이름", "다양한옵션들");
	window.open("idCheckForm.jsp", "idwin", "width=500, height=350");
	
}







	



