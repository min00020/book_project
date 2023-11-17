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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="modifyuser.do" method="post" onsubmit="return modifyCheck(this)">
		<h3>회원 정보 수정</h3>
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
			<input type="password" id="pw2" onchange="pwcheck()" /><span
				id="check"></span>
		</div>
		<div id="name">
			<h5>이름</h5>
			<input type="text" readonly id="name" name="name" value="${vo.userName }" />
		</div>
		<div id="joinemail">
			<h5>이메일</h5>
			<input type="text" placeholder="이메일 입력" name="email"
				value="${vo.userEmail }" /> <input class="box" disabled
				id="domain_text" /> <select id="domain_list" name="emaildomain">
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
			<input type="text" id="postcode" name="postcode"
				value="${vo.userAddrnum }"> <input type="button"
				id="addrnum" value="우편번호 찾기"><br> <input type="text"
				id="sample6_address" name="addr" value="${vo.userAddr }"><br>
			<div class="info" id="info_bir">
				<h5>생년월일</h5>
				<input readonly value="${vo.userBir }">
			</div>
			<div id="gender">
				<h5>성별</h5>
				<input type="text" readonly value="${vo.userGender }">
			</div>
			<hr>
			<div id="modify">
				<input type="submit" value="수정">
				<button type="reset">초기화</button>
			</div>
	</form>
</body>
</html>
<jsp:include page="../layouts/footer.jsp"></jsp:include>
<script>
function pwcheck() {
	if (document.getElementById('pw2').value != null) {
		if (document.getElementById('pw1').value == document.getElementById('pw2').value){
			document.getElementById('check').innerHTML.value("비밀번호가 일치합니다.");
		} else {
			alert("비밀번호가 일치하지 않습니다.")
			document.getElementById('check').innerHTML.value("비밀번호가 일치하지 않습니다.");
			document.getElementById('check').focus();
		}
	}
}
function modifyCheck(obj) {
	if (!obj.pw1.value || obj.pw1.value.trim().length == 0){
		alert(" 비밀번호가 입력되지 않았습니다.");
		return false;
	}
	if (document.getElementById('pw2').value != null) {
		if (document.getElementById('pw1').value == document.getElementById('pw2').value){
			document.getElementById('check').innerHTML.value("비밀번호가 일치합니다.");
		} else {
			alert("비밀번호가 일치하지 않습니다.")
			document.getElementById('check').innerHTML.value("비밀번호가 일치하지 않습니다.");
			document.getElementById('check').innerHTML.value="";
		}
	}
}

</script>