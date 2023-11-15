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
<div
	class="w-full container mx-auto flex flex-wrap items-center justify-between mt-0 px-6 py-3">
	<h1>장바구니목록</h1>
	${cartList }
	<table class="table">
	<thead>
		<tr>
			<th>장바구니 번호</th>
			<th>책 번호</th>
			<th>연락처</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${cartList }" var="list">
		<tr>
			<td>${list.cartcode }</td>
			<td>${list.bookno }</td>
			<td>${list.userid }</td>
			<td>${list.cartamount }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
	
	<p>테스트</p>
	<a href="orderListInfo.do">결제하기</a>
</div>
<jsp:include page="../layouts/footer.jsp"></jsp:include>
