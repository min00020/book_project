<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.HttpURLConnection"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
#insta{
	width: 200px;
	height: 200px;
}
</style>


<h3>web-inf/insta/insta.jsp</h3>
	<div id="insta">
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
	    table.setAttribute('style','border-spacing: 5px;border-collapse:separate');
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