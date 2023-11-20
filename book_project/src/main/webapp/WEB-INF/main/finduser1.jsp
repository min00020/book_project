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
<form action="findid.do" method="post">
<hr>
	<table class="table" align="center">
	<c:choose>
		<c:when test="${!empty id }">
			<tr>
				<h5 align="center">아이디가 존재합니다.</h5>
			</tr>
			<tr>
				<h5 align="center">${vo.id }</h5>
			</tr>
			<tr>
			<td><input type="button" onclick="location.href='loginForm.do'" value="로그인"></td>
			</tr>
		</c:when>
		<c:otherwise>
			<tr>
				<h5 align="center">아이디가 존재하지않습니다.</h5>
			</tr>
			<tr>
			<td><input type="button" onclick="location.href='findUserForm.do'" value="이전 페이지"></td>
			</tr>
	
		</c:otherwise>
	</c:choose>
	</table>
</form>
<jsp:include page="../layouts/footer.jsp"></jsp:include>