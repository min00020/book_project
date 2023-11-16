<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<header class="bg-dark py-5" style="background-image:url('https://search.pstatic.net/sunny/?src=https%3A%2F%2Fimages.unsplash.com%2Fphoto-1573592371950-348a8f1d9f38%3Fixlib%3Drb-4.0.3%26ixid%3DMnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDZ8fHxlbnwwfHx8fA%253D%253D%26w%3D1000%26q%3D80&type=sc960_832')">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">BOOKSHOP</h1>
                    <p class="lead fw-normal text-white-80 mb-0">A book changes my life</p>
                </div>
            </div>
        </header>

		<div class="text-center"><span style="font-size:2.5em;">11월을 위한 추천 도서</span></div>

 <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <!-- 상품목록 -->
                    <c:forEach items="${list}" var="vo">
                    
                   
                    <div class="col mb-5">
                        <div class="card h-100">
                        
                            <!-- Sale badge-->
                            <!-- Product image-->
                            <img class="card-img-top" src="resources/image/${vo.bookImage }" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${vo.bookTitle }</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                    </div>
                                    <!-- Product price-->
                                    <span class="">${vo.bookPrice }</span>
                                </div>
                            </div>

                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="bookInfo.do?bno=${vo.bookNo }">Cart</a></div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <!-- 상품목록 -->
                </div>
            </div>
		