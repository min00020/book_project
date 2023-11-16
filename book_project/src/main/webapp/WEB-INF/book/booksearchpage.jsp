<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.product{
  padding:10px;
  float:right;
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
</style>


<input type="text"  name="keyword" id="searchBar">

<a class="btn btn-outline-dark mt-auto" id="searchBtn" >검색</a>

<input type="submit" value=""/>




<!-- href="booksearch.do?sno=" -->


<div style="float: left">
	
	<div class="row">
	<div class="col-9">
	
<div class="container px-4 px-lg-5 mt-5">
	<div
		class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
		<!-- 상품목록 -->
		
		<c:forEach items="${list}" var="vo">


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
							<span class="">${vo.bookPrice }원</span>
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center"><a class="btn btn-outline-dark mt-auto" href="bookInfo.do?bno=${vo.bookNo }">Cart</a></div>	
						<div class="text-center">
							
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<!-- 상품목록 -->
	</div>
</div>
</div>
	<div class="col-3" style="right">
	
	<div class="line" style="list-style-type: none;">
	
		<a class="product" type="button" src="bookmianpage.tiles">전체</a><br>
		<a class="product" href="#">시, 소설, 에세이</a><br>
		<a class="product" href="#">일러스트, 회화, 만화</a><br>
		<a class="product" href="#">영화</a><br>
		<a class="product" href="#">디자인, 창작, 실용</a><br>
		<a class="product" href="#">사진</a><br>
		<a class="product" href="#">여행</a><br>
		<a class="product" href="#">생활, 요리, 취미</a><br>
		<a class="product" href="#">해외도서</a><br>
		<a class="product" href="#">스티커</a><br>
	</div>
	
	</div>
	</div>
	



<script>
//도서 분리 기능 넣어야함


// 검색 기능
let queryContent="";
let queryURL ="booksearch.do?sno=";

const searchInput = document.getElementById('searchBar');
searchInput.addEventListener("keyup", (e) => {
	if(e.keyCode == 13){
		const queryString = String(e.target.value);
		console.log(queryString)
		if(queryString.length <= 0)
			return;
	
		queryContent = queryString;
		document.getElementById('searchBtn').click();
	
	}});
const searchBtn = document.getElementById('searchBtn');
searchBtn.addEventListener("click", (e) => {
   queryContent = document.getElementById('searchBar').value;
   if(queryContent.length <= 0)
      return;
   
   queryURL += queryContent;
   window.location.href = queryURL;
   
   queryContent = ""; // 리셋
   queryURL = "booksearch.do?sno=";
});



</script>
		