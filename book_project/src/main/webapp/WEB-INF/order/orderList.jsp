<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>예담 책방 주문페이지</title>
<style>
* {
	margin: 0 auto;
	text-align: center;
}

body {
	width: 500px;
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
	width: 100px;
	height: 100px;
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

input[type=text], [type=email] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	box-sizing: border-box;
}

#paymentBtn button {
	display: block;
	position: relative;
	float: left;
	width: 120px;
	padding: 0;
	margin: 10px 20px 10px 0;
	font-weight: 600;
	text-align: center;
	line-height: 50px;
	color: #FFF;
	border-radius: 5px;
	transition: all 0.2s;
	background: #5DC8CD;
}
</style>

<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
</head>

<body>
	<div>
		<a> <img src="resources/image/logo.jpg">

		</a>

		<div class="col-md-7 col-lg-8">
			<form class="needs-validation" novalidate>
				<div class="col-12"></div>

				<div class="col-12">
					<label for="firstName" class="form-label">이름</label> <input
						type="text" class="form-control" id="firstName" placeholder=""
						value="${userInfo.userName }" required>
				</div>

				<div class="col-12">
					<label for="firstName" class="form-label">전화번호</label> <input
						type="text" class="form-control" id="tel" placeholder=""
						value="${userInfo.userPhone }" required>
				</div>

				<div class="col-12">
					<label for="email" class="form-label">이메일</label> <input
						type="email" class="form-control" id="email"
						placeholder="you@example.com" value="${userInfo.userEmail }">
				</div>

				<div class="col-12">
					<input type="button" id="addrnum" value="주소 찾기">
					<p></p>
					<input type="text" id="postcode" name="postcode" placeholder="우편번호"
						value="${userInfo.userAddrnum }"> <input type="text"
						id="sample6_address" name="addr" placeholder="주소"
						value="${userInfo.userAddr }"><br> <input type="text"
						id="sample6_detailAddress" name="addr" placeholder="상세주소">
					<input type="text" id="requestD" placeholder="요청사항">
				</div>

				<br>
				<table>


					<thead>

						<tr>
							<th colspan="7" style="text-align: center;" class="title">${userInfo.userName}
								님의 주문목록</th>

						</tr>

					</thead>

					<tbody>

						<c:forEach items="${cartList }" var="list" varStatus="status">

							<tr class="cno">
								<td><a href="bookInfo.do?bno=${list.bookNo }"> <img
										src="resources/image/${list.bookImage}" id="bookimage">

								</a></td>
								<td>${list.cartCode }</td>
								<td>${list.bookNo }</td>
								<td>${list.bookTitle }</td>

								<td>${list.cartAmount}</td>


							</tr>

						</c:forEach>
					</tbody>

				</table>

				<br>
				<div id="paymentBtn">
					<h4 class="mb-3">결제수단</h4>
					<input type="button" value="토스" onclick="tossPay()"> <input
						type="button" value="신용카드" onclick="cardPay()"> <input
						type="button" value="카카오페이" onclick="kakaoPay()">
				</div>
			</form>
			<a href="javascript:history.back();">돌아가기</a>

		</div>
	</div>


</body>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script>
	const make_merchant_uid = () => {
		const current_time = new Date();
		const year = current_time.getFullYear().toString();
		const month = (current_time.getMonth() + 1).toString();
		const day = current_time.getDate().toString();
		const hour = current_time.getHours().toString();
		const minute = current_time.getMinutes().toString();
		const second = current_time.getSeconds().toString();
		const merchant_uid = year + month + day + hour + minute + second;
		return merchant_uid;
	};

	const merchant_uid = make_merchant_uid();

	let cartList = '${cartList}';
	console.log('테스트', cartList);
	
	let totalPrice = '${totalPrice}';

	    
	/* 우편 주소 api */
	const addrnum = document.querySelector('#addrnum');
	addrnum
		.addEventListener(
			'click',
			function goPopup() {
				new daum.Postcode({
					oncomplete: function (data) {

						var addr = '';
						var extraAddr = '';
						if (data.userSelectedType === 'R') {
							addr = data.roadAddress;
						} else {
							addr = data.jibunAddress;
						}
						if (data.userSelectedType === 'R') {
							if (data.bname !== '' &&
								/[동|로|가]$/g
								.test(data.bname)) {
								extraAddr += data.bname;
							}
							if (data.buildingName !== '' &&
								data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', ' +
									data.buildingName :
									data.buildingName);
							}
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr +
									')';
							}
							document
								.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document
								.getElementById("sample6_extraAddress").value = '';
						}
						document.getElementById('postcode').value = data.zonecode;
						document
							.getElementById("sample6_address").value = addr;
						document.getElementById(
								"requestD")
							.focus();
					}
				}).open();
			});

	function addOrder() { 

		let name = document.querySelector('#firstName').value;
		let phone = document.querySelector('#tel').value;
		let zipcode = document.querySelector('#postcode').value;
		let addr = document.querySelector('#sample6_address').value;
		let addrd = document.querySelector('#sample6_detailAddress').value;
		let totalPrice = '${totalPrice}';
		let request = document.querySelector('#requestD').InnerText;


		fetch('addOrder.do', {
				method: 'post',

				headers: {
					'Content-type': 'application/x-www-form-urlencoded'
				},

				body: 'name=' + name + '&phone=' + phone + '&zipcode=' + zipcode + '&addr=' + addr + '&addrd=' +
					addrd +
					'&totalPrice=' + totalPrice + '&request=' + request

			})

			.then(resolve => resolve.json())

			.then(result => {
				if (result.retCode == 'OK') {
					alert('addOrder 성공')
				} else {
					alert('addOrder 실패')
				}
			}) //end of fetch
	}
	
	

	

	/*******************************
	결제 하기
	********************************/

	const IMP = window.IMP
	IMP.init('imp61344571');




	function tossPay() {
		// IMP.request_pay(param, callback) 결제창 호출
		IMP.request_pay({ // param
			pg: 'tosspay',
			pay_method: 'card',
			merchant_uid: merchant_uid, // 상점에서 관리하는 주문 번호를 전달
			name: '도서',
			amount: '${totalPrice}',
			buyer_email: '${userInfo.userEmail}',
			buyer_name: '${userInfo.userName}',
			buyer_tel: '${userInfo.userPhone}',
			buyer_addr: '${userInfo.userAddr}',
			buyer_postcode: '${userInfo.userAddrnum}',
		}, function (rsp) { // callback
			if (rsp.success) { // 결제성공시 로직
				alert("결제 성공");
				addOrder();  // 결제정보등록
				addOrderItem(); // 장바구니 상품 => 주문 상품 등록
				window.location.href =  "orderSuress.do?totalPrice=" + totalPrice; 
			} else { // 결제 실패시
				alert(rsp.error_msg);
				console.log(rsp);
			}
		});
	} //requestPay

	function cardPay() {
		// IMP.request_pay(param, callback) 결제창 호출
		IMP.request_pay({ // param
			pg: 'html5_inicis',
			pay_method: 'card',
			merchant_uid: merchant_uid, // 상점에서 관리하는 주문 번호를 전달
			name: '도서',
			amount: '${totalPrice}',
			buyer_email: '${userInfo.userEmail}',
			buyer_name: '${userInfo.userName}',
			buyer_tel: '${userInfo.userPhone}',
			buyer_addr: '${userInfo.userAddr}',
			buyer_postcode: '${userInfo.userAddrnum}',
		}, function (rsp) { // callback
			if (rsp.success) { // 결제성공시 로직
				alert("결제 성공");
				addOrder();  // 결제정보등록
				addOrderItem(); // 장바구니 상품 => 주문 상품 등록
				window.location.href =  "orderSuress.do?totalPrice=" + totalPrice; 
			} else { // 결제 실패시
				alert(rsp.error_msg);
				console.log(rsp);
			}
		});
	} //requestPay

	function kakaoPay() {
		// IMP.request_pay(param, callback) 결제창 호출
		IMP.request_pay({ // param
			pg: 'kakaopay',
			pay_method: 'card',
			merchant_uid: merchant_uid, // 상점에서 관리하는 주문 번호를 전달
			name: '도서',
			amount: '${totalPrice}',
			buyer_email: '${userInfo.userEmail}',
			buyer_name: '${userInfo.userName}',
			buyer_tel: '${userInfo.userPhone}',
			buyer_addr: '${userInfo.userAddr}',
			buyer_postcode: '${userInfo.userAddrnum}',
		}, function (rsp) { // callback
			if (rsp.success) { // 결제성공시 로직
				alert("결제 성공");
				addOrder();  // 결제정보등록
				addOrderItem(); // 장바구니 상품 => 주문 상품 등록
				window.location.href =  "orderSuress.do?totalPrice=" + totalPrice; 
				deleteAllCart(); // 장바구니 초기화
			} else { // 결제 실패시
				alert(rsp.error_msg);
				console.log(rsp);
			}
		});
	}

	//장바구니 상품  주문상품에 담기
	function addOrderItem() { 

		let elements = document.querySelectorAll('.cno'); // 클래스명이 "cno"인 모든 요소를 선택
		for (let i = 0; i < elements.length; i++) {
		    let ocode = elements[i].children[1].innerText; // 각 요소의 두 번째 자식 요소 선택
		    let bno = elements[i].children[2].innerText;
		    let amount = elements[i].children[4].innerText;
		    
		let totalPrice = '${totalPrice}';

		fetch('addOrderItem.do', {
				method: 'post',

				headers: {
					'Content-type': 'application/x-www-form-urlencoded'
				},

				body: 'ocode=' + ocode + '&bno=' + bno + '&amount=' + amount + '&totalPrice=' + totalPrice

			})

			.then(resolve => resolve.json())

			.then(result => {
				if (result.retCode == 'OK') {
					console.log('아이템 등록 성공')
				} else {
					console.log('아이템 등록 실패')
				}
			}) //end of fetch
	}
}
	
	function orderListInfo(){ 

		let totalPrice = '${totalPrice}';
		
		fetch('orderSuress.do', {

			method: 'post',

			headers: {'Content-type': 'application/x-www-form-urlencoded'},
			
			body: 'totalPrice=' + totalPrice
		})

		.then(resolve => resolve.json())

		.then(result =>{

			if(result.retCode == 'OK'){
				console.log('이동');
			} else{
				
			}
		})//end of fetch
	}
	

	
	
	// 장바구니 초기화
	function deleteAllCart(){ 

		
		fetch('deleteAllCart.do', {

			method: 'post',

			headers: {'Content-type': 'application/x-www-form-urlencoded'},

		})

		.then(resolve => resolve.json())

		.then(result =>{

			if(result.retCode == 'OK'){
				window.location.href = window.location.href;
			} else{
				alert('삭제 실패')
			}
		})//end of fetch
}
</script>

</html>