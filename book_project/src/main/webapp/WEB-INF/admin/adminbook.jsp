<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- Page level plugins -->
	<script src="resources/admin/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="resources/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>
     
<!-- Page level custom scripts -->
    <script src="resources/admin/js/demo/datatables-demo.js"></script>
   

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">상품 목록</h1>
                    <p class="mb-4">상품 수량과 정보를 확인하고 수정, 삭제할 수 있습니다.</p>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">도서 목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                    
                                        <tr>
                                       		<th><input type="checkbox" name="check"> </th>
                                            <th>도서번호</th>
                                            <th>카테고리</th>
                                            <th>도서제목</th>
                                            <th>작가</th>
                                            <th>출판사</th>
                                            <th>가격</th>
                                            <th>수량</th>
                                            <th style="display: none;"></th>
                                            <th style="display: none;"></th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        	<th><input type="checkbox" name="check" > </th>
                                           	<th>도서번호</th>
                                            <th>카테고리</th>
                                            <th>도서제목</th>
                                            <th>작가</th>
                                            <th>출판사</th>
                                            <th>가격</th>
                                            <th>수량</th>
                                            <th style="display: none;"></th>
                                            <th style="display: none;"></th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach items="${list}" var="vo">
                                        <tr id = "booklist">
                                        	<th><input type="checkbox" name="check" id="check" onclick='checkOnlyOne(this)'> </th>
                                            <td>${vo.bookNo }</td>
                                            <td>${vo.bookSort }</td>
                                            <td>${vo.bookTitle }</td>
                                            <td>${vo.bookWriter }</td>
                                            <td>${vo.bookPublisher }</td>
                                            <td>${vo.bookPrice }</td>
                                            <td>${vo.bookCnt }</td>
                                            <td style="display: none;">${vo.bookImage }</td>
                                            <td style="display: none;">${vo.bookContent }</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <hr>
                                	<!-- Nested Row within Card Body 카드형식 -->
                                	
					                <div class="row">
					                    <div class="col-lg-5 d-none d-lg-block bg-register-image" id="infoBookImage" name="img">
					                    	<img src="https://i.pinimg.com/originals/b4/d1/9c/b4d19c84919c3880b89c60200ab587ba.png" height="100%" width="100%">
					                    </div>
					                    <div class="col-lg-7">
					                        <div class="p-5">
					                            <div class="text-center">
					                                <h1 class="h4 text-gray-900 mb-4" id="infoBookTitle">도서제목</h1>
					                            </div>
					                            <hr>
					                            <form class="user" action="updateBook.do" method="post" enctype="multipart/form-data">
					                                <div class="form-group row">
					                                    <div class="col-sm-6 mb-3 mb-sm-0">
					                                         <input type="text" class="form-control form-control-user" id="infoBookNo" name="bno"
					                                             placeholder="도서번호" readonly>
					                                    </div>
 					                            	    <div class="col-sm-6">
					                                        <input type="text" class="form-control form-control-user" id="infoBookType"
					                                           name="sort" placeholder="도서분류">
					                                    </div> 
					                                    <!-- <div class="col-sm-6">
					                                        <select class="form-control form-control-user" id="infoBookType"
					                                           name="sort">
					                                            <option option value="" selected disabled hidden>선택</option>
					                                            <option value="소설">소설</option>
												    			<option value="만화">만화</option>
												  				<option value="사진">사진</option>
					                                        </select>
					                                    </div> -->
					                                </div>
					                                <div class="form-group row">
					                                    <div class="col-sm-6 mb-3 mb-sm-0">
					                                       <input type="text" class="form-control form-control-user"
					                                            id="infoBookWriter" name="writer" placeholder="지은이">
					                                    </div>
					                                    <div class="col-sm-6">
					                                        <input type="text" class="form-control form-control-user"
					                                            id="infoBookPublisher" name="publisher" placeholder="출판사">
					                                    </div>
					                                </div>
					                                <div class="form-group row">
					                                    <div class="col-sm-6 mb-3 mb-sm-0">
					                                      <input type="text" class="form-control form-control-user"
					                                            id="infoBookPrice" name="price" placeholder="가격">
					                                    </div>
					                                    <div class="col-sm-6">
					                                         <input type="text" class="form-control form-control-user"
					                                            id="infoBookCnt" name="cnt" placeholder="수량">
					                                    </div>
					                                </div>
					                                
					                                <div class="form-group">
					                                    <textarea  class="form-control form-control-user" id="infoBookContent" name="content" rows="3">도서 소개</textarea>
					                                </div>
					                                <a href="#" class="btn btn-google btn-user btn-block" onclick= 'deleteBook()'>
			                                            상 품 삭 제
			                                        </a>
					                                <hr>
					                                <div style="text-align: center;">
															<input type="submit" class="btn btn-primary" value="상품 수정">
															<input type="reset" class="btn btn-warning" value="초기화">
					                                </div>
					                            </form>
					                            <hr>
					                            <div class="text-center">
					                                <a class="small" href="insertBook.do">도서등록을 원하실 경우 클릭하세요.</a>
					                            </div>
					                        </div>
					                    </div>
					                </div>
					                <!-- 카드형식 도서목록 끝 -->
			                	<hr>
                            </div>
                        </div>
                    	<!-- 도서목록 테이블 끝 -->
						   
                    
                    </div>

                </div>
                <!-- /.container-fluid -->

<script>
const table = new DataTable('#dataTable');

const checkboxes = document.getElementsByName("check"); //체크박스 전부 가져오기

//상세페이지 위치 선언
const infoBookTitle = document.querySelector("#infoBookTitle");
const infoBookImage = document.querySelector("#infoBookImage");

//checkbox 하나만 선택 + 체크박스 누르면 > 선택한 상품 상세정보 띄우기
function checkOnlyOne(element){
	console.log(element);
	checkboxes.forEach((cb)=>{
		cb.checked = false;
	})
	element.checked = true; //하나만 선택 끝
	
	
	element.parentElement.parentElement.className = 'selected';
	
	const booklist = element.parentElement.parentElement;
	console.log('test:',document.getElementById("infoBookType"));
	//const booklist = document.querySelector("#booklist"); >이러면 값 고정돼서 안됨
	console.log('booklist:', booklist);
	console.log('booklist1:', booklist.children[1].innerText); //도서번호
		infoBookTitle.innerHTML = booklist.children[3].innerText;
		document.getElementById("infoBookNo").value = booklist.children[1].innerText;
		document.getElementById("infoBookType").value = booklist.children[2].innerText;
		document.getElementById("infoBookWriter").value = booklist.children[4].innerText;
		document.getElementById("infoBookPublisher").value = booklist.children[5].innerText;
		document.getElementById("infoBookPrice").value = booklist.children[6].innerText;
		document.getElementById("infoBookCnt").value = booklist.children[7].innerText;
		document.getElementById("infoBookContent").value = booklist.children[9].innerText;
		infoBookImage.innerHTML = '<img src="resources/image/'+booklist.children[8].innerText+'" height="100%" width="100%">';
}

function deleteBook(){
	let bno = document.getElementById("infoBookNo").value;
	console.log('bno:',bno);
	fetch('deleteBook.do?bno='+bno)
	.then(resolve => resolve.json())
	.then(result => {
		console.log(result);
		if(result.retCode == 'OK'){
			table.row('.selected').remove().draw(false);
			alert('삭제성공');
		} else {
			alert('삭제실패');
		}
	})
	
}



</script>
