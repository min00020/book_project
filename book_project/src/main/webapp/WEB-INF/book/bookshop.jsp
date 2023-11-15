<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.product{
  padding:10px;
}
.line ul li {
	list-style-type: none;
}
.line {
	padding:40px;
	
}
.fw-bolder{

}
.card-img-top {
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




<form action="searchResult.jsp" method="get">
    <input type="text" name="query" placeholder="검색어 입력">
    <input type="submit" value="검색">
</form>



		<a class="list-group-item list-group-item-action list-group-item-light p-3" href="main.do">메인 페이지</a>

<div style="float: left">
	
	<div class="row">
	<div class="col-9">
	
<div class="container px-4 px-lg-5 mt-5">
	<div
		class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
		<!-- 상품목록 -->
		
		<c:forEach items="${list}" var="vo" end="5">


			<div class="col mb-5">
				<div class="card h-100">

					<!-- Sale badge-->
					<!-- Product image-->
					<img class="card-img-top" style="float: right" src="resources/image/${vo.bookImage }"
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
</div>
	<div class="col-3" style="de right">
	
	<div class="line" style="list-style-type: none;">
	
		<div type="button" class="product" href="">별책부록</div>
		<div type="button" class="product">매거진</div>
		<div type="button" class="product">시, 소설, 에세이</div>
		<div type="button" class="product">일러스트, 회화, 만화</div>
		<div type="button" class="product">영화</div>
		<div type="button" class="product">디자인, 창작, 실용</div>
		<div type="button" class="product">사진</div>
		<div type="button" class="product">음악, 공연, 예술</div>
		<div type="button" class="product">건축, 공간, 로컬</div>
		<div type="button" class="product">철학, 인문, 교양</div>
		<div type="button" class="product">여행</div>
		<div type="button" class="product">생활, 요리, 취미</div>
		<div type="button" class="product">해외도서</div>
		<div type="button" class="product">스티커</div>
	</div>
	
	</div>
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


</script>
