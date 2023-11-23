<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
* {
	margin: 0 auto;
	text-align: center;
}

form {
	border-collapse: collapse;
	width: 500px;
	margin: 1rem auto;
	background-color: white;
}
table {
	width: 300px;
	text-align: center;
	border: 1px solid #fff;
	border-spacing: 1px;
	font-family: 'Cairo', sans-serif;
	margin: auto;
}

caption {
	font-weight: bold;
}

table td {
	padding: 10px;
	background-color: #eee;
}

table th {
	background-color: #333;
	color: #fff;
	padding: 10px;
}

#bookimage {
	width: 200px;
	height: 200px;
}

</style>
<div class="px-4 py-1 my-5 text-center">
	<h4 class="fw-bold text-body-emphasis mb-3">구매가 정상적으로 완료되었습니다!</h4>
	<div class="d-flex justify-content-center">
		<hr class="w-50">
	</div>
	<div class="col-lg-6 mx-auto">
		<div class="d-grid gap-6 d-sm-flex justify-content-between py-5">
			<div>
				<h5>${id} 님의 주문목록</h5>
				<form>
				<table>

					<thead>

						<tr>
							<th colspan="7" style="text-align: center;" class="title"></th>

						</tr>

					</thead>

					<tbody>
						<c:forEach items="${orderList }" var="list" varStatus="status">

						<tr id="cno">


							<td><a href="bookInfo.do?bno=${list.bookNo }"> <img
									src="resources/image/${list.bookImage}" id="bookimage">

							</a></td>
							<td>${list.bookTitle }</td>


							<td><fmt:formatNumber value="${list.bookPrice}"
									pattern="###,###,###" />원</td>

							<td><a class="list-Pricesum">${list.cartAmount * list.bookPrice}</a>원</td>

						</tr>

					</c:forEach>

					</tbody>

				</table>
				</form>
			</div>
			<div>
				<h5></h5>
			</div>
		</div>
		<div class="d-grid gap-6 d-sm-flex justify-content-between py-5">
			<div>
				<h5>주문번호</h5>
				<a></a>
			</div>
			<div>
				<h5></h5>
			</div>
		</div>
		<div class="d-grid gap-6 d-sm-flex justify-content-between py-5">
			<div>
				<h5>결제금액</h5>
				<a>${totalPrice }</a>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">
		<hr class="w-50">
	</div>

	<div class="col-lg-6 mx-auto">
		<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
				<input type="button" value="마이페이지로 가기" onclick="mypage()">
				<input type="button" value="메인으로 가기" onclick="main()">
		</div>
	</div>
</div>

<script>

//장바구니 초기화
function main(){ 

	
	fetch('deleteAllCart.do', {

		method: 'post',

		headers: {'Content-type': 'application/x-www-form-urlencoded'},

	})

	.then(resolve => resolve.json())

	.then(result =>{

		if(result.retCode == 'OK'){
			location.href =  "main.do";
		} else{
			location.href =  "main.do";
			console.log('삭제 실패')
		}
	})//end of fetch
}

function mypage(){ 

	
	fetch('deleteAllCart.do', {

		method: 'post',

		headers: {'Content-type': 'application/x-www-form-urlencoded'},

	})

	.then(resolve => resolve.json())

	.then(result =>{

		if(result.retCode == 'OK'){
			location.href =  "mypage.do";
		} else{
			location.href =  "mypage.do";
		}
	})//end of fetch
}
</script>