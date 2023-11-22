<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>




<!-- Nested Row within Card Body 카드형식 -->
					                <div class="row">
					                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					                    <div class="col-lg-7">
					                        <div class="p-5">
					                            <div class="text-center">
					                                <h1 class="h4 text-gray-900 mb-4">도서제목</h1>
					                            </div>
					                            <form class="user">
					                                <div class="form-group row">
					                                    <div class="col-sm-6 mb-3 mb-sm-0">
					                                        <input type="text" class="form-control form-control-user" id="infoBookNo"
					                                            placeholder="도서번호">
					                                    </div>
					                                    <div class="col-sm-6">
					                                        <input type="text" class="form-control form-control-user" id="infoBookType"
					                                            placeholder="도서분류">
					                                    </div>
					                                </div>
					                                <div class="form-group row">
					                                    <div class="col-sm-6 mb-3 mb-sm-0">
					                                        <input type="password" class="form-control form-control-user"
					                                            id="infoBookWriter" placeholder="지은이">
					                                    </div>
					                                    <div class="col-sm-6">
					                                        <input type="password" class="form-control form-control-user"
					                                            id="infoBookPublisher" placeholder="출판사">
					                                    </div>
					                                </div>
					                                <div class="form-group row">
					                                    <div class="col-sm-6 mb-3 mb-sm-0">
					                                        <input type="password" class="form-control form-control-user"
					                                            id="infoBookPrice" placeholder="가격">
					                                    </div>
					                                    <div class="col-sm-6">
					                                        <input type="password" class="form-control form-control-user"
					                                            id="infoBookCnt" placeholder="수량">
					                                    </div>
					                                </div>
					                                
					                                <div class="form-group">
					                                    <input type="email" class="form-control form-control-user" id="infoBookContent"
					                                        placeholder="도서소개">
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