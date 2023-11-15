<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.info #joinid {
	position: relative;
}
</style>
<form action="join.do" method="post">
	<h4>회원가입</h4>
	<div id="joinid">
		<h5>아이디</h5>
		<input type="text" placeholder="아이디 입력(6~20자)" />
		<button id="idcheck">중복 확인</button>
	</div>
	<div id="joinpw">
		<h5>비밀번호</h5>
		<input type="password" placeholder="6자리 이상 입력해주세요." />
	</div>
	<div id="checkpw">
		<h5>비밀번호 확인</h5>
		<input type="password" />
	</div>
	<div id="joinname">
		<h5>이름</h5>
		<input type="text" />
	</div>
	<div id="joinemail">
		<h5>이메일</h5>
		<input type="text" placeholder="이메일 입력" />
		<input class="box"disabled id="domain_text" />
			<select id="domain_list">
			<option disabled value="type" selected>선택하세요.</option>
			<option value="naver.com">naver.com</option>
			<option value="daum.net">daum.net</option>
			<option value="hanmail.net">hanmail.net</option>
			<option value="google.com">google.com</option>
			<option value="nate.com">nate.com</option>
			<option value="type">직접 입력</option>
		</select>
	</div>
	<div>
		<h5>주소지 입력</h5>
		<input type="text" id="sample6_postcode" placeholder="우편번호">
		<input type="button" id="addrnum" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address" placeholder="주소"><br>
		<input type="text" id="sample6_detailAddress" placeholder="상세주소">
		<input type="text" id="sample6_extraAddress" placeholder="참고항목">
	</div>
	<div class="info" id="info_bir">
		<h5>생년월일</h5>
		<select class="box" id="bir-year">
			<option disabled selected>출생 연도</option>
		</select> <select class="box" id="bir-month">
			<option disabled selected>월</option>
		</select> <select class="box" id="bir-day">
			<option disabled selected>일</option>
		</select>
	</div>
	<div id="joingender">
		<h5>성별</h5>
		<label><input name="gender" type="radio" checked value="male">남</label>
		<input id="female" name="gender" type="radio" value="female"><label
			for="female">여</label>
	</div>
	<hr>
	<div id="join">
		<button type="submit">회원가입</button>
	</div>
</form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	/* 아이디 중복 확인 */
	const doublecheck = document.querySelector('#idcheck');
	doublecheck.addEventListener('click', function(e) {
		
	})
	
	/* 이메일 도메인 */
	const domainlist = document.querySelector('#domain_list');
	const domaininput = document.querySelector('#domain_text');
	domainlist.addEventListener('change', function(event) {
		if (event.target.value !== "type") {
			domaininput.value = event.target.value
			domaininput.disabled = true
		} else {
			domaininput.value = ""
				domaininput.disabled = false
		}
	})
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
                if(data.userSelectedType === 'R'){
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
                }

                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
	});
	
</script>

