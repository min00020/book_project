<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style>
form{
padding:10px;


}
.form-control {
		display: inline-block;
		width : 1200px;
		margin : 5px;
	}
</style>

<h3>게시글 등록화면</h3>

<form action="bookAddBoard.do" method="post"
	enctype="multipart/form-data">
	<!--  enctype="multipart/form-data 이부분 지워야할지 말아야할지 ? -->
	<table border="1" class="talbe">
		<th>게시판 선택</th>
		<tr>
			<td>
			<select name="boardSort" id="sort">
					<option value="QnA게시판">QnA게시판</option>
					<option value="공지사항">공지사항</option>
					<option value="리뷰게시판">리뷰게시판</option>
			</select>
			</td>
		</tr>
		
		<tr>
			<th>제목</th>
			<td><input type="text" name="boardTitle" class="form-control"></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="userId" class="form-control" value="${id}" readonly></td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td colspan="2"><textarea cols="35" class="form-control" rows="5" name="boardContent"></textarea></td>
		</tr>
		<tr>
			<th>파일 첨부</th>
			<td><input type="file" name="image" class="form-control"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" class="btn btn-primary"
				value="저장"> <input type="reset" class="btn btn-warning"
				value="초기화"></td>
		</tr>



	</table>
</form>
