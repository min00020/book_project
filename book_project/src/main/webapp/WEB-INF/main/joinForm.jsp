<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css" />

<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:200,400&display=swap"
	rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet" />
<jsp:include page="../layouts/header.jsp"></jsp:include>
<style>
.info #joinid {
	position: relative;
}
</style>

<form action="join.do" method="post" onsubmit="return joinCheck(this)">
	<h4>회원가입</h4>
	<div id="joinid">
		<h5>아이디</h5>
		<input type="text" id="id" name="id" placeholder="아이디 입력(6~10자)" onblur="idcheck()" />
		<button type="button" id="idcheck">중복 확인</button>
	</div>
	<div>
		<h5>비밀번호</h5>
		 <input type="text" style="display:none;">
		<input type="password" id="pw1" name="pw1" onchange="pw()" placeholder="8글자 이상, 영문, 숫자, 특수문자(@$!%*#?&)를 사용하세요." />
		<details>
		   <summary>※비밀번호 입력 조건</summary>
		   	<p>- 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자</p>
			<p>- 입력 가능 특수 문자 ~@#$%A()*_-={}];:,.?/</p>
			<p>- 공백 입력 불가능</p>
		</details>
		
	</div>
	<div>
		<h5>비밀번호 확인</h5>
		<form id="pass">
		<input type="text" style="display:none;">
		<input type="password" id="pw2" name="pw2" onchange="pwcheck()" /><span id="check"></span>
		</form>
	</div>
	<!-- <div class="mismatch-message hide">비밀번호가 일치하지 않습니다</div> -->
	
	<div id="joinname">
		<h5>이름</h5>
		<input type="text" id="name" name="name" />
	</div>
	<div id="joinemail" >
		<h5>이메일</h5>
		<input type="text" placeholder="이메일 입력" name="email" /> <input
			class="box" disabled id="domain_text" /> 
			<select id="domain_list" name="emaildomain">
			<option disabled value="type" selected>선택하세요.</option>
			<option value="@naver.com">naver.com</option>
			<option value="@daum.net">daum.net</option>
			<option value="@hanmail.net">hanmail.net</option>
			<option value="@google.com">google.com</option>
			<option value="@nate.com">nate.com</option>
			<option value="@type">직접 입력</option>
		</select>
	</div>
	<div>
		<h5>전화번호</h5>
		<input type="text" name="pnum">
	</div>
	<div>
		<h5>주소지 입력</h5>
		<input type="text" id="postcode" name="postcode" placeholder="우편번호">
		<input type="button" id="addrnum" value="우편번호 찾기" ><br> 
		<input type="text" id="sample6_address" name="addr" placeholder="주소"><br>
		<input type="text" id="sample6_detailAddress" name="addr" placeholder="상세주소"> 
		<input type="text" id="sample6_extraAddress" placeholder="참고항목">
	</div>
	<div class="info" id="info_bir">
		<h5>생년월일</h5>
		<select class="box" id="bir_year" name="bir1">
			<option disabled selected>출생 연도</option>
		</select> <select class="box" id="bir_month" name="bir2">
			<option disabled selected>월</option>
		</select> <select class="box" id="bir_day" name="bir3">
			<option disabled selected>일</option>
		</select>
	</div>
	<div id="joingender" >
		<h5>성별</h5>
		<label><input id="male" name="gender" type="radio" checked value="남">남</label>
		<input id="female" name="gender" type="radio" value="여"><label
			for="female">여</label>
	</div>
	<hr>
	<div id="join">
		<button type="submit">회원가입</button>
	</div>
</form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
/* 아이디 길이 */
	function idcheck() {
	if(id.length >= 6 && id.length <= 10) {
     	document.querySelector("#checkIdResult").innerText = "사용 가능";
     	document.querySelector("#checkIdResult").style.color = "green";
    } else {
     	document.querySelector("#checkIdResult").innerText = "6~10글자만 사용 가능합니다";
     	document.querySelector("#checkIdResult").style.color = "red";
    }

})
/* 아이디 중복 확인 */
let idcheck = false;
let doublecheck = document.querySelector('#idcheck');
doublecheck.addEventListener('click', function(e) { 
	e.preventDefault();
	if (!obj.id.value) {
		let id = document.getElementById("id").value;
	
	fetch('idCheck.do?id=' +id )
		.then(resolve => resolve.json())
		.then(result => {
			if (result.retCode == 'NG') {
				alert(id+"는 사용할 수 없는 아이디입니다.");
				idcheck = false;
				document.getElementById('id').value = null;
			} else {
				alert(id+"는 사용 가능한 아이디입니다.");
				idcheck = true;
			}
		})
		.catch(err => {
            console.error('err: ', error);
            isIdChecked = false;
        });
	}
	
}); 

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
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
	});
	
	/* 생년월일 */
	const birYear = document.querySelector('#bir_year');
	isYearOptionExisted = false;
	birYear.addEventListener('focus', function(e) {
		if (!isYearOptionExisted) {
			isYearOptionExisted = true;
			for(var i = 1930; i <= 2023; i++) {
				const YearOption = document.createElement('option')
				YearOption.setAttribute('value', i)
				YearOption.innerText = i
				this.appendChild(YearOption);
			}
		}
	});
