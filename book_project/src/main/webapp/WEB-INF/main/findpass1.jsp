<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet"
	href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css" />

<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:200,400&display=swap"
	rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet" />
<jsp:include page="../layouts/header.jsp"></jsp:include>
<style>
h5 {
	margin: 20px;
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
</style>
<form action="findpass.do" method="post">
<hr>
	<table class="table" align="center">
	<c:choose>
		<c:when test="${!empty pw }">
			<tr>
				<h5 align="center">회원 정보가 존재합니다.</h5>
			</tr>
			<tr>
				<h5 align="center">비밀번호 ${pw.userPass }</h5>
			</tr>
			<tr>
			<td><button type="button" onclick="location.href='loginForm.do'">로그인</button></td>
			</tr>
		</c:when>
		<c:when test="${empty vo }">
			<tr>
				<h5 align="center">일치하는 회원 정보가 없습니다.</h5>
			</tr>
			<tr>
			<td><button type="button" onclick="location.href='findpassForm.do'">이전 페이지</button></td>
			</tr>
		</c:when>
	</c:choose>
	</table>
</form>
<jsp:include page="../layouts/footer.jsp"></jsp:include>