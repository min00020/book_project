<%@page import="co.yedam.board.service.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%-- <jsp:include page="../layout/menu.jsp"></jsp:include> --%>
<jsp:include page="../layouts/header.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>removeoform.jsp</title>
</head>
<body>

	<h3>게시글 삭제화면</h3>
	<form action="removeBoard.do" method="post">
	<input type="hidden" name="bno" value="${vo.boardNo }">
		<table class="table">
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${vo.boardTitle }"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" value="${vo.userId }"></td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="content"${vo.boardContent }></textarea>
				</td>
			</tr>
			<tr>
				<th>파일명</th>
				<td><img src="image/${vo.boardimage }" width="80px" ></td>
			</tr>
			<tr>
			<td colspan="2" align="center">
				<input type="submit" value="삭제">
				<input type="reset" value="초기화">
			</td>
			</tr>
		</table>
	</form>
</body>
</html>

<jsp:include page="../layouts/footer.jsp"></jsp:include>