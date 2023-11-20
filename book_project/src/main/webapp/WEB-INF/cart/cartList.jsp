<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css" />

<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:200,400&display=swap"
	rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet" />
<jsp:include page="../layouts/header.jsp"></jsp:include>
<style>
table {
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
	width: 5%;
}

th:nth-child(2), td:nth-child(2) {
	width: 15%;
}

th:nth-child(3), td:nth-child(3) {
	width: 20%;
}

th:nth-child(3), td:nth-child(4) {
	width: 10%;
}

tr:nth-child(even) {
	background-color: #fff6f6;
}

img {
	width: 130px;
}

.title {
	text-align: center;
	font-size: 30px;
	font-weight: 300;
	color: #222;
	letter-spacing: 1px;
	text-transform: uppercase;
	display: grid;
	grid-template-columns: 1fr max-content 1fr;
	grid-template-rows: 27px 0;
	grid-gap: 20px;
	align-items: center;
}

.title:after, .title:before {
	content: " ";
	display: block;
	border-bottom: 1px solid #c50000;
	border-top: 1px solid #c50000;
	height: 5px;
	background-color: #f8f8f8;
}

.sum {
	font-size: 34px;
	font-weight: 500;
	text-transform: uppercase;
}

.sum:before {
	background-color: #c50000;
	border-radius: 0.25rem;
	content: '';
	display: block;
	height: 0.25rem;
	width: 42px;
	margin-bottom: 1.25rem;
}
</style>


<div
	class="w-full container mx-auto flex flex-wrap items-center justify-between mt-0 px-6 py-3">
	<h1 class="title">${id}님의장바구니</h1>
	<table>
		<thead>
			<tr>
				<th><input type="checkbox" name="check" checked></th>
				<th>상품정보</th>
				<th>이름</th>
				<th>수량</th>
				<th>가격</th>
				<th>전체가격</th>
				<th><a href="#" class="btn btn-primary btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-check"></i>
					</span> <span class="text">전체삭제</span></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${cartList }" var="list">
				<tr id="${list.cartCode}">
					<td id="list-code">${list.cartCode}</td>
					<td><input type="checkbox" name="check"></td>
					<td><a href="bookInfo.do?bno=${list.bookNo }"> <img
							src="resources/image/${list.bookImage}">
					</a></td>
					<td>${list.bookTitle }</td>
					<td><select name="amount" onchange="changeFn()"
						class="form-control text-center me-3" id="amount"
						type="text" style="max-width: 3rem">
							<option class="list-Amountsum" value="${list.cartAmount}">${list.cartAmount}</option>
							<c:forEach begin="1" end="10" var="i">
								<option value="${i}">${i}</option>
							</c:forEach>

					</select></td>
					<td><fmt:formatNumber value="${list.bookPrice}"
							pattern="###,###,###" />원</td>
					<td><a class="list-Pricesum">${list.cartAmount * list.bookPrice}</a>원</td>
					<!-- 삭제 버튼을 누르면 delete.do로 장바구니 개별 id (삭제하길원하는 장바구니 id)를 보내서 삭제한다. -->
					<td><input type="button" id="delete"><a
						href="deleteCart.do?cno=${list.cartCode}">삭제하기</a></td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	<div style="text-align: center;" id="orderStatus">
		<a href="#" class="btn btn-primary btn-icon-split"> <span
			class="icon text-white-50"> <i class="fas fa-check"></i>
		</span> <span class="text">배송완료</span>
		</a> <a href="#" class="btn btn-danger btn-icon-split"> <span
			class="icon text-white-50"> <i class="fas fa-trash"></i>
		</span> <span class="text">변경</span>
		</a>
	</div>
	<div class="sum">
		<h1 class="totalAmount-sum">결제 수량 개</h1>
		<h1 class="totalPrice-sum">결제 금액 0원</h1>
		<a></a> <input type="submit" value="결제하기">
	</div>
	<p></p>
</div>
<script>

let result ={};
function changeFn(){

	
	const amount = document.getElementById('amount');
	result.amount = amount.options[amount.selectedIndex].innerText;
	console.log(result);
}

//주문완료
const a = document.querySelectorAll("#orderStatus a"); //주문 상태 변경 버튼 가져오기
console.log(a);

a[1].addEventListener('click', function (e){
	//console.log('주문취소버튼');
	e.preventDefault();
	document.querySelectorAll('tbody input[type=checkbox]:checked')
		const cno = document.getElementById('list-code').innerText;
		let result = {};
		const amount = document.getElementById("amount");
		result.amount = amount.options[amount.selectedIndex].value;
		
		console.log(cno);
		console.log(result.amount);
		
	})//end of eventListener


	let totalAmount = 0; 
	
	
	let amountsum = document.querySelectorAll(".list-Amountsum");
	for(let i of amountsum){
		totalAmount += (i.innerHTML) * 1; 
		} ;
	document.querySelector(".totalAmount-sum").innerHTML="결제 수량  : "+ totalAmount + "개";

	let totalPrice = 0; 
	let pricesum = document.querySelectorAll(".list-Pricesum"); 
	for(let i of pricesum){
	totalPrice += (i.innerHTML) * 1; 
	} ;
	document.querySelector(".totalPrice-sum").innerHTML="결제 금액 : " + totalPrice + "원";
	
	
	
//<fmt:formatNumber value="${list.bookPrice}" pattern="###,###,###" />  -- 금액 단위 
</script>
<jsp:include page="../layouts/footer.jsp"></jsp:include>
