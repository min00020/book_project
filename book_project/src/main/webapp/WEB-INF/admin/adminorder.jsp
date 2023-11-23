<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 
<!-- Page level plugins -->
	<script src="resources/admin/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="resources/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>
     
<!-- Page level custom scripts -->
    <script src="resources/admin/js/demo/datatables-demo.js"></script>
   

<!-- Custom fonts for this template -->
<link href="resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="resources/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

                <!-- Begin Page Content -->
                <div class="container-fluid">

                     <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">주문관리</h1>
                    <p class="mb-4">주문내역을 조회하고 주문 상태를 변경할 수 있습니다.</p>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">주문 목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        	<th><input type="checkbox" name="check"> </th>
                                            <th>주문번호</th>
                                            <td>아이디</td>
                                            <td>전화번호</td>
                                            <td>주문금액</td>
                                            <td>주문상태</td>
                                            <td>결제수단</td>
                                            <td>주문일자</td>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        	<th><input type="checkbox" name="check"> </th>
                                            <th>주문번호</th>
                                            <td>아이디</td>
                                            <td>전화번호</td>
                                            <td>주문금액</td>
                                            <td>주문상태</td>
                                            <td>결제수단</td>
                                            <td>주문일자</td>
                                        </tr>
                                    </tfoot>
                                
                                    <tbody>
                                    <c:forEach items="${list}" var="vo">
                                        <tr id=${vo.odrCode }>
                                        	<td><input type="checkbox" name="check"></td>
                                            <td>${vo.odrCode }</td>
                                            <td>${vo.userId }</td>
                                            <td>${vo.odrPhone }</td>
                                            <td>${vo.odrTotalPrice }</td>
                                            <td>${vo.odrStatus }</td>
                                            <td>${vo.paymentStatus }</td>
                                            <td>${vo.odrDate }</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                
                                <div style=" text-align: center;" id = "orderStatus">
                                     <a href="#" class="btn btn-primary btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-check"></i>
                                        </span>
                                        <span class="text">배송완료</span>
                                      </a>
                                     <a href="#" class="btn btn-danger btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-trash"></i>
                                        </span>
                                        <span class="text">주문취소</span>
                                     </a>
                                </div>
                                        
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

    
     <script>
    	//주문완료
    	console.log('adminorder.jsp');
    	const a = document.querySelectorAll("#orderStatus a"); //주문 상태 변경 버튼 가져오기
    	console.log(a);
    	
    	a[0].addEventListener('click', function (e){
    		//console.log('배송완료버튼');
			e.preventDefault();
    		document.querySelectorAll('tbody input[type=checkbox]:checked') //체크박스 선택된 거
    		.forEach(ele => {
    			const status= ele.parentElement.parentElement.children[5]; //배송상태
    			status.innerHTML = '배송완료';
    			const ono = ele.parentElement.parentElement.children[1].innerText; //주문번호
    			
    			fetch('adminOrderUpdate.do', {
    				method: 'post',
    				headers: {'Content-type': 'application/x-www-form-urlencoded'},
    				body: 'ono=' + ono +'&status='+ '배송완료'
    			})
    			.then(resolve => resolve.json())
    			.then(result =>{
    				if(result.retCode == 'OK'){
    					//체크박스 해제
    					const checkboxes = document.querySelectorAll('tbody input[type=checkbox]:checked');
		    			checkboxes.forEach((checkbox) => {
		    				   checkbox.checked = false;
		    				});
    				} else{
    					alert('주문상태 변경실패')
    				}

				})//end of fetch
    		})//end of forEach
    	})//end of eventListener
    		
    	
    	a[1].addEventListener('click', function (e){
    		//console.log('주문취소버튼');
			e.preventDefault();
			document.querySelectorAll('tbody input[type=checkbox]:checked')
    		.forEach(ele => {
    			const status= ele.parentElement.parentElement.children[5];
    			status.innerHTML = '주문취소';
    			const ono = ele.parentElement.parentElement.children[1].innerText; //주문번호
    			fetch('adminOrderUpdate.do', {
    				method: 'post',
    				headers: {'Content-type': 'application/x-www-form-urlencoded'},
    				body: 'ono=' + ono +'&status='+ '주문취소'
    			})
    			.then(resolve => resolve.json())
    			.then(result =>{
    				if(result.retCode == 'OK'){
    					//완료시 체크박스 해제
		    			const checkboxes = document.querySelectorAll('tbody input[type=checkbox]:checked');
		    			checkboxes.forEach((checkbox) => {
		    				   checkbox.checked = false;
		    				});
    				} else{
    					alert('주문상태 변경실패')
    				}
    			})//end of fetch
    			
    		})//end of forEach
    	})//end of eventListener
    		
    </script>
    