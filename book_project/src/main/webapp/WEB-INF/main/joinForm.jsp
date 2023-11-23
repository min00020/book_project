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
#top {
	margin-top: 30px;
	margin-bottom: 30px;
}
h5 {
	width: 102px;
}
input {
	border: 0;
	border-radius: 6px;
	background-color: rgb(233, 233, 233);
	margin-bottom: 6px;
	justify-content: flex-start;
}
.joinform {
	margin: auto;
	display: flex; 
    flex-direction: column; 
    align-items: center; 
}
 .join { 
    width: 600px;
    text-align: left;
	align-items: center;
}
.row {
	display: flex;
	flex-wrap: wrap; 	
}
	button {
		height: 35px;
		width: 90px;
	    background-color:#0a0a23;
	    color: #fff;
	    border:none;
	    border-radius:10px;
	    margin-top: 10px;
	    margin-bottom: 15px;
	}
	form {
		margin: 0 auto;
		margin-bottom: 60px;
	}
</style>
<script>
window.onload = function() {
    const urlParams = new URLSearchParams(window.location.search);
    const joinSuccessParam = urlParams.get('joinSuccess');

    if (joinSuccessParam === 'false') {
        alert("로그인에 실패하였습니다.");
    }
};
</script>
<div class="joinform">
	<form action="join.do" name="joinform" method="post" onsubmit="return joinCheck(this)">
		<table class="table" align="center">
		<h4 id="top" align="center">회원가입</h4>
		<div class="row">
			<h5>아이디</h5>
			<div id="joinid" class="join">
				<input type="text" id="id" name="id" onchange="checkidlength()" placeholder="아이디 입력(4자~20자)" />
				<input type="button" id="idcheck" value="중복 확인" />
			</div>
		</div>
		<div class="row">
			<h5>비밀번호</h5>
			<div class="join">
				<input type="password" id="pw1" name="pw1" onchange="pw()" placeholder="8글자 이상, 영문, 숫자, 특수문자(@$!%*#?&)를 사용하세요." />	
			</div>
		</div>
		<details>
			<summary>비밀번호 입력 조건</summary>
			<p>- 비밀번호 8자 이상</p>
			<p>- 영문/숫자/대문자/소문자/특수문자를 모두 포함</p>
			<p>- 입력 가능 특수 문자 @$!%*#?&</p>
			<p>- 공백 입력 불가능</p>
		</details>
		<div class="row">
			<h5>비밀번호 확인</h5>
			<div class="join">
				<input type="password" id="pw2" name="pw2" onchange="pwcheck()" /><span id="check"></span>
			</div>
		</div>
		<!-- <div class="mismatch-message hide">비밀번호가 일치하지 않습니다</div> -->
		<div class="row">
			<h5>이름</h5>
			<div id="joinname" class="join">
				<input type="text" id="name" name="name" />
			</div>
		</div>
		<div class="row">
			<h5>이메일</h5>
		<div id="joinemail" class="join">
			<input type="text" placeholder="이메일 입력" name="email" /> 
				<input class="box" disabled id="domain_text" /> 
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
		</div>
		<div class="row">
			<h5>전화번호</h5>
		<div class="join">
			<input type="text" name="pnum" placeholder="010-1111-1111" >
		</div>
		</div>
		<div class="row">
			<h5>우편 번호</h5>
			<div class="join">
				<input type="text" id="postcode" name="postcode" placeholder="우편번호">
				<input type="button" id="addrnum" value="우편번호 찾기" >
				<!-- 
				<input type="text" id="sample6_detailAddress" name="addr" placeholder="상세주소"> 
				<input type="text" id="sample6_extraAddress" placeholder="참고항목"> -->
			</div>
			</div>
			<div class="row">
			<h5>상세 주소</h5>
			<div class="join">
				<input type="text" id="sample6_address" name="addr" placeholder="주소">
			</div>
			</div>
		<div class="row">
			<h5>생년월일</h5>
		<div class="info" id="info_bir">
			<div>
			<select class="box" id="bir_year" name="bir1">
				<option disabled selected>출생 연도</option>
			</select>년 <select class="box" id="bir_month" name="bir2">
				<option disabled selected>월</option>
			</select>월 <select class="box" id="bir_day" name="bir3">
				<option disabled selected>일</option>
			</select>일
			</div>
			<div class="error-msg"></div>
		</div>
		</div>
		<div class="row">
		<h5>성별</h5>
		<div id="joingender" class="join">
			<label><input name="gender" type="radio" checked value="남">남</label>
			<input name="gender" type="radio" value="여">
			<label>여</label>
		</div>
		</div>
		<div id="join">
			<button type="submit">회원가입</button>
		</div>
		</table>
	</form>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
/* 아이디 길이 확인 */
function checkidlength() {
	let id = document.getElementById("id").value;
	if (id.length < 4 || id.length > 20) {
		alert("아이디 길이는 4자~20자로 입력하여야 합니다.");
		document.getElementById('id').value = null;
		document.getElementById('id').focus();
	}
} 
/* 아이디 중복 확인 */
let isIdChecked = null;
let doublecheck = document.querySelector('#idcheck');
doublecheck.addEventListener('click', function(e) { 
	e.preventDefault();
	let id = document.getElementById("id").value;
	if (id.length > 1) {
	console.log(document.getElementById("id").value);
	
	fetch('idCheck.do?id=' +id )
		.then(resolve => resolve.json())
		.then(result => {
			if (result.retCode == 'NG') {
				alert(id+"는 사용할 수 없는 아이디입니다.");
				isIdChecked = false;
				document.getElementById('id').value = null;
			} else {
				isIdChecked = true;
				alert(id+"는 사용 가능한 아이디입니다.");
				
			}
		})
	} else {
		alert("아이디를 입력해주세요.")
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
	
	/* 생년월일 윤년 */
	const birthArr = [-1, -1, -1]
	const birtherrmsg = document.querySelector('#info_bir .error-msg');
	
	birYear.addEventListener('change', () => {
		  birthArr[0] = birYear.value
		  checkBirthValid(birthArr)
		});

	birMonth.addEventListener('change', () => {
		  birthArr[1] = birMonth.value
		  checkBirthValid(birthArr)
		});

	birDay.addEventListener('change', () => {
		  birthArr[2] = birDay.value
		  checkBirthValid(birthArr)
		});
	
	function checkBirthValid(birthArr) {
		  isBirthValid = true
		  y = birthArr[0]
		  m = birthArr[1]
		  d = birthArr[2]
		  
		  if(y > 0 && m > 0 && d > 0) {
		    if ((m == 4 || m == 6 || m == 9 || m == 11) && d == 31) { 
		      isBirthValid = false
		    }
		    else if (m == 2) {
		      if(((y % 4 == 0) && (y % 100 != 0)) || (y % 400 == 0)) { // 윤년
		        if(d > 29) { 
		          isBirthValid = false;
		        }
		      } else { 
		        if(d > 28) { 
		          isBirthValid = false;
		        }
		      }
		    }
		  }

		    if(isBirthValid) { 
		    	birtherrmsg.textContent = "";
		    } else { 
		    	birtherrmsg.textContent = "생년월일을 다시 확인해주세요";
		    	birtherrmsg.style.color = "red";
		    }
		  }

	/* 비밀번호 */
	let passcheck = document.querySelector('#pw1');
	let reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/
	function pw() {
		if (passcheck.value != null) {
			if(!reg.test(passcheck.value)) {
				alert("비밀번호는 8자 이상, 숫자, 대문자, 소문자, 특수문자를 모두 포함되어야합니다.");
				document.getElementById('pw1').value = null;
				document.getElementById('pw1').focus;
			}
		}
		
	}
	/* 비밀번호 확인 */
	function pwcheck() {
		if (document.getElementById('pw2').value != null) {
			if (document.getElementById('pw1').value != document.getElementById('pw2').value){
				alert("비밀번호가 일치하지 않습니다.");
				document.getElementById('pw2').value = null;
				document.getElementById('pw2').focus;
			}
		}
	}
	/* 비밀번호 입력 조건 */
	/* let pwbtn = document.getElementById('pwbtn');
	pwbtn.addEventListener('click', function toggleDiv() {
	  const div = document.getElementById('pwinput');
	  
	  if(div.style.visibility === 'hidden')  {
	    div.style.visibility = 'visible';
	  }else {
	    div.style.visibility = 'hidden';
	  }
	}) */
	 
	
	/* 회원가입 유효성 */
	function joinCheck(obj) {
	console.log("isIdChecked", isIdChecked);
		/* obj.preventDefault(); */
		if (!obj.id.value || obj.id.value.trim().length == 0){
			alert("아이디가 입력되지 않았습니다.");
			return false;
		}
		if (!obj.pw1.value || obj.pw1.value.trim().length == 0){
			alert(" 비밀번호가 입력되지 않았습니다.");
			return false;
		}
		if (isIdChecked == null ) {
			alert("아이디 중복 체크를 먼저 진행해주세요.");
			document.getElementById('idcheck').focus;
			return false;
		} 
		if (isBirthValid == false) {
			alert("생년월일을 올바르게 입력해주세요.");
			return false;
		}
		return true;
	}
		
	  

</script>
<jsp:include page="../layouts/footer.jsp"></jsp:include>