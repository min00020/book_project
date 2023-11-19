<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet"
	href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css" />

<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:200,400&display=swap"
	rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet" />
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
			<td colspan="1"><input type="submit" id="login" value="로그인"></td>
			<td colspan="1"><input type="button" onclick="location.href='joinForm.do'" value="회원가입"></td>
			<a href="javascript:kakaoLogin()"><img src="resource/image/kakao_login.png" style="width: 200px"></a>
		</tr>
	</table>
</form>

<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
    Kakao.init('baebadb607ea7b6110c9beeffb0e3719');
    function kakaoLogin() {
        Kakao.Auth.login({
            success: function (response) {
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function (response) {
                    	const kakaoId = response.id;
                    	const kakaopw = "kakao" + response.id;
                    	scope: 'account_email'
                    		fetch('idCheck.do?id='+id)
                			.then(resolve = > resolve.json())
                			.then(result => {
                				if (result.retCode == 'OK') {
                					location.href = "login.do?kakaoid="+kakaoId+"$kakaopw"+kakaopw;
                				} else {
                					alert("로그인 실패");
                					location.href = "login.do";
                				}
                			})
                    }
                })
                const token = authObj.access_token;
            },
            fail: function (error) {
                alert(JSON.stringify(error))
            },
        })
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