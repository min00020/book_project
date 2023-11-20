<%@page import="co.yedam.board.service.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <jsp:include page="../layout/menu.jsp"></jsp:include> --%>

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
				<td><input type="text" name="userId" class="form-control" value="${vo.userId }"></td>
			</tr>
			<tr>
				<td colspan="2"><textarea class="form-control" name="boardContent"${vo.boardContent }></textarea>
				</td>
			</tr>
			<tr>
				<th>파일명</th>
				<td><img src="image/${vo.boardImage }" width="80px" ></td>
			</tr>
			<tr>
			<td colspan="2" align="center">
				<input type="submit" class="btn btn-primary" value="수정">
				<input type="reset" class="btn btn-warning" value="초기화">
			</td>
			</tr>
		</table>
	</form>
