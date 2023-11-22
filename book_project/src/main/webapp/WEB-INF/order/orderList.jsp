<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별책부록 주문페이지</title>
<style>
* {
	margin: 0 auto;
	text-align: center;
}

table {
	width: 70%;
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
</style>
</head>
<body>
	<div>
		<a> <img src="resources/image/logo.jpg">

		</a>
		<hr>
		<section>

			<div>
				<div>
					<div class="row">
						<div class="col-lg-8">
							<h3>배송지 정보</h3>
							<form action="/bookShippingConfirm.ok" method="post"
								name="shippingForm" novalidate="novalidate">
								<div class="col-md-12 form-group p_star">
									<input type="text" class="form-control" id="m_name"
										name="m_name" placeholder="성명" value="${userInfo.userName }">
								</div>
								<div class="col-md-4 form-group p_star">
									<input type="text" id="m_phone" name="m_phone"
										readonly="readonly" value="${userInfo.userPhone }">
								</div>
								<div class="col-md-6 form-group p_star">
									<input type="text" id="m_email" name="m_email"
										placeholder="이메일" value="${userInfo.userEmail }">
								</div>
								<div class="col-md-12 form-group p_star">
									<input type="text" id="m_postcode" name="m_postcode"
										placeholder="우편 번호" value="${userInfo.userAddrnum }">
								</div>
								<div class="col-md-12 form-group p_star">
									<input type="text" id="m_addr1" name="m_addr1" placeholder="주소"
										value="${userInfo.userAddr }">
								</div>
							</form>
						</div>
						<div class="col-lg-4">
							<div>
								<table>


									<thead>

										<tr>
											<th colspan="7" style="text-align: center;" class="title">${userInfo.userName} 님의 주문목록</th>

										</tr>

									</thead>

									<tbody>
										<c:forEach items="${cartList }" var="list" varStatus="status">

											<tr id="cno">


												<td><a href="bookInfo.do?bno=${list.bookNo }"> <img
														src="resources/image/${list.bookImage}" id="bookimage">

												</a></td>
												<td>${list.bookTitle }</td>

												<td>${list.cartAmount}개</td>


											</tr>

										</c:forEach>
									</tbody>

								</table>
								<ul class="list list_2">
									<li><a href="#">Subtotal <span>$ ${totalMoney}</span></a></li>
									<li><a href="#">갯수 <span>${amount }</span></a></li>
									<li><a href="#">결제금액 <span> ${totalPrice}</span></a></li>
								</ul>

								<input type="submit" class="primary-btn" value="결제하기"
									onclick="javascript:sendShippingForm()" /> <input
									type="button" class="primary-btn" value="이전으로"
									onclick="javascript:history.back(-1);">
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>