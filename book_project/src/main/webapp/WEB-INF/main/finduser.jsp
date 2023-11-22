<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	th {
		font-size: large;
	}
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
	}
</style>
<form action="finduser.do" method="post">
<hr>
	<table class="table" align="center">
		<h4 id="top" align="center">아아디 찾기</h4>
		<tr>
			<th>이름</th>
			<td><input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요."></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" class="form-control" id="phone" name="phone" placeholder="010-1111-2222"></td>
		</tr>
		<tr>
			<td align="center" colspan="2">
			<button type="submit" id="findid">아이디 찾기</button>
			<button type="button" onclick="location.href='loginForm.do'">로그인 페이지</button>
			</td>
		</tr>
	</table>
</form>
<jsp:include page="../layouts/footer.jsp"></jsp:include>