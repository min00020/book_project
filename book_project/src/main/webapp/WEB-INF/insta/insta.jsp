<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.HttpURLConnection"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<h3>web-inf/insta/insta.jsp</h3>
	<div id="list">
	</div>
	
	
<script>
$.ajax({
	  url: 'https://graph.instagram.com/me/media?fields=id,caption,media_type,media_url,thumbnail_url&access_token=IGQWROX21CekFvMUVPRlZACS1A5bWF0cXBkUEdMU2JUQzJZATWdMQWhmeU1Sa1o0NlpoenJLbWxTTmNsSG53cGZA5bkJKSUZAEamxhRUgwV0U5dHhwV1ZAGa1RtRHpETzcteFlxeXEyX0x0SDFJTUpCcHBKQ2duenFFY0UZD',
	  method: 'GET',
	  dataType: 'jsonp',
	  success: function (response) {
	    // API 요청이 성공했을 때 실행될 코드
	    console.log(response);
	    console.log(response.data);
	    

	    
	    response.data.forEach(data => {
	    	let img = document.createElement('img');
	    	img.src = data.media_url;
	    	document.getElementById('list').append(img);
	    	
	    })
	    
	    const table = document.createElement('table');
	    const tbody = document.createElement('tbody');
	    table.setAttribute('border','1');


	    response.data.forEach(data => {
	    	const tr = document.createElement('tr');
	    		const td1 = document.createElement('td');
	    		td1.innerHTML = data.media_url;
	    		tr.appendChild(td1);
	    	tbody.appendChild(tr);
	    })

	    table.appendChild(tbody);
	    document.getElementById('list').appendChild(table);

	    
	    
	  },
	  error: function (xhr, status, error) {
	    // API 요청이 실패했을 때 실행될 코드
	    console.log(xhr.responseText);
	  }
	});
	
	
</script>