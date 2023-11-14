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
		<input class="box" disabled id="domain_text" /> 
			<select id="box" id="domain_list">
			<option disabled value="type" selected>직접 입력</option>
			<option value="naver.com">naver.com</option>
			<option value="daum.net">daum.net</option>
			<option value="hanmail.net">hanmail.net</option>
			<option value="google.com">google.com</option>
			<option value="nate.com">nate.com</option>
		</select>
	</div>
	<div>
		<h5>우편번호</h5>
		<input type="text" />
		<button id="arddrnum">검색하기</button>
	</div>
	<div id="addr">
		<h5>주소</h5>
		<input type="text" /> <br> <input type="text" />
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
<script>
/* 이메일 도메인 */
	//도메인 직접 입력 or domain option 선택
	const domainListEl = document.querySelector('#domain_list')
	const domainInputEl = document.querySelector('#domain_text')
	// select 옵션 변경 시
	domainListEl.addEventListener('change', (event) => {
	  // option에 있는 도메인 선택 시
	  if(event.target.value !== "type") {
	    // 선택한 도메인을 input에 입력하고 disabled
	    domainInputEl.value = event.target.value
	    domainInputEl.disabled = true
	  } else { // 직접 입력 시
	    // input 내용 초기화 & 입력 가능하도록 변경
	    domainInputEl.value = ""
	    domainInputEl.disabled = false
	  }
	})
</script>
