<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet"
	href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css" />

<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:200,400&display=swap"
	rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet" />
<jsp:include page="../layouts/header.jsp"></jsp:include>
<form action="finduser.do" method="post">
<hr>
	<table class="table" align="center">
		<h4 align="center">아아디 찾기</h4>
		<tr>
			<th>이름</th>
			<td><input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요."></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" class="form-control" id="phone" name="phone" placeholder="010-1111-2222"></td>
		</tr>
		<tr>
			<td><input type="submit" id="findid" value="아이디 찾기"></td>
		</tr>
	</table>
</form>
<jsp:include page="../layouts/footer.jsp"></jsp:include>