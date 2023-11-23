<%@page import="co.yedam.board.service.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    


<div class="container px-4 px-lg-5 mt-5">

	<h3>게시글 삭제화면</h3>
	<form action="reviewRemoveBoard.do" method="post">
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
			<td colspan="2" align="center">
				<input type="submit" class="btn btn-secondary" value="삭제">
				
			</td>
			</tr>
		</table>
	</form>


</div>

