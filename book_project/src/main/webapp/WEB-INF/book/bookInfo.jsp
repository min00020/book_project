<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>







<section class="py-5">
	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="col-md-6">
				<img class="card-img-top mb-5 mb-md-0"
					src="resources/image/${bno.bookImage }" alt="..." />
			
			</div>
			<div class="col-md-6">
				<h1 class="display-5 fw-bolder">${bno.bookTitle }</h1>
				<div class="fs-5 mb-5">
				<div class="small mb-1">저자: ${bno.bookWriter }</div>
					<span class="">가격: ${bno.bookPrice }원</span>
				</div>
				<p class="lead">책 소개: ${bno.bookContent }</p>
				<div class="d-flex">
					<input class="form-control text-center me-3" id="inputQuantity"
						type="num" value="1" style="max-width: 3rem" />
					<button class="btn btn-outline-dark flex-shrink-0" type="button">
						<i class="bi-cart-fill me-1"></i> cart
					</button>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Related items section-->
<section class="py-5 bg-light">
	<div class="container px-4 px-lg-5 mt-5">
		<h2 class="fw-bolder mb-4">Another book</h2>
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

			

			<c:forEach items="${list }" var="vo" end="3">

				<!-- 상품목록 -->
				<div class="col mb-5">
					<div class="card h-100">

						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem"></div>

						<!-- Product image-->
						<img class="card-img-top"
							src="resources/image/${vo.bookImage }" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->

								<!-- Product reviews-->

								<!-- Product price-->
								<span class="">${vo.bookPrice }</span>

								
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Cart</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>
