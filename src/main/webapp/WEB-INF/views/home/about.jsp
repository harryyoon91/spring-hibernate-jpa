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
				<a href="about" type="button" class="btn btn-primary">About</a>
				<a href="portfolio" type="button" class="btn btn-default">Portfolio</a>
				<a href="hireyonghak" type="button" class="btn btn-default">Hire Yonghak</a>
			</div>
		</div>
		
		<br>
		<div class="row">
			<div class="well">
				<img src="../../../resources/img/user1.png" class="img-circle" width="150" height="200">
				<hr>
				<table class="table table-striped">
					<thead></thead>
					<tbody>
						<tr>
							<td>Name</td>
							<td>Yonghak Yoon</td>
						</tr>
						<tr>
							<td>Contact</td>
							<td>harryyoon91@gmail.com</td>
						</tr>
						<tr>
							<td>Work Authorization</td>
							<td>Permanent Resident(Green Card)</td>
						</tr>
						<tr>
							<td>Location</td>
							<td>New York, New York(Northern Virginia & D.C. available)</td>
						</tr>
						<tr>
							<td>Relocation</td>
							<td>Yes, if there's a support</td>
						</tr>
						<tr>
							<td>Education</td>
							<td>
								<ul>
									<li>took few semesters from Queens College, New York</li>
									<li>graduated from JHTA Institute(Course: Spring/Java Web Development), South Korea</li>
								</ul>
							</td>
						</tr>
						<tr>
							<td>Skill Set</td>
							<td>
								<ul>
									<li>Java</li>
									<li>Spring</li>
									<li>SQL[Oracle SQL, MySQL]</li>
									<li>ORM[iBatis, myBatis, JPA/Hibernate]</li>
									<li>JSP</li>
									<li>Javascript</li>
									<li>jQuery</li>
									<li>HTML</li>
									<li>CSS</li>
									<li>Apache & Other Java, Javascript Libraries</li>
									<li>AJAX</li>
								</ul>
							</td>
						</tr>
						<tr>
							<td>Github</td>
							<td><a href="https://github.com/harryyoon91" target="_blank">https://github.com/harryyoon91</a></td>
						</tr>
						<tr>
							<td>Resume</td>
							<td>
								<a href="/home/portfolio/pdfresumetdownload"><label class="glyphicon glyphicon-file" style="padding-right:10px">[PDF]YonghakYoon-Resume.pdf</label></a>
								<a href="/home/portfolio/wordresumetdownload"><label class="glyphicon glyphicon-file">[WORD]YonghakYoon-Resume.doc</label></a>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<br>
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