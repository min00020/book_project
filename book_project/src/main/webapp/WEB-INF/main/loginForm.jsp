<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet"
	href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css" />

<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:200,400&display=swap"
	rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet" />
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<jsp:include page="../layouts/header.jsp"></jsp:include>
<style>
	input {
		height: 30px;
		border: 0;
		border-radius: 6px;
		background-color: rgb(233, 233, 233);
		display:flex; 
		justify-content: flex-start; 
		align-items: center;
		margin-bottom: 10px;
	}
	button {
		height: 35px;
		width: 90px;
	    background-color:#0a0a23;
	    color: #fff;
	    border:none;
	    border-radius:10px;
	    margin-top: 10px;
	    margin-bottom: 15px;
	}
	#top {
		margin-top: 30px;
		margin-bottom: 30px;
	}
	form {
		margin-bottom: 60px;
	}
</style>
<script>
window.onload = function() {
    const urlParams = new URLSearchParams(window.location.search);
    const loginSuccessParam = urlParams.get('loginSuccess');
    const joinSuccessParam = urlParams.get('joinSuccess');

    if (loginSuccessParam === 'false') {
        alert("로그인에 실패하였습니다.");
    }
    if (joinSuccessParam === 'true') {
        alert("회원가입에 성공하였습니다.");
    }
};
</script>
<form action="login.do" method="post" onsubmit="return loginCheck(this)" >
<hr>
	<table class="table" align="center">
		<h3 align="center" id="top">로그인</h3>
		<tr>
			<th style="font-size: large;">아이디</th>
			<td><input type="text" class="form-control" id="id" name="id"></td>
		</tr>
		<tr>
			<th style="font-size: large;">비밀번호</th>
			<td><input type="password" class="form-control" id="pass" name="pass"></td>
		</tr>
		<tr>
			<td align="center" colspan="2">
			<button type="submit" id="login" >로그인</button>
			<button type="button" onclick="location.href='joinForm.do'">회원가입</button>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<a style="font-size: small" href="finduserForm.do">아이디 찾기</a>
				<a style="font-size: small" href="findpassForm.do">비밀번호 찾기</a>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a id="kakao-login-btn" href="javascript:loginWithKakao()">
					<img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222" alt="카카오 로그인 버튼" />
				</a>
				<p id="token-result"></p>
			</td>
		</tr>
	</table>
</form>

<script>
Kakao.init('baebadb607ea7b6110c9beeffb0e3719'); // 사용하려는 앱의 JavaScript 키 입력
console.log("init: ", Kakao.isInitialized());
</script>
<script type='text/javascript'>
	function loginWithKakao() {
		Kakao.Auth.login({
			success: function (authObj) {
				console.log(authObj);
				Kakao.API.request({
					 url: '/v2/user/me',
			            success: function(resp) {
			              const kakaoId = resp.id;
			              const kakaoPw = "kakao" + resp.id;
			                console.log("kakao id, pw: ", kakaoId, kakaoPw);
			              fetch('kakaoIdCheck.do?kakaoId='+kakaoId)
							.then(resolve=>resolve.json())
							.then(result=>{
								console.log("idcheck 결과: ", result)
								if(result.retCode=='NG'){
										console.log("kakaoidng: ", ${kakaoId});
										location.href="kakaologin.do?kakaoId="+kakaoId+"&kakaoPw="+kakaoPw;
								}else{
									alert("카카오 회원가입 성공");
									location.href="kakaojoin.do?kakaoId="+kakaoId+"&kakaoPw="+kakaoPw;
								}
									
						})
		        }
		          })
		          var token = authObj.access_token;
		        },
		        fail: function(err) {
		          alert(JSON.stringify(err));
		        }
		            
			});
		}
</script>

<script>
/* 로그인 유효성 */
	function loginCheck(obj) {
	if (!obj.id.value || obj.id.value.trim().length == 0){
		alert("아이디가 입력되지 않았습니다.");
		return false;
	}
	if (!obj.pass.value || obj.pass.value.trim().length == 0){
		alert(" 비밀번호가 입력되지 않았습니다.");
		return false;
	}
}
</script>
<jsp:include page="../layouts/footer.jsp"></jsp:include>