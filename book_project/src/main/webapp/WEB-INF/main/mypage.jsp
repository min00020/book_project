<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="co.yedam.user.service.UserVO" %>
<link rel="stylesheet" href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css" />
<link href="https://fonts.googleapis.com/css?family=Work+Sans:200,400&display=swap" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet" />
<link href="resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
<jsp:include page="../layouts/header.jsp"></jsp:include>
<style>
	#contain {
		margin : auto;
	}
</style>
	<div class="col-lg-6" id="contain">
		<!-- Overflow Hidden -->
		<div class="card mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">주문목록</h6>
			</div>
			<div class="card-body">
				Use
				<code>.o-hidden</code>
				to set the overflow property of any element to hidden.
			</div>
		</div>
		<!-- Overflow Hidden -->
		<div class="card mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">내가 쓴 글</h6>
			</div>
			<div class="card-body">
				Use
				<code>.o-hidden</code>
				to set the overflow property of any element to hidden.
			</div>
		</div>
		<!-- Overflow Hidden -->
		<div class="card mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">회원정보수정</h6>
			</div>
			<div class="card-body">
		<form action="modifyuser.do" method="post" onsubmit="return joinCheck(this)">
			<div id="id">
				<h5>아이디 <input readonly type="text" name="id" value="${vo.userId }" /> </h5> 	
			</div>
		<div>
			<h5>비밀번호 <input readonly type="password" id="pw1" name="pw1" value="${vo.userPass }" /> </h5>
			
		</div>
		<div id="name">
			<h5>이름 <input readonly type="text" id="name" name="name" value="${vo.userName }" /> </h5>
			
		</div>
		<div id="joinemail">
			<h5>이메일 <input readonly type="text" placeholder="이메일 입력" name="email"
				value="${vo.userEmail }" /> </h5>
			
		</div>
		<div>
			<h5>전화번호 <input readonly type="text" name="pnum" value="${vo.userPhone }"> </h5>
			
		</div>
		<div>
			<h5>주소</h5>
			<input type="text" readonly id="postcode" name="postcode" value="${vo.userAddrnum }"> <br> 
			<input readonly type="text" id="sample6_address" name="addr" value="${vo.userAddr }"><br>
			<div class="info" id="info_bir">
				<h5>생년월일 <input value="${vo.userBir }"> </h5>
			</div>
			<div id="gender">
				<h5>성별 <input value="${vo.userGender }"> </h5>
			</div>
			</div>
			</form>
				<div class="card-body text-center">
				<input type="button" onclick="location.href='modifyForm.do?id=${id }'" value="회원 정보 수정">
				</div>
			</div>
		</div>
</div>
<script src="resources/admin/js/sb-admin-2.min.js"></script>
<jsp:include page="../layouts/footer.jsp"></jsp:include>