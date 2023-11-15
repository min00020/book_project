<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
	${cartList } ${bno }
	<table class="table" id="template">
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
					<td>${list.cartCode }</td>
					<td>${list.bookNo }</td>
					<td>${list.userId }</td>
					<td>${list.cartAmount }</td>
					<td><a
						href="deleteCart.do?cno=${list.cartCode}">삭제</a>
						<!-- 삭제 버튼을 누르면 delete.do로 장바구니 개별 id (삭제하길원하는 장바구니 id)를 보내서 삭제한다. -->
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<h3>장바구니등록</h3>
	<table class="table">



		<tr>
			<th>내용</th>
			<th>내용</th>
			<td><input type="text" id="content"></td>
		</tr>
	</table>
	<p>테스트</p>
	<p></p>
	<a href="orderListInfo.do">결제하기</a>
</div>
<script>
</script>
<jsp:include page="../layouts/footer.jsp"></jsp:include>
