<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form action="login.do" method="post" onsubmit="return loginCheck(this)">
<hr>
	<table class="table">
		<tr>
			<th>아이디</th>
			<td><input type="text" class="form-control" id="id" name="id"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" class="form-control" id="pass" name="pass"></td>
		</tr>
		<tr>
			<td colspan="1"><input type="submit" value="로그인"></td>
			<td colspan="1"><input type="submit" onclick="this.form.action='joinForm.do';" value="회원가입"></td>
		</tr>
	</table>
</form>
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
