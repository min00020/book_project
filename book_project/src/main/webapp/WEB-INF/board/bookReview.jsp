<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<style>

</style>
<div class="container px-4 px-lg-5 mt-5">
<h3>책 리뷰</h3>
<table class="table" border="1">
	<thead>
		<tr>
			<th>글번호</th>
			<th>책번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>작성일자</th>
			<th>조회수</th>
			<th>별점</th>
		</tr>
	<tbody>
		<c:forEach items="${bookReviewList }" var="vo">
				<tr>
					<td>${vo.boardNo }</td>
					<th>${vo.bookNo }</th>
					<td><a href="bookGetBoard.do?bno=${vo.boardNo }">${vo.boardTitle }</a>
					<td>${vo.boardContent }</td>
					<td>${vo.userId }</td>
					<td><fmt:formatDate value="${vo.boardDate }"
							 pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
					<td>${vo.boardCnt }</td>
                    
				</tr>
		</c:forEach>
	</tbody>
	
</table>
<p>
	<a href="bookBoardForm.do">게시판 등록</a>
</p>
</div>

