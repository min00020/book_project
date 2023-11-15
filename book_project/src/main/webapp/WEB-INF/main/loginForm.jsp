<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form action="login.do" method="post">
<hr>
	<table class="table">
		<tr>
			<th>아이디</th>
			<td><input type="text" class="form-control" name="id"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" class="form-control" name="pass"></td>
		</tr>
		<tr>
			<td colspan="1"><input type="submit" value="로그인"></td>
			<td colspan="1"><input type="submit" onclick="this.form.action='joinForm.do';" value="회원가입"></td>
		</tr>
	</table>
</form>