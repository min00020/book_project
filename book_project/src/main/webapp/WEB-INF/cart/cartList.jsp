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
<style>
form {
	border-collapse: collapse;
	width: 100%;
	margin: 1rem auto;
	background-color: white;
}

/* 테이블 행 */
th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
	text-align: center;
}

th {
	background-color: #1b1b1b;
	color: #ddd;
}

/* 테이블 올렸을 때 */
tbody tr:hover {
	background-color: #d3d3d3;
	opacity: 0.9;
	cursor: pointer;
}

/* 테이블 비율 */
th:nth-child(1), td:nth-child(1) {
	width: 7%;
}

th:nth-child(2), td:nth-child(2) {
	width: 10%;
}

th:nth-child(3), td:nth-child(3) {
	width: 25%;
}
th:nth-child(3), td:nth-child(4) {
	width: 3%;
}

tr:nth-child(even) {
	background-color: #fff6f6;
}

img {
	width: 130px;
}
</style>


<div
	class="w-full container mx-auto flex flex-wrap items-center justify-between mt-0 px-6 py-3">
	<form action="orderListInfo.do">
	<h1>	${id} 님의 장바구니목록</h1>
	<table id="table">
		<thead>
			<tr>
				<th>상품정보</th>
			</tr>
		</thead>
		<tbody id=listbody>
			<c:forEach items="${cartList }" var="list">
				<c:choose>
					<c:when test="${empty id == list.userId}">
						<tr>
							<td><input name="chkbox" type="checkbox" onClick="itemSum(this.form);"> </td>
							<td><a href="bookInfo.do?bno=${list.bookNo }"> <img
									src="resources/image/${list.bookImage}">
							</a></td>
							<td>${list.bookTitle }</td>
							<td>${list.cartAmount }개</td>
							<td>${list.bookPrice}원</td>
							<td>${list.cartAmount * list.bookPrice}원</td>
							<td><a href="deleteCart.do?cno=${list.cartCode}">삭제하기</a> 
						</tr>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</tbody>
	</table>
							<!-- 삭제 버튼을 누르면 delete.do로 장바구니 개별 id (삭제하길원하는 장바구니 id)를 보내서 삭제한다. -->
	<input type="submit" value="결제하기">
	</form>
	<p></p>
</div>
<script>
</script>
<jsp:include page="../layouts/footer.jsp"></jsp:include>
