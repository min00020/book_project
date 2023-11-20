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
	#login 
</style>
<form action="login.do" method="post" onsubmit="return loginCheck(this)" >
<hr>
	<table class="table" align="center">
		<h4 align="center">로그인</h4>
		<tr>
			<th>아이디</th>
			<td><input type="text" class="form-control" id="id" name="id"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" class="form-control" id="pass" name="pass"></td>
		</tr>
		<tr>
			<td><input type="submit" id="login" value="로그인"></td>
			<td><input type="button" onclick="location.href='joinForm.do'" value="회원가입"></td>
		</tr>
		<tr>
			<a href="finduserForm.do">아이디 찾기</a>
			<a href="findpassForm.do">비밀번호 찾기</a>
		</tr>
		<tr>
			<td colspan="2">
				<a id="kakao-login-btn" href="javascript:loginWithKakao()">
					<img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222" alt="카카오 로그인 버튼" />
				</a>
				<p id="token-result"></p>
			</td>
		</tr>
	</table>
</form>

<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.5.0/kakao.min.js" integrity="sha384-kYPsUbBPlktXsY6/oNHSUDZoTX6+YI51f63jCPEIPFP09ttByAdxd2mEjKuhdqn4" crossorigin="anonymous"></script>
<script>
  Kakao.init('baebadb607ea7b6110c9beeffb0e3719'); // 사용하려는 앱의 JavaScript 키 입력
  console.log("init: ", Kakao.isInitialized());
  </script>
  
<script>
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'http://localhost:8080/book_project/bookmainpage.do',
      state: 'userme',
      scope: 'account_email',
    });
  }

  function requestUserInfo() {
    Kakao.API.request({
      url: '/v2/user/me',
    })
      .then(function(res) {
        alert(JSON.stringify(res));
      })
      .catch(function(err) {
        alert(
          'failed to request user information: ' + JSON.stringify(err)
        );
      });
  }

  // 아래는 데모를 위한 UI 코드입니다.
  displayToken()
  function displayToken() {
    var token = getCookie('authorize-access-token');

    if(token) {
      Kakao.Auth.setAccessToken(token);
      document.querySelector('#token-result').innerText = 'login success, ready to request API';
      document.querySelector('button.api-btn').style.visibility = 'visible';
    }
  }

  function getCookie(name) {
    var parts = document.cookie.split(name + '=');
    if (parts.length === 2) { return parts[1].split(';')[0]; }
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