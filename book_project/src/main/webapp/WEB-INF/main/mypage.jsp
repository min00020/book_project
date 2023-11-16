<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css" />

<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:200,400&display=swap"
	rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet" />
<jsp:include page="../layouts/header.jsp"></jsp:include>
<div class="row">
	<div class="col-lg-6">
		<!-- Overflow Hidden -->
		<div class="card mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">주문목록</h6>
			</div>
			<div class="card-body">
				Use
				<code>.o-hidden</code>
				to set the overflow property of any element to hidden.
			</div>
		</div>

		<!-- Progress Small -->
		<div class="card mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">내가 쓴 글</h6>
			</div>
			<div class="card-body">
				<div class="mb-1 small">Normal Progress Bar</div>
				<div class="progress mb-4">
					<div class="progress-bar" role="progressbar" style="width: 75%"
						aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
				</div>
				<div class="mb-1 small">Small Progress Bar</div>
				<div class="progress progress-sm mb-2">
					<div class="progress-bar" role="progressbar" style="width: 75%"
						aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
				</div>
				Use the
				<code>.progress-sm</code>
				class along with
				<code>.progress</code>
			</div>
		</div>
	</div>

	<div class="col-lg-6">

		<!-- Roitation Utilities -->
		<div class="card">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">회원 정보 수정</h6>
			</div>
			<div class="card-body text-center">
				<form action="modifyUser.do" method="get"
					onsubmit="return joinCheck(this)">
					<hr>
					<div id="id">
						<h5>아이디</h5>
						<input type="text" name="id" value="${vo.userId }" />
						<button id="idcheck">중복 확인</button>
					</div>
					<div>
						<h5>비밀번호</h5>
						<input type="password" id="pw1" name="pw1" value="${vo.userPass }" />
					</div>
					<div>
						<h5>비밀번호 확인</h5>
						<input type="password" id="pw2" onchange="pwcheck()" /><span
							id="check"></span>
					</div>
					<div id="name">
						<h5>이름</h5>
						<input type="text" id="name" name="name" value="${vo.userName }" />
					</div>
					<div id="joinemail">
						<h5>이메일</h5>
						<input type="text" placeholder="이메일 입력" name="email"
							value="${vo.userEamil }" /> <input class="box" disabled
							id="domain_text" /> <select id="domain_list" name="emaildomain">
							<option disabled value="type" selected>선택하세요.</option>
							<option value="@naver.com">naver.com</option>
							<option value="@daum.net">daum.net</option>
							<option value="@hanmail.net">hanmail.net</option>
							<option value="@google.com">google.com</option>
							<option value="@nate.com">nate.com</option>
							<option value="@type">직접 입력</option>
						</select>
					</div>
					<div>
						<h5>전화번호</h5>
						<input type="text" name="pnum">
					</div>
					<div>
						<h5>주소지 입력</h5>
						<input type="text" id="postcode" name="postcode"
							value="${vo.userAddrnum }"> <input type="button"
							id="addrnum" value="우편번호 찾기"><br> <input type="text"
							id="sample6_address" name="addr" value="${vo.userAddr }"><br>
						<div class="info" id="info_bir">
							<h5>생년월일</h5>
							<select class="box" id="bir_year" name="bir1"
								value="${vo.userBir }">
								<option disabled selected>출생 연도</option>
							</select> <select class="box" id="bir_month" name="bir2">
								<option disabled selected>월</option>
							</select> <select class="box" id="bir_day" name="bir3">
								<option disabled selected>일</option>
							</select>
						</div>
						<div id="gender">
							<h5>성별</h5>
							<label><input name="gender" type="radio" checked
								value="남">남</label> <input id="female" name="gender"
								type="radio" value="여"><label for="female">여</label>
						</div>
						<hr>
						<div id="modify">
							<button type="submit">수정</button>
							<button type="reset">초기화</button>
						</div>
				</form>
			</div>
		</div>

	</div>

</div>
<jsp:include page="../layouts/footer.jsp"></jsp:include>