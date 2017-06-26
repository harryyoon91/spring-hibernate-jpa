<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Yonghak Yoon</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(function() {

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
			<div class="btn-group" id="nav-for-home">
				<a href="about" type="button" class="btn btn-default">About</a>
				<a href="portfolio" type="button" class="btn btn-default">Portfolio</a>
				<a href="hireyonghak" type="button" class="btn btn-default">Hire Yonghak</a>
			</div>
		</div>
		<br>
		<br>
		<div class="row">
			<div class="panel panel-success">
				<div class="panel-heading"><h2>Thank you for your offer !</h2></div>
				<div class="panel-body">The mail has been sent successfully.</div>
			</div>
		</div>
	</div>
</body>
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
</html>