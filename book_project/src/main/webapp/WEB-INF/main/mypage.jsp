<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css" />
<link href="https://fonts.googleapis.com/css?family=Work+Sans:200,400&display=swap" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet" />
<link href="resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
<jsp:include page="../layouts/header.jsp"></jsp:include>
<style>
#contain {
	margin: auto;
}
#top {
		margin-top: 30px;
			margin-bottom: 30px;
	}
	h5 {
		font-size: small;
		width: 102px;
	}/* 
	body {
		margin: auto;
		display: flex; 
	    flex-direction: column; 
	    align-items: center;
    } */
    #row {
    display: flex;}
    input {
    	height: 30px;
		border: 0;
		border-radius: 6px;
		background-color: rgb(233, 233, 233);
		margin-bottom: 6px;
		justify-content: flex-start;
	}
    button {
		height: 35px;
		width: 90px;
	    background-color:#0a0a23;
	    color: #fff;
	    border:none;
	    border-radius:10px;
	    margin-top: 30px;
	    margin-bottom: 15px;
	}
	form {
		margin: 0 auto;
		margin-bottom: 60px;
		margin: auto;
		display: flex; 
	    flex-direction: column; 
	    align-items: center;
	}
button {
		height: 35px;
		width: 120px;
	    background-color:#0a0a23;
	    color: #fff;
	    border:none;
	    border-radius:10px;
	    margin-top: 10px;
	    margin-bottom: 15px;
	}
</style>
<div class="col-lg-6" id="contain">
	<!-- Overflow Hidden -->
	<div class="card mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">주문목록</h6>
		</div>
		<div class="card-body">
			<form action="orderuser.do" method="post">
				<table>
					
					<tbody>
					<c:choose>
						<c:when test="${empty list }">
							<p>주문내역이 없습니다.</p>
						</c:when>
						<c:otherwise>
							<thead>
								<tr>
									<th>주문번호</th>
									<th>주문자 아이디</th>
									<th>우편번호</th>
									<th>배송지</th>
									<th>배송지</th>
									<th>전화번호</th>
									<th>주문 금액</th>
									<th>주문 상태</th>
									<th>결제 방식</th>
									<th>주문 날짜</th>
								</tr>
							</thead>
						<c:forEach items="${list}" var="vo">
							<tr>
								<td>${vo.odrCode }</td>
								<td>${id }</td>
								<td>${vo.odrZipcode }</td>
								<td>${vo.odrAddr }</td>
								<td>${vo.odrAddrD }</td>
								<td>${vo.odrPhone }</td>
								<td>${vo.odrTotalPrice }</td>
								<td>${vo.odrStatus }</td>
								<td>${vo.paymentStatus }</td>
								<td><fmt:formatDate value="${vo.odrDate }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
							</tr>
						</c:forEach>
						</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</form>
		
		</div>
	</div>
	<!-- Overflow Hidden -->
	<div class="card mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">내가 쓴 글</h6>
		</div>
		<div class="card-body">
			<form action="orderuser.do" method="post">
				<table>
					<tbody>
					<c:choose>
						<c:when test="${empty qlist }">
							<p>내가 쓴 글이 없습니다.</p>
						</c:when>
						<c:otherwise>
							<thead>
								<tr>QnA 게시판</tr>
								<tr>
									<th>게시판 번호</th>
									<th>리뷰 제목</th>
									<th>리뷰 내용</th>
									<th>등록 날짜</th>
									<th>글쓴이</th>
								</tr>
							</thead>
						<c:forEach items="${qlist}" var="vo">
							<tr>
								<td>${vo.boardNo}</td>
								<td>${vo.boardTitle}</td>
								<td>${vo.boardContent}</td>
								<td><fmt:formatDate value="${vo.boardDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
								<td>${vo.userId}</td>
							</tr>
						</c:forEach>
						</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<table>
					<tbody>
					<c:choose>
						<c:when test="${empty rlist }">
							<p>내가 쓴 글이 없습니다.</p>
						</c:when>
						<c:otherwise>
							<thead>
								<tr>리뷰 게시판</tr>
								<tr>
									<th>게시판 번호</th>
									<th>리뷰 제목</th>
									<th>리뷰 내용</th>
									<th>등록 날짜</th>
									<th>글쓴이</th>
								</tr>
							</thead>
						<c:forEach items="${rlist}" var="vo">
							<tr>
								<td>${vo.boardNo}</td>
								<td>${vo.boardTitle}</td>
								<td>${vo.boardContent}</td>
								<td><fmt:formatDate value="${vo.boardDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
								<td>${vo.userId}</td>
							</tr>
						</c:forEach>
						</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<!-- Overflow Hidden -->
	<c:choose>
	<c:when test="${!empty id }">
	<div class="card mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">회원정보수정</h6>
		</div>
		<div class="card-body">
			<form action="modifyuser.do" method="post" onsubmit="return modifyCheck(this)">
		<h4 id="top" align="center">회원 정보 수정</h4>
		<div id="row">
			<h5>아이디</h5>
			<input type="text" readonly name="id" value="${vo.userId }" />
		</div>
		<div id="row">
			<h5>이름</h5>
			<input type="text" readonly id="name" name="name" value="${vo.userName }" />
		</div>
		<div id="row">
			<h5>이메일</h5>
			<input type="text" placeholder="이메일 입력" name="email"
				value="${vo.userEmail }" /> 
		</div>
		<div id="row">
			<h5>전화번호</h5>
			<input type="text" name="pnum" value="${vo.userPhone }">
		</div>
		<div id="row">
			<h5>우편 번호</h5>
			<input readonly type="text" id="postcode" name="postcode" value="${vo.userAddrnum }">
			<!-- <input type="text" id="sample6_detailAddress" name="addr" placeholder="상세주소"> 
			<input type="text" id="sample6_extraAddress" placeholder="참고항목"> -->
		</div>
		<div id="row">
			<h5>상세 주소</h5> 
			<input readonly type="text" id="sample6_address" name="addr" value="${vo.userAddr }">
		</div>
		<div id="row" id="info_bir">
			<h5>생년월일</h5>
			<input readonly value="${vo.userBir }">
		</div>
		<div id="row">
			<h5>성별</h5>
			<input type="text" readonly value="${vo.userGender }">
		</div>
	</form>
			<div class="card-body text-center">
				<button type="button" onclick="location.href='modifyuserForm.do?id=${id }'">회원 정보 수정</button> 
				<button type="button" onclick="location.href='deleteuserForm.do?id=${id }'">회원 탈퇴</button>
			</div>
		</div>
	</div>
	</c:when>
	</c:choose>
</div>

<jsp:include page="../layouts/footer.jsp"></jsp:include>