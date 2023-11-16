<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html lang="en">
<style>
.site-logo {
	width: 150px;
}
</style>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Tailwind Starter Template - Nordic Shop: Tailwind Toolbox</title>
<meta name="description"
	content="Free open source Tailwind CSS Store template">
<meta name="keywords"
	content="tailwind,tailwindcss,tailwind css,css,starter template,free template,store template, shop layout, minimal, monochrome, minimalistic, theme, nordic">

<link rel="stylesheet"
	href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css" />

<link href="https://fonts.googleapis.com/css?family=Work+Sans:200,400&display=swap"
	rel="stylesheet">
	
<link href="resources/css/style.css" rel="stylesheet" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>

<body class="bg-white text-gray-600 work-sans leading-normal text-base tracking-normal">

	<!-- Header-->
	<tiles:insertAttribute name="header"></tiles:insertAttribute>
	<!-- banner -->
	<tiles:insertAttribute name="banner"></tiles:insertAttribute>
	<!-- Section-->
	<tiles:insertAttribute name="body"></tiles:insertAttribute>
	<!-- Footer-->
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>

</body>

</html>