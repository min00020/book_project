<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.HttpURLConnection"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<h3>web-inf/insta/insta.jsp</h3>
<table>
	
</table>
<div id="list">
</div>

<script>
$.ajax({
	  url: 'https://graph.instagram.com/me/media?fields=id,caption,media_type,media_url,thumbnail_url&access_token=IGQWROOEhydUdKOUFnWmM5R1JkUkctZAkRFU0lOVWJEV09YdFV1UmhoWjFSbVJEeVlVUDZANTmlULWpPRmg1SVpDWGZAHbkVmaWQ2RUdNZA1VaMkEwOV9pMmFIR0JnTVh4ZA1BuTE1HTXF5LUhZASF9WUHd2Y1dFMzFjd0UZD',
	  method: 'GET',
	  dataType: 'jsonp',
	  success: function (response) {
	    // API 요청이 성공했을 때 실행될 코드
	    console.log(response);
	    
	    response.data.forEach(data => {
	    	let img = document.createElement('img');
	    	img.src = data.media_url;
	    	document.getElementById('list').append(img);
	    })
	    
	    
	  },
	  error: function (xhr, status, error) {
	    // API 요청이 실패했을 때 실행될 코드
	    console.log(xhr.responseText);
	  }
	});
	
	
</script>