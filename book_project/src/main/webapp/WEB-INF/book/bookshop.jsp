<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.line ul li {
	list-style-type: none;
}
.fw-bolder{
	text-center;
	
}
.card-img-top {
	width: 200px;
	float: rigtht;
}

.content {
	float: right;
}
.search-container .suggestions-container {
  position: absolute;
  top: 40px;
  left: -65;
  padding-top: 10;
  background-color: var(--color-white);
  box-shadow: 0 0 5px 1px rgba(0, 0, 0, 0.1);
  border-radius: 3;
  z-index: 1;
}
</style>


<input type="text" id="search-input">
<button id="search-btn">검색</button>
<ul id="search-results"></ul>



<a
	class="list-group-item list-group-item-action list-group-item-light p-3"
	href="main.do">메인 페이지</a>


<div class="line">
	<hr>
	<ul>

		<li><a
			class="list-group-item list-group-item-action list-group-item-light p-3"
			href="bookshop.do">전체</a></li>
		<li><a
			class="list-group-item list-group-item-action list-group-item-light p-3"
			href="bookshop.do">시/소설</a></li>
		<li><a
			class="list-group-item list-group-item-action list-group-item-light p-3"
			href="bookshop.do">철학</a></li>
		<li><a
			class="list-group-item list-group-item-action list-group-item-light p-3"
			href="bookshop.do">사진</a></li>

	</ul>

</div>

<div class="container px-4 px-lg-5 mt-5">
	<div
		class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
		<!-- 상품목록 -->
		<c:forEach items="${list}" var="vo">


			<div class="col mb-5">
				<div class="card h-100">

					<!-- Sale badge-->
					<!-- Product image-->
					<img class="card-img-top" src="resources/image/${vo.bookImage }"
						alt="..." />
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder">${vo.bookTitle }</h5>
							<!-- Product reviews-->
							<div
								class="d-flex justify-content-center small text-warning mb-2">
							</div>
							<!-- Product price-->
							<span class=""></span>
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto"
								href="bookInfo.do?bno=${vo.bookNo }">Add to cart</a>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<!-- 상품목록 -->
	</div>
</div>

<script>
const searchBtn = document.getElementById('search-btn');
const searchInput = document.getElementById('search-input');

searchBtn.addEventListener('click', function() {
  const searchValue = searchInput.value;
  
  if (searchValue !== '') {
    // Local Storage에 검색어 저장
    localStorage.setItem('searchHistory', searchValue);
  }
});


window.addEventListener('DOMContentLoaded', function() {
	  const searchHistory = localStorage.getItem('searchHistory');
	  
	  if (searchHistory !== null) {
	    const searchResults = document.getElementById('search-results');
	    // 이력을 보여줄 요소 생성
	    const listItem = document.createElement('li');
	    listItem.textContent = searchHistory;
	    searchResults.appendChild(listItem);
	  }
});
</script>
