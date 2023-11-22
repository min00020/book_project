<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="px-4 py-1 my-5 text-center">
	<h4 class="fw-bold text-body-emphasis mb-3">구매가 정상적으로 완료되었습니다!</h4>
	<div class="d-flex justify-content-center">
		<hr class="w-50">
	</div>
	<div class="col-lg-6 mx-auto">
		<div class="d-grid gap-6 d-sm-flex justify-content-between py-5">
			<div>
				<h5>상품명</h5>
				<table>

					<thead>

						<tr>
							<th colspan="7" style="text-align: center;" class="title">${userInfo.userName}
								님의 주문목록</th>

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
			</div>
			<div>
				<h5></h5>
			</div>
		</div>
		<div class="d-grid gap-6 d-sm-flex justify-content-between py-5">
			<div>
				<h5>주문번호</h5>
			</div>
			<div>
				<h5></h5>
			</div>
		</div>
		<div class="d-grid gap-6 d-sm-flex justify-content-between py-5">
			<div>
				<h5>결제금액</h5>

				<span>${totalPrice }</span>
			</div>
			<div>
				<fmt:formatDate value="" pattern="yyyy-MM-dd HH:mm:ss"
					var="formattedDate" />
				<h5></h5>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">
		<hr class="w-50">
	</div>

	<div class="col-lg-6 mx-auto">
		<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
			<button type="button"
				class="btn btn-outline-secondary  btn-lg px-4 gap-3"
				style="background-color: pink;">
				<a href="orderDetailForm.do" style="color: white;">주문내역 확인하기</a>
			</button>
			<button type="button" class="btn btn-outline-secondary btn-lg px-4">
				<a href="main.do" style="color: black;">메인으로 가기</a>
			</button>
		</div>
	</div>
</div>

<script>
  
	  	let totalPrice = 0; 
	
		let pricesum = document.querySelectorAll(".list-Pricesum"); 
	
		for(let i of pricesum){
	
		totalPrice += (i.innerHTML) * 1; 
	
		};
</script>