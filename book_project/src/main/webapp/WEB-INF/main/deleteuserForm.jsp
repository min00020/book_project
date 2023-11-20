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
			<h5>"${pass }"</h5>
			<h5>"${id }"</h5>
		</div>
		<div>
			<input type="submit" value="탈퇴하기">
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
	}
</script>
<jsp:include page="../layouts/footer.jsp"></jsp:include>