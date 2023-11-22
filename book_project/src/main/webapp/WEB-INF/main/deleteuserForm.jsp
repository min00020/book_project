<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css" />
<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:200,400&display=swap"
	rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet" />
<link href="resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
<jsp:include page="../layouts/header.jsp"></jsp:include>
<style>
input {
		height: 30px;
		border: 0;
		border-radius: 6px;
		background-color: rgb(233, 233, 233);
		display:flex; 
		justify-content: flex-start; 
		align-items: center;
		margin-bottom: 10px;
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
	}
	form {
		margin-bottom: 60px;
		margin: auto;
		display: flex; 
	    flex-direction: column; 
	    align-items: center;
	}
</style>
<form action="deleteuser.do" method="post" onsubmit="return deleteuser(this)">
	<table class="table" align="center">
	<h4>회원 탈퇴</h4>
		<div id="id">
			<h5>
				아이디 <input readonly type="text" name="id" value="${id }" />
			</h5>
		</div>
		<div>
			<h5>
				비밀번호 <input type="password" id="pass" name="pass" />
			</h5>
		</div>
		<div>
			<button type="submit">탈퇴하기</button>
		</div>
	</table>
</form>
<script>
	function deleteuser(obj) {
		if (!obj.pass.value || obj.pass.value.trim().length == 0){
			alert("비밀번호가 입력되지 않았습니다.");
			return false;
		}
		if (obj.pass.value != "${pass }") {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		return true;
	}
</script>
<jsp:include page="../layouts/footer.jsp"></jsp:include>