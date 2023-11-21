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
<!-- 포트원 결제 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- 포트원 결제 -->
<style>
form {
	border-collapse: collapse;
	width: 100%;
	margin: 1rem auto;
	background-color: white;
}

table {
	width: 100%;
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

.view, .delete {
	border: none;
	padding: 5px 10px;
	color: #fff;
	font-weight: bold;
}

.delete {
	background-color: #E91E63;
}

.tablefoot {
	padding: 0;
	border-bottom: 3px solid #009688;
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

select {
	-moz-appearance: none;
	-webkit-appearance: none;
	appearance: none;
	font-family: "Noto Sansf KR", sans-serif;
	font-size: 15px;
	font-weight: 400;
	line-height: 1.5;
	color: #444;
	background-color: #fff;
	padding: .6em 1.4em .5em .8em;
	margin: 0;
	border: 1px solid #aaa;
	border-radius: .5em;
	box-shadow: 0 1px 0 1px rgba(0, 0, 0, .04);
}

select:hover {
	border-color: #888;
}

select:focus {
	border-color: #aaa;
	box-shadow: 0 0 1px 3px rgba(59, 153, 252, .7);
	box-shadow: 0 0 0 3px -moz-mac-focusring;
	color: #222;
	outline: none;
}

select:disabled {
	opacity: 0.5;
}

option {
	text-align: center;
}

button.button {
	display: block;
	position: relative;
	float: left;
	width: 300px;
	padding: 0;
	margin: 10px 20px 10px 0;
	font-weight: 600;
	text-align: center;
	line-height: 50px;
	color: #FFF;
	border-radius: 5px;
	transition: all 0.2s;
}
a.button {
	display: block;
	position: relative;
	float: left;
	width: 300px;
	padding: 0;
	margin: 10px 20px 10px 0;
	font-weight: 600;
	text-align: center;
	line-height: 50px;
	color: #FFF;
	border-radius: 5px;
	transition: all 0.2s;
}

.btnBlueGreen {
	background: #00AE68;
}

.btnLightBlue {
	background: #5DC8CD;
}
</style>





<div
	class="w-full container mx-auto flex flex-wrap items-center justify-between mt-0 px-6 py-3">


		<c:choose>
			<c:when test="${empty cartList || empty id }">
				<h1 class="title">${id}님의장바구니</h1>
				<table>

					<thead>

						<tr>
							<th colspan="7" style="text-align: center;">상품정보</th>

						</tr>

					</thead>

					<tbody>
						<tr style="text-align: center;">
							<td colspan="8"><h3>장바구니가 비었습니다.</h3></td>
						</tr>
					</tbody>
				</table>

			</c:when>
			<c:otherwise>
				<table>
					<h1 class="title">${id}님의장바구니</h1>


					<thead>

						<tr>
							<th colspan="7" style="text-align: center;">상품정보</th>

						</tr>

					</thead>

					<tbody>
						<c:forEach items="${cartList }" var="list" varStatus="status">

							<tr id="cno">


								<td><a href="bookInfo.do?bno=${list.bookNo }"> <img
										src="resources/image/${list.bookImage}" id="bookimage">

								</a></td>
								<td>${list.bookTitle }</td>

								<td><select name="amount" id="${status.count }"
									onchange="fn_check(this,${list.cartCode });"
									style="max-width: 3rem">

										<option class="list-Amountsum" value="${list.cartAmount}">${list.cartAmount}</option>

										<c:forEach begin="1" end="10" var="i">

											<option id="amount-item" data-value="${list.cartAmount }"
												value="${i}">${i}</option>

										</c:forEach>
								</select>개</td>

								<td><fmt:formatNumber value="${list.bookPrice}"
										pattern="###,###,###" />원</td>

								<td><a class="list-Pricesum">${list.cartAmount * list.bookPrice}</a>원</td>

								<!-- 삭제 버튼을 누르면 delete.do로 장바구니 개별 id (삭제하길원하는 장바구니 id)를 보내서 삭제한다. -->

								<td><button class="delete"
										onclick="location.href='deleteCart.do?cno=${list.cartCode}'">삭제하기</button></td>

							</tr>

						</c:forEach>
					</tbody>

				</table>
				<div>
					<div class="sum">
						<h1 class="totalAmount-sum">수량 개</h1>
						<h1 class="totalPrice-sum">금액 0원</h1>
						<a href="main.do" title="Button fade lightblue"
							class="button btnFade btnLightBlue">쇼핑계속하기</a>
						<button class="button btnFade btnBlueGreen" id="tttt">주문하기</button>
					</div>

				</div>
			</c:otherwise>
		</c:choose>
</div>

<script>

function fn_check(ths,code){ 

	const amo = ($(ths).val());
	console.log(amo); // 수량
	console.log(code); // 상품코드
	
		fetch('modifyCart.do', {

			method: 'post',

			headers: {'Content-type': 'application/x-www-form-urlencoded'},

			body: 'cno=' + code +'&amo='+ amo

		})

		.then(resolve => resolve.json())

		.then(result =>{

			if(result.retCode == 'OK'){
				location.href = location.href;
			} else{
				alert('변경실패')
			}
		})//end of fetch
}




	// 계산
	let totalAmount = 0; 

	

	

	let amountsum = document.querySelectorAll(".list-Amountsum");

	for(let i of amountsum){

		totalAmount += (i.innerHTML) * 1; 

		} ;

	document.querySelector(".totalAmount-sum").innerHTML= "수량  : "+ totalAmount + "개";



	let totalPrice = 0; 

	let pricesum = document.querySelectorAll(".list-Pricesum"); 

	for(let i of pricesum){

	totalPrice += (i.innerHTML) * 1; 

	};

	document.querySelector(".totalPrice-sum").innerHTML= "금액 : " + totalPrice + "원";

	
	// 주문하기 버튼 클릭시
	document.getElementById('tttt').addEventListener('click', (e) => {
		
		console.log("orderListInfo.do?totalPrice=" + totalPrice + "&amount=" + totalAmount);
		console.log(window.location.href);
		window.location.href =  "orderListInfo.do?totalPrice=" + totalPrice + "&amount=" + totalAmount;  
	})

//<fmt:formatNumber value="${list.bookPrice}" pattern="###,###,###" />  -- 금액 단위 

</script>

<jsp:include page="../layouts/footer.jsp"></jsp:include>