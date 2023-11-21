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
			<td><a href="finduserForm.do">아이디 찾기</a></td>
			<td><a href="findpassForm.do">비밀번호 찾기</a></td>
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