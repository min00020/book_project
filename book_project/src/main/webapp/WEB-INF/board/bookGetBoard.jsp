<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<style>
#list span {
	margin: 20px;
}

.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
}
 
.pagination a.active {
	background-color: #4CAF50;
	color: white;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}
#line{
padding:10px;
border:1px solid black;
}
</style>

<h3>상세화면</h3>
<form action="reviewModifyForm.do" name="myfrm" id="line">
	<input type="hidden" name="bno" value="${bno.boardNo }">
	<table class="table">
		<tr>
			<th>글번호</th>
			<td class="boardNo">${bno.boardNo }</td>
			<th>작성일시</th>
			<td><fmt:formatDate value="${bno.boardDate }"
					pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
		</tr>
		<tr>
		
			<th>글제목</th>
			<td colspan="3">${bno.boardTitle }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="4"><textarea rows="5" cols="140" readonly>${bno.boardContent }</textarea></td>
		</tr>
		<tr>
			<th>이미지</th>
			<c:choose>
				<c:when test="${!empty bno.boardImage }">
					<td colspan="3"><img style="align: center;" width="100px"
						src="resources/image/${bno.boardImage }"></td>
				</c:when>
				<c:otherwise>
					<td colspan="3"></td>
				</c:otherwise>
			</c:choose>



		</tr>
		<tr>
			<th>작성자</th>
			<td>${bno.userId }</td>
			<th>조회수</th>
			<td>${bno.boardCnt }</td>
		</tr>
		<tr>
			<td colspan="4" align="center"><c:choose>
					<c:when test="${!empty id && id == bno.userId }">
						<input type="submit" class="btn btn-secondary" value="수정">
						<input type="button" class="btn btn-secondary" value="삭제하시겠습니까?">
					</c:when>
					<c:otherwise>
						<input disabled type="submit" value="수정">
						<input disabled type="button" value="삭제">
					</c:otherwise>
				</c:choose></td>
		</tr>
	</table>
</form>

<br>
<div class="container px-4 px-lg-5 mt-5">
<h3>댓글등록</h3>
<table class="table">
	<tr>
		<th>댓글내용</th>
		<td><input type="text" id="content" style="border:2px solid black;"></td>
		<td><button id="addReply">댓글등록</button></td>
	</tr>
</table>

<h3>댓글목록</h3>
<ul id="list">
	<li style="display: none;" id="template"><span>00</span><b>첫번째글입니다.</b><span>user01</span><span>2023-06-24</span>
		<button id="delReply">삭제</button></li>
</ul>
<div class="pagination"></div>
</div>

<script>
	document.querySelector("input[type=button]").addEventListener('click',
			function(e) {
				document.forms.myfrm.action = 'reviewRemoveForm.do';
				document.forms.myfrm.submit();
			});
	
	//댓글 목록.
	let bno = "${bno.boardNo}";
	let writer = "${id}";
	bno = document.querySelector('.boardNo').innerHTML;
	let page = 1;
	
	function showList(pg = 1){
	document.querySelectorAll('#list li:not(:nth-of-type(1))')
		.forEach(li => li.remove()); //첫번째 li 요소는 template 용도라서 남겨야함 지우지 않음.
		
	fetch('replyList.do?bno=' + bno + '&page=' + pg)
	.then(resolve => resolve.json())
	.then(result => {
		console.log(result);
		if (pg < 0){
			page = (Math.ceil(result.dto.total/5));
			if(page <= 0)
				page = 1;
			showList(page);
			return;
		}
		result.list.forEach(reply => {
			let li = makeRow(reply);
			// ul>li 생성.
			document.querySelector('#list').append(li);
			
		})
		//page생성 . 데이터 처리하는곳
		makePaging(result.dto);
	})
	.catch(err => console.log(err));
}// showList end
showList();
	
	// 페이지링크 생성.
	function makePaging(dto={}){
		document.querySelector('.pagination').innerHTML = '';
		
		if(dto.prev){
			let aTag = document.createElement('a');
			aTag.setAttribute('href', dto.startPage - 1);
			aTag.innerHTML = "&laquo;";
			document.querySelector('.pagination').append(aTag);
		}
		for(let i = dto.startPage; i <= dto.endPage; i++){
			let aTag = document.createElement('a');
			aTag.setAttribute('href', i);
			aTag.innerHTML = i;
			// active 녹색.
			if (i == page){
				aTag.className = 'active'; //  class속성을 저장할 때 ... className.
			}
			document.querySelector('.pagination').append(aTag);
		}
		if(dto.next){
			let aTag = document.createElement('a');
			aTag.setAttribute('href', dto.endPage + 1);
			aTag.innerHTML = "&raquo;";
			document.querySelector('.pagination').append(aTag);
		}
		
		// a에 클릭이벤트 등록.
		document.querySelectorAll('.pagination a').forEach(elem => {
			elem.addEventListener('click', function(e){
				e.preventDefault(); // form, a => 링크기능 차단.
				page = elem.getAttribute('href');
				showList(page);
			})
		})
		
	}
	

	
	
	// 등록버튼.
	document.querySelector('#addReply').addEventListener('click', function(e){
		let reply = document.querySelector('#content').value;
		if(!bno || writer == 'null' || !reply){
			alert('값을 확인해주세요.');
			return;
		}
		
		// ajax. bno/writer/reply => 전달.
		fetch('addReply.do', {
			method: 'post',
			headers: {'Content-type': 'application/x-www-form-urlencoded'},
			body: 'bno=' + bno + '&reply=' + reply + '&replyer=' + writer
		})
		.then(resolve => resolve.json())
		.then(result =>{
			if(result.retCode == 'OK'){
				//document.querySelector('#list').append(makeRow(result.vo));
				showList(-1);
			} else{
				alert('등록 실패')
			}
			
		})
	})
	
	
	function makeRow(reply){
		
		
		let temp = document.querySelector('#template').cloneNode(true);
		temp.style.display = 'block';
		
		console.log(temp);
		temp.querySelector('span:nth-of-type(1)').innerHTML = reply.replyNo;
		temp.querySelector('b').innerHTML = reply.reply;
		temp.querySelector('span:nth-of-type(2)').innerHTML = reply.replyer;
		temp.querySelector('span:nth-of-type(3)').innerHTML = reply.replyDate;
//		temp.querySelector('button').addEventListener('click', deleteCallback);
		
		//내가 만든 삭제
		temp.querySelector('#delReply').addEventListener('click', function(e){
			//삭제 권한
			if(writer != reply.replyer){
				alert('권한이 없습니다.')
				return;
			}
			//삭제 버튼
			fetch('delReply.do?rno=' + 
					reply.replyNo
			)
			.then(resolve => resolve.json())
			.then(result => {
				if(result.retCode == 'OK'){
					alert('삭제성공');
					temp.remove();
					showList(-1);
				} else {
					alert('삭제실패');
				}
			
			})
		
		})
		return temp;
	}
	
	
	</script>
