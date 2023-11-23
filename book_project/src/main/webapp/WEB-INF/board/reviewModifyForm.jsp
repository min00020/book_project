<%@page import="co.yedam.board.service.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <jsp:include page="../layout/menu.jsp"></jsp:include> --%>
<div class="container px-4 px-lg-5 mt-5">
	<h3>게시글 수정화면</h3>
	<form action="reviewModifyBoard.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="bno" value="${vo.boardNo }">
		<table class="table">
			<tr>
				<th>제목</th>
				<td><input type="text" name="boardTitle" class="form-control" value="${vo.boardTitle }"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="userId" class="form-control" value="${vo.userId }" readonly></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="2"><textarea class="form-control" name="boardContent">${vo.boardContent }</textarea>
				</td>
			</tr>
			<tr>
				<th>수정할이미지</th>
				<td><input type="file" name="image" src="image/${vo.boardImage }" class="form-control"></td>
			</tr>
			<tr>
			<td colspan="2" align="center">
				<input type="submit" class="btn btn-secondary" value="수정">
				<input type="reset" class="btn btn-secondary" value="초기화">
			</td>
			</tr>
		</table>
	</form>
</div>