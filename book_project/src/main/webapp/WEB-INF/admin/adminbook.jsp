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
                    <p class="mb-4">상품 수량과 정보를 확인하고 수정할 수 있습니다.</p>
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
					                    <div class="col-lg-5 d-none d-lg-block bg-register-image" id="infoBookImage">도서사진</div>
					                    <div class="col-lg-7">
					                        <div class="p-5">
					                            <div class="text-center">
					                                <h1 class="h4 text-gray-900 mb-4" id="infoBookTitle">도서제목</h1>
					                            </div>
					                            <hr>
					                            <form class="user">
					                                <div class="form-group row">
					                                    <div class="col-sm-6 mb-3 mb-sm-0">
					                                        <p class="form-control form-control-user" id="infoBookNo">도서번호</p>
					                                    </div>
					                                    <div class="col-sm-6">
					                                        <p class="form-control form-control-user" id="infoBookType">도서분류</p>
					                                    </div>
					                                </div>
					                                <div class="form-group row">
					                                    <div class="col-sm-6 mb-3 mb-sm-0">
					                                        <p class="form-control form-control-user" id="infoBookWriter">지은이</p>
					                                    </div>
					                                    <div class="col-sm-6">
					                                        <p class="form-control form-control-user" id="infoBookPublisher">출판사</p>
					                                    </div>
					                                </div>
					                                <div class="form-group row">
					                                    <div class="col-sm-6 mb-3 mb-sm-0">
					                                        <p class="form-control form-control-user" id="infoBookPrice">가 격</p>
					                                    </div>
					                                    <div class="col-sm-6">
					                                        <p class="form-control form-control-user" id="infoBookCnt">수 량</p>
					                                    </div>
					                                </div>
					                                
					                                <div class="form-group">
					                                    <p class="form-control form-control-user" id="infoBookContent" >도서 소개</p>
					                                </div>
					                                <a href="login.html" class="btn btn-primary btn-user btn-block">
					                                    확 인
					                                </a>
					                            </form>
					                            <hr>
					                            <div class="text-center">
					                                <a class="small" href="forgot-password.html">도서등록을 원하실 경우 클릭하세요.</a>
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

const checkboxes = document.getElementsByName("check"); //체크박스 전부 가져오기
//console.log('체크박스:',checkboxes);

//상세페이지 위치 선언
const infoBookTitle = document.querySelector("#infoBookTitle");
const infoBookNo = document.querySelector("#infoBookNo");
const infoBookType = document.querySelector("#infoBookType");
const infoBookWriter = document.querySelector("#infoBookWriter");
const infoBookPublisher = document.querySelector("#infoBookPublisher");
const infoBookPrice = document.querySelector("#infoBookPrice");
const infoBookCnt = document.querySelector("#infoBookCnt");
const infoBookContent = document.querySelector("#infoBookContent");
const infoBookImage = document.querySelector("#infoBookImage");


//checkbox 하나만 선택 + 체크박스 누르면 > 선택한 상품 상세정보 띄우기
function checkOnlyOne(element){
	
	checkboxes.forEach((cb)=>{
		cb.checked = false;
	})
	element.checked = true; //하나만 선택 끝
	
	const booklist = element.parentElement.parentElement;
	//const booklist = document.querySelector("#booklist"); >이러면 값 고정돼서 안됨
	console.log('booklist:',booklist);
	console.log('booklist1:',booklist.children[1].innerText); //도서번호
		infoBookTitle.innerHTML = booklist.children[3].innerText;
		infoBookNo.innerHTML = booklist.children[1].innerText;
		infoBookType.innerHTML = booklist.children[2].innerText;
		infoBookWriter.innerHTML = booklist.children[4].innerText;
		infoBookPublisher.innerHTML = booklist.children[5].innerText;
		infoBookPrice.innerHTML = booklist.children[6].innerText + '원';
		infoBookCnt.innerHTML = booklist.children[7].innerText + "개";
		infoBookContent.innerHTML = booklist.children[9].innerText;
		//infoBookImage.innerHTML = '<img src="resources/image/'+booklist.children[8].innerText+" width="50%">;
	
}

</script>