/* 	const selectYear = document.querySelector('#print-date'); // print-date id 줘야함
	birYear.addEventListener('change', function(e) {
		selectYear.textContent = 'Year of birth: ${event.target.value}'
	});
	/* 월 */
 	const birMonth = document.querySelector('#bir_month');
	isMonthOptionExisted = false;
	birMonth.addEventListener('focus', function(e) {
		if (!isMonthOptionExisted) {
			isMonthOptionExisted = true;
			for(var i = 1; i <= 12; i++) {
				const MonthOption = document.createElement('option');
				MonthOption.setAttribute('value', i);
				MonthOption.innerText = i;
				this.appendChild(MonthOption);
			}
		}
	}); 
	/* 일 */
 	const birDay = document.querySelector('#bir_day');
	isDayOptionExisted = false;
	birDay.addEventListener('focus', function(e) {
		if (!isDayOptionExisted) {
			isDayOptionExisted = true;
				for(var i = 1; i <= 31; i++) {
					const DayOption = document.createElement('option');
					DayOption.setAttribute('value', i);
					DayOption.innerText = i;
					this.appendChild(DayOption);
				}
				
			} 
	}); 
	/* 비밀번호 */
	let passcheck = document.querySelector('#pw1');
	let reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/
	function pw() {
		if (passcheck.value != null) {
			if(!reg.test(passcheck.value)) {
				alert("비밀번호는 8자 이상, 숫자, 대문자, 소문자, 특수문자를 모두 포함되어야합니다.");
				document.querySelector('#pw1').innerText = "비밀번호는 8자 이상, 숫자, 대문자, 소문자, 특수문자를 모두 포함되어야합니다.";
				document.querySelector('#pw1').innerText.style.color = "red";
				document.querySelector('#pw1').focus();
			}
		}
		
	}
	/* 비밀번호 확인 */
	function pwcheck() {
		if (document.getElementById('pw2').value != null) {
			if (document.getElementById('pw1').value == document.getElementById('pw2').value){
				document.getElementById('check').innerHTML.value("비밀번호가 일치합니다.");
			} else {
				alert("비밀번호가 일치하지 않습니다.")
				document.getElementById('check').innerHTML.value("비밀번호가 일치하지 않습니다.");
				document.querySelector('#check').focus();
			}
		}
	}
	
	/* 회원가입 유효성 */
	function joinCheck(obj) {
		obj.preventDefault();
		if (!obj.id.value || obj.id.value.trim().length == 0){
			e.preventDefault();
			alert("아이디가 입력되지 않았습니다.");
			document.getElementById('id').focus;
			return false;
		}
		if (!isIdChecked) {
		        alert('아이디 중복 체크를 먼저 진행해주세요.');
		        document.getElementById('idcheck').focus;
		        return false;
		}
		if (!obj.pw1.value || obj.pw1.value.trim().length == 0){
			obj.preventDefault();
			alert(" 비밀번호가 입력되지 않았습니다.");
			document.getElementById('pw1').focus;
			return false;
		}
		/* if (document.getElementById('pw2').value != null) {
			obj.preventDefault();
			if (document.getElementById('pw1').value == document.getElementById('pw2').value){
				obj.preventDefault();
			} else {
				alert("비밀번호가 일치하지 않습니다.")
				document.getElementById('pw2').focus;
			}
			return false;
		} */
		if (!obj.name.value || obj.name.value.trim().length == 0) {
			alert("이름이 입력되지 않았습니다.");
			document.getElementById('name').focus;
			return false;
		}
		if (!obj.postcode.value || !obj.addr.value) {
			alert("주소가 입력되지 않았습니다.");
			document.getElementById('postcode').focus;
			return false;
		}
		if (!obj.bir1.value || !obj.bir2.value || !obj.bir3.value) {
			alert("생년월일이 입력되지 않았습니다.");
			document.getElementById('bir1').focus;
			return false;
		}
	}
		
	  

</script>
<jsp:include page="../layouts/footer.jsp"></jsp:include>