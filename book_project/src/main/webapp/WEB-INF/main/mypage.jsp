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
			<form action="modifyuser.do" method="post" onsubmit="return joinCheck(this)">
				<div id="id">
					<h5>
						아이디 <input readonly type="text" name="id" value="${vo.userId }" />
					</h5>
				</div>
				<div>
					<h5>
						비밀번호 <input readonly type="password" id="pw1" name="pw1"
							value="${vo.userPass }" />
					</h5>

				</div>
				<div id="name">
					<h5>
						이름 <input readonly type="text" id="name" name="name"
							value="${vo.userName }" />
					</h5>

				</div>
				<div id="joinemail">
					<h5>
						이메일 <input readonly type="text" placeholder="이메일 입력" name="email"
							value="${vo.userEmail }" />
					</h5>

				</div>
				<div>
					<h5>
						전화번호 <input readonly type="text" name="pnum"
							value="${vo.userPhone }">
					</h5>

				</div>
				<div>
					<h5>주소</h5>
					<input type="text" readonly id="postcode" name="postcode"
						value="${vo.userAddrnum }"> <br> <input readonly
						type="text" id="sample6_address" name="addr"
						value="${vo.userAddr }"><br>
					<div class="info" id="info_bir">
						<h5>
							생년월일 <input value="${vo.userBir }">
						</h5>
					</div>
					<div id="gender">
						<h5>
							성별 <input value="${vo.userGender }">
						</h5>
					</div>
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