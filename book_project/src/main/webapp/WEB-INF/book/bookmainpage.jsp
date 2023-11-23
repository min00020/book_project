<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.net.HttpURLConnection"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
.main-view{
      margin:  auto;
      margin-bottom: 20px;
      margin-top: 50px;
      text-align: center;
}
.main-view{height:500px;overflow:}
.main-view ul{width:calc(100% * 3);display:flex;animation:slide 8s infinite;} /* slide를 8초동안 진행하며 무한반복 함 */
.main-view li{width:calc(100% / 3);height:300px;}
    
    @keyframes slide {
      0% {margin-left:0;} /* 0 ~ 10  : 정지 */
      10% {margin-left:0;} /* 10 ~ 25 : 변이 */
      25% {margin-left:-100%;} /* 25 ~ 35 : 정지 */
      35% {margin-left:-100%;} /* 35 ~ 50 : 변이 */
      50% {margin-left:-200%;}
      60% {margin-left:-200%;}
      100% {margin-left:0;}
}
.cater3-movingBG {
    height: 1vh;
   
}
.flyinTxtCont {
    height: 100%;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    -webkit-box-align: start;
    -ms-flex-align: start;
    align-items: flex-start;
    -webkit-box-pack: end;
    -ms-flex-pack: end;
    justify-content: flex-end;
    padding-bottom: 10%;
      margin-left: 3em;
}
.flyIn {
    color:#fff;
    font-family:'Raleway';
    text-transform:uppercase;
    line-height:1.2em;
    position:relative;
  text-shadow: 2px 2px 40px rgba(0,0,0,0.7);
}
.lineOne {
  transition-delay:.2s; 
  transition:.4s ease in;
  animation: txtFlyIn .3s linear;
}
.lineTwo {
    transition-delay:.8s; 
    transition:.6s ease in;
    animation: txtFlyIn .6s linear;
}
.lineThree {
    transition-delay:.6s; 
    transition:.8s ease in;
    animation: txtFlyIn .9s linear;
}
.lineOne, .lineTwo, .lineThree {
    font-size:90px;
    font-weight: 800;
    letter-spacing: 2px;
  }
.lineFour {
    transition-delay:2s; 
    transition:2s ease in;
    animation: fadeIn 2s linear;
    width: 100%;
    background-color:rgba(255,255,255,0.9);
    display:inline-block;
    color:#000;
    box-size:border-box;
    max-width:63%;
    max-width: 22em;
    font-size: 32px;
    padding: .2em .5em;
    margin-top: 30px;
    
}
@keyframes fadeIn{
    0% { opacity:0;}
    100% { opacity:1;}
}
@keyframes txtFlyIn{
    0% { transform:translateX(-100%); }
    100% { transform:translateX(0%); }
}

#insta{
	width: 1000px; 
	margin: 0 auto;
	text-align : center; 
}

</style>
    <!-- 메인 이미지 -->	
    <div class = "container">
       <div class="main-view">
          <ul>
            <li><img src="resources/image/슬라이드이미지.jpg" style="height:500px; width:100%"/></li>
           
            <li><img src="resources/image/슬라이드이미지2.jpg" style="height:500px; width:100%"/></li>
      
            <li><img src="resources/image/슬라이드이미지3.jpg" style="height:500px; width:100%"/></li>
            
            <li><img src="resources/image/슬라이드이미지4.jpg" style="height:500px; width:100%"/></li>
            
            <li><img src="resources/image/슬라이드이미지5.jpg" style="height:500px; width:100%"/></li>
      
          </ul>
        </div>
		
		<!-- 메인 문구 -->       
        <div class="cater3-movingBG">
			<div class="flyinTxtCont">
				<div class="flyIn lineOne">BOOK MARKET</div>
				<div class="flyIn lineTwo">makes </div>	
				<div class="flyIn lineThree">Innovation</div>
				<div class="flyIn lineFour"></div>
			</div>
		</div>
<!-- <header class="bg-dark py-5"
	style="background-image: url('https://search.pstatic.net/sunny/?src=https%3A%2F%2Fimages.unsplash.com%2Fphoto-1573592371950-348a8f1d9f38%3Fixlib%3Drb-4.0.3%26ixid%3DMnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDZ8fHxlbnwwfHx8fA%253D%253D%26w%3D1000%26q%3D80&amp;type=sc960_832')">
	<div class="container px-4 px-lg-5 my-5">
		<div class="text-center text-white">
			<h1 class="display-4 fw-bolder">BOOKSHOP</h1>
			<p class="lead fw-normal text-white-80 mb-0">A book changes my
				life</p>
		</div>
	</div>
</header> -->



<div class="text-center">
	<span style="font-size: 2.5em;">11월을 위한 추천 도서</span>
</div>

<div></div>
<div class="container px-4 px-lg-5 mt-5">
	<div
		class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
		<!-- 상품목록 -->
		<c:forEach items="${list}" var="vo">


			<div class="col mb-5">
				<div class="card h-100" style="float: right; width: 220px;">

					<!-- Sale badge-->
					<!-- Product image-->
					<img class="card-img-top"
						style="float: right; width: 220px; height: 250px;"
						src="resources/image/${vo.bookImage }" alt="..." />
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder">${vo.bookTitle }</h5>
							<!-- Product reviews-->
							<div
								class="d-flex justify-content-center small text-warning mb-2">
							</div>
							<div
								class="d-flex justify-content-center small text-warning mb-2">
							</div>
							<!-- Product price-->
							<span class="">${vo.bookPrice }</span>
						</div>
					</div>

					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto"
								href="bookInfo.do?bno=${vo.bookNo }">Cart</a>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<!-- 상품목록 -->
	</div>
</div>

<hr>
	<div id="insta">
		<a href="https://www.instagram.com/book_yedam/" style = "text-decoration:none; color:black;"><h3>Follow us!</h3></a>
		
		<p>예담서점 인스타그램을 팔로우하고 다양한 소식을 더 빠르게 받아보세요.</p>
	</div>
	
	
<script>
$.ajax({
	  url: 'https://graph.instagram.com/me/media?fields=id,caption,media_type,media_url,thumbnail_url&access_token=IGQWRPalJCbTVRQVFJZA000eEJaOC03bTlYaXo3UmwyeW1iLUlIU0R2OG0yWVB4OVR0QlpuQkQyLU42U1REcDNVUl9iS3l1cW5jWHNITlJoTTAwYnJQNWZA2WmJvTzh3UXhZAY01aWk5QMFRLVkFrQUNtMXFGM2IwdGsZD',
	  method: 'GET',
	  dataType: 'jsonp',
	  success: function (response) {
	    // API 요청이 성공했을 때 실행될 코드
	    console.log(response);
	    console.log(response.data);
	    
/* 
	    
	    response.data.forEach(data => {
	    	let img = document.createElement('img');
	    	img.src = data.media_url;
	    	document.getElementById('insta').append(img);
	    	
	    }) */
	    
	    const table = document.createElement('table');
	    const tbody = document.createElement('tbody');
	    table.setAttribute('style','border-spacing: 10px;border-collapse:separate;margin-left:auto;margin-right:auto;');
	    //table.setAttribute('border','1');


	    const tr = document.createElement('tr');
	    response.data.forEach(data => {
	    		const td1 = document.createElement('td');
	    		td1.innerHTML = '<img src="'+ data.media_url +'" height="100px" width="100px">';;
	    		tr.appendChild(td1);
	    })
	    	tbody.appendChild(tr);

	    table.appendChild(tbody);
	    document.getElementById('insta').appendChild(table);

	    
	    
	  },
	  error: function (xhr, status, error) {
	    // API 요청이 실패했을 때 실행될 코드
	    console.log(xhr.responseText);
	  }
	});
	
	
</script>

