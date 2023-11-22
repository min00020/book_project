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
                                            <th>도서번호</th>
                                            <th>카테고리</th>
                                            <th>도서제목</th>
                                            <th>작가</th>
                                            <th>출판사</th>
                                            <th>가격</th>
                                            <th>수량</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                           	<th>도서번호</th>
                                            <th>카테고리</th>
                                            <th>도서제목</th>
                                            <th>작가</th>
                                            <th>출판사</th>
                                            <th>가격</th>
                                            <th>수량</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach items="${list}" var="vo">
                                        <tr>
                                            <td>${vo.bookNo }</td>
                                            <td>${vo.bookSort }</td>
                                            <td>${vo.bookTitle }</td>
                                            <td>${vo.bookWriter }</td>
                                            <td>${vo.bookPublisher }</td>
                                            <td>${vo.bookPrice }</td>
                                            <td>${vo.bookCnt }</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

