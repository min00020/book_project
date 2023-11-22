<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
#list span {
	margin: 20px;
}

.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}
#line{
	padding:10px;
	border:1px solid black;
}

</style>

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
					<span>가격: ${bno.bookPrice }원</span>
					<p></p>
					<a style="font-size: 15px;">지은이: ${bno.bookWriter }</a><br> <a
						style="font-size: 15px;">출판사: ${bno.bookPublisher }</a><br> <a
						style="font-size: 15px;">분야: ${bno.bookSort }</a>
				</div>
				<h3>책소개</h3>
				<p class="lead">${bno.bookContent }</p>

				<div class="d-flex">
					<select name="amount" class="form-control text-center me-3"
						id="inputQuantity" type="text" style="max-width: 3rem">
						<c:forEach begin="1" end="10" var="i">
							<option value="${i}">${i}</option>
						</c:forEach>
					</select>&nbsp;개
					<button class="btn btn-outline-dark flex-shrink-0" type="submit">
						<i class="bi-cart-fill me-1"></i><a> 구매</a>
					</button>
					<button class="btn btn-outline-dark flex-shrink-0" type="submit">
						<i class="bi-cart-fill me-1"></i><a id="addCart"
							onclick="addCart()"> 장바구니 담기</a>
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
						<img class="card-img-top" style="float: right; height:250px;" src="resources/image/${vo.bookImage }"
							alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product price-->
								<span class="">${vo.bookPrice }원</span>
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto"
									href="bookInfo.do?bno=${vo.bookNo }">Cart</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<div class="container px-4 px-lg-5 mt-5">
		<div class="wrap_review">
			<h2>리뷰 작성</h2>
			<form name="reviewform" class="reviewform">
				<label>작성자 <input name="userId" value="${userId }" readonly></label>
				<div class="review">
					<label>서비스 <select name="starservice" id="starservice">
							<option value="5">5</option>
							<option value="4">4</option>
							<option value="3">3</option>
							<option value="2">2</option>
							<option value="1">1</option>
					</select>
					</label>
				</div>
				<div class="review_contents">
					<textarea rows="10" name="writecontent" class="review_textarea"></textarea>
				</div>
				<div class="cmd">
					<input type="button" id="addreview" onclick="addReview()"
						value="리뷰작성">
				</div>
			</form>
		</div>
	</div>

	<div class="container px-4 px-lg-5 mt-5">
	 <h3>리뷰등록</h3>
	<form name="reviewform" class="reviewform">
	<table border="1" class="talbe">
		
		<tr>
			<th>제목</th>
			<td><input type="text" name="boardTitle" class="form-control"></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="userId" class="form-control" value="${id}" readonly></td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td colspan="2"><textarea cols="35" class="form-control" rows="5" name="boardContent"></textarea></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" class="btn btn-success"
				value="저장"> <input type="reset" class="btn btn-success"
				value="초기화"></td>
		</tr>

	</table>
</form>
</div>

</section>

<script>
let bno = "${bno.bookNo}";
let uid = "${id}";
let amount = document.querySelector('#inputQuantity').value;

// 장바구니 담기
function addCart() {

	amount = document.querySelector('#inputQuantity').value;
	
	
	document.querySelector('#addCart').addEventListener('click', function(e){
	fetch('addCart.do', {
		method: 'post',
		headers: {'Content-type': 'application/x-www-form-urlencoded'},
		body: 'bno=' + bno + '&uid=' + uid + '&amount=' + amount
	})
	.then(resolve => resolve.json())
	.then(result =>{
		if(result.retCode == 'OK'){
			alert('장바구니 추가되었습니다.');		
		} else {
		}
		
	})
	});
}
</script>



<script>
document.querySelector("input[type=button]").addEventListener('click',
		function(e) {
			document.forms.myfrm.action = 'reviewRemoveForm.do';
			document.forms.myfrm.submit();
		});

//댓글 목록.
let bno = "${bno.bookNo}";
let writer = "${id}";
bno = document.querySelector('.bookNo').innerHTML;
let page = 1;

function showList(pg = 1){
document.querySelectorAll('#list li:not(:nth-of-type(1))')
	.forEach(li => li.remove()); //첫번째 li 요소는 template 용도라서 남겨야함 지우지 않음.
	
fetch('replyList.do?bno=' + bno + '&page=' + pg)
.then(resolve => resolve.json())
.then(result => {
	console.log(result);
	if (pg < 0){
		page = (Math.ceil(result.dto.total/5));
		if(page <= 0)
			page = 1;
		showList(page);
		return;
	}
	result.list.forEach(reply => {
		let li = makeRow(reply);
		// ul>li 생성.
		document.querySelector('#list').append(li);
		
	})
	//page생성 . 데이터 처리하는곳
	makePaging(result.dto);
})
.catch(err => console.log(err));
}// showList end
showList();

// 페이지링크 생성.
function makePaging(dto={}){
	document.querySelector('.pagination').innerHTML = '';
	
	if(dto.prev){
		let aTag = document.createElement('a');
		aTag.setAttribute('href', dto.startPage - 1);
		aTag.innerHTML = "&laquo;";
		document.querySelector('.pagination').append(aTag);
	}
	for(let i = dto.startPage; i <= dto.endPage; i++){
		let aTag = document.createElement('a');
		aTag.setAttribute('href', i);
		aTag.innerHTML = i;
		// active 녹색.
		if (i == page){
			aTag.className = 'active'; //  class속성을 저장할 때 ... className.
		}
		document.querySelector('.pagination').append(aTag);
	}
	if(dto.next){
		let aTag = document.createElement('a');
		aTag.setAttribute('href', dto.endPage + 1);
		aTag.innerHTML = "&raquo;";
		document.querySelector('.pagination').append(aTag);
	}
	
	// a에 클릭이벤트 등록.
	document.querySelectorAll('.pagination a').forEach(elem => {
		elem.addEventListener('click', function(e){
			e.preventDefault(); // form, a => 링크기능 차단.
			page = elem.getAttribute('href');
			showList(page);
		})
	})
	
}

<<<<<<< HEAD
=======



// 등록버튼.
document.querySelector('#addReply').addEventListener('click', function(e){
	let reply = document.querySelector('#content').value;
	if(!bno || writer == 'null' || !reply){
		alert('값을 확인해주세요.');
		return;
	}
	
	// ajax. bno/writer/reply => 전달.
	fetch('addReply.do', {
		method: 'post',
		headers: {'Content-type': 'application/x-www-form-urlencoded'},
		body: 'bno=' + bno + '&reply=' + reply + '&replyer=' + writer
	})
	.then(resolve => resolve.json())
	.then(result =>{
		if(result.retCode == 'OK'){
			//document.querySelector('#list').append(makeRow(result.vo));
			showList(-1);
		} else{
			alert('등록 실패')
		}
		
	})
})


function makeRow(reply){
	
	
	let temp = document.querySelector('#template').cloneNode(true);
	temp.style.display = 'block';
	
	console.log(temp);
	temp.querySelector('span:nth-of-type(1)').innerHTML = reply.replyNo;
	temp.querySelector('b').innerHTML = reply.reply;
	temp.querySelector('span:nth-of-type(2)').innerHTML = reply.replyer;
	temp.querySelector('span:nth-of-type(3)').innerHTML = reply.replyDate;
//	temp.querySelector('button').addEventListener('click', deleteCallback);
	
	//내가 만든 삭제
	temp.querySelector('#delReply').addEventListener('click', function(e){
		//삭제 권한
		if(writer != reply.replyer){
			alert('권한이 없습니다.')
			return;
		}
		//삭제 버튼
		fetch('delReply.do?rno=' + 
				reply.replyNo
		)
		.then(resolve => resolve.json())
		.then(result => {
			if(result.retCode == 'OK'){
				alert('삭제성공');
				temp.remove();
				showList(-1);
			} else {
				alert('삭제실패');
			}
		
		})
	
	})
	return temp;
}
>>>>>>> branch 'hyeon' of https://github.com/min00020/book_project.git
</script>


