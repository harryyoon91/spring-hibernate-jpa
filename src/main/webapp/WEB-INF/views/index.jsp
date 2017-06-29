<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<title>Yonghak Yoon</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="shortcut icon" href="\resources\favicon.ico" type="image/x-icon">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(function() {
	$('[data-toggle="tooltip"]').tooltip();
	$('.btn-success').click(function () {
		$("blockquote").remove();
		$("#nav-for-home").css("display", "block");
	})
});
</script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="page-header">
			<h1>Hello, Employer!</h1>
		</div>
	</div>
	
	<div class="row" id="content-div">
		<blockquote>
			<p>Welcome to Yonghak Yoon's website.</p>
			<footer>Learn more about <abbr title="self-starter, nice guy, hard-worker, muscular(in the future)">Yonghak Yoon</abbr> ? 
				<a href="home/about" type="button"  class="btn btn-success btn-xs">Yeah</a>
				<button class="btn btn-danger btn-xs" id="[east egg#1]oh, you got here! it's not working lol" data-toggle="tooltip" title="...?">Nope</button>
			</footer>
		</blockquote>
	</div>
</div>
<footer>
	<div class="container">
		<div class="row">
			<div class="text-center">
				<hr>
				<p>Copyright © Yonghak Yoon</p>
			</div>	
		</div>
	</div>
</footer>
</body>
</html>
