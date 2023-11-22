<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="co.yedam.user.service.UserVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css" />
<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:200,400&display=swap"
	rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet" />
<jsp:include page="../layouts/header.jsp"></jsp:include>
<style>
	#top {
		margin-top: 30px;
			margin-bottom: 30px;
	}
	h5 {
		width: 102px;
	}
	body {
		margin: auto;
		display: flex; 
	    flex-direction: column; 
	    align-items: center;
    }
    input {
    	height: 30px;
		border: 0;
		border-radius: 6px;
		background-color: rgb(233, 233, 233);
		margin-bottom: 6px;
		justify-content: flex-start;
	}
	div{
		display: flex;
	}
    button {
		height: 35px;
		width: 120px;
	    background-color:#0a0a23;
	    color: #fff;
	    border:none;
	    border-radius:10px;
	    margin-top: 10px;
	    margin-bottom: 15px;
	    margin-left: 15px;
	}
	form {
		margin: 0 auto;
		margin-bottom: 60px;
	}
</style>
<script>
window.onload = function() {
    const urlParams = new URLSearchParams(window.location.search);
    const modifySuccessParam = urlParams.get('modifySuccess');

    if (modifySuccessParam === 'false') {
        alert("로그인에 실패하였습니다.");
    }
};
</script>
<body>
	<form action="modifyuser.do" method="post" onsubmit="return modifyCheck(this)">
		<h3 id="top" align="center">회원 정보 수정</h3>
		<div id="id">
			<h5>아이디</h5>
			<input type="text" readonly name="id" value="${vo.userId }" />
		</div>
		<div>
			<h5>비밀번호</h5>
			<input type="password" id="pw1" name="pw1" value="${vo.userPass }" />
		</div>
		<div>
			<h5>비밀번호 확인</h5>
			<input type="password" id="pw2" /><span
				id="check"></span>
		</div>
		<div id="name">
			<h5>이름</h5>
			<input type="text" readonly id="name" name="name" value="${vo.userName }" />
		</div>
		<div id="joinemail">
			<h5>이메일</h5>
			<input type="text" placeholder="이메일 입력" name="email"
				value="${vo.userEmail }" /> 
		</div>
		<div>
			<h5>전화번호</h5>
			<input type="text" name="pnum" value="${vo.userPhone }">
		</div>
		<div>
			<h5>우편 번호</h5>
			<input type="text" id="postcode" name="postcode" value="${vo.userAddrnum }"> 
			<input type="button" id="addrnum" value="우편번호 찾기"><br> 
			<!-- <input type="text" id="sample6_detailAddress" name="addr" placeholder="상세주소"> 
			<input type="text" id="sample6_extraAddress" placeholder="참고항목"> -->
		</div>
		<div>
			<h5>상세 주소</h5> 
			<input type="text" id="sample6_address" name="addr" value="${vo.userAddr }">
		</div>
		<div class="info" id="info_bir">
			<h5>생년월일</h5>
			<input readonly value="${vo.userBir }">
		</div>
		<div id="gender">
			<h5>성별</h5>
			<input type="text" readonly value="${vo.userGender }">
		</div>
		<div id="modify" align="center">
			<button type="submit">수정</button>
			<button type="reset">초기화</button>
		</div>
	</form>
</body>
</html>
<jsp:include page="../layouts/footer.jsp"></jsp:include>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
/* 우편 주소 */
const addrnum = document.querySelector('#addrnum');
addrnum.addEventListener('click', function goPopup() {
	new daum.Postcode({
        oncomplete: function(data) {
       
            var addr = ''; 
            var extraAddr = ''; 
            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }
            /* if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            } */
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            /* document.getElementById("sample6_detailAddress").focus(); */
        }
    }).open();
});

function modifyCheck(obj) {
	if (!obj.pw1.value || obj.pw1.value.trim().length === 0) {
        alert("비밀번호가 입력되지 않았습니다.");
        return false;
    }
    if (!obj.pw2.value || obj.pw2.value.trim().length === 0) {
        alert("비밀번호 확인이 입력되지 않았습니다.");
        return false;
    }
    if (obj.pw1.value !== obj.pw2.value) {
        alert("비밀번호가 일치하지 않습니다.");
        return false;
    }
    return true;
}

</script>