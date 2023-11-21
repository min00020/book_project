<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">상품 등록</h1>
                    <!-- DataTales Example -->
                    
                    <div class="container">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">도서 등록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                           	 <form action="addBook.do" method="post" enctype="multipart/form-data">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <tr>
                                            <th>도서제목</th>
                                            	<td><input type="text" class="form-control form-control-user" name="title"></td>
                                        </tr>
			                            <tr>
                                            <th>분류</th>
                                            <td>
	                                            <select class="form-control form-control-user" name="sort">
												    <option value="소설">소설</option>
												    <option value="만화">만화</option>
												    <option value="사진">사진</option>
												</select>
											</td>
                                		</tr>
                                        <tr>
                                            <th>작가</th>
                                            	<td><input type="text" class="form-control form-control-user" name="writer"></td>
                                		</tr>
                                        <tr>
                                            <th>출판사</th>
                                            	<td><input type="text" class="form-control form-control-user" name="publisher"></td>
                                        </tr>
 										<tr>
                                            <th>가격</th>
                                            	<td><input type="text" class="form-control form-control-user" name="price"></td>
                                		</tr>                                     
                                		
                                        <tr>
                                            <th>수량</th>
                                            	<td><input type="text" class="form-control form-control-user" name="cnt"></td>
                                		</tr>
                                        <tr>
                                            <th>이미지</th>
                                            	<td><input type="file" class="form-control form-control-user" name="img"></td>
                                		</tr>
                                        <tr>
                                            <th>도서설명</th>
                                            	<td><textarea class="form-control form-control-user" cols="40" rows="5" name="content"></textarea></td>
                                        </tr>
                                </table>
                                <div style=" text-align: center;">
										<input type="submit" class="btn btn-primary" value="저장">
										<input type="reset" class="btn btn-warning" value="초기화">
                                </div>
                                
                                <hr>
                                 <div style=" text-align: center;">
			                                     <a href="#" class="btn btn-primary btn-icon-split" value="저장">
			                                        <span class="icon text-white-50">
			                                            <i class="fas fa-check"></i>
			                                        </span>
			                                        <span class="text" id="insertBook">등 록</span>
			                                      </a>
			                                	<a href="#" class="btn btn-secondary btn-icon-split" value="">
			                                        <span class="icon text-white-50">
			                                            <i class="fas fa-trash"></i>
			                                        </span>
			                                        <span class="text" id="reset">초기화</span>
			                                    </a>
		                                </div>
                             </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

           