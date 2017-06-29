<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	$("#about").attr("class", "active");
});
</script>
</head>
<body>
<%@ include file="nav.jsp" %>
	<div class="container">
		<div class="row">
			<div class="well">
				 <div class="row">
				  <div class="col-md-4">
				    <div class="thumbnail" style="width:300px;">
				        <img src="\resources\img\picture.jpg" alt="Lights" style="width:75%" class="img-circle">
				        <div class="caption">
							<div class="dropdown">
							  <button class="btn btn-primary dropdown-toggle" style="margin-left:90px" type="button" data-toggle="dropdown">Resume
							  <span class="caret"></span></button>
							  <ul class="dropdown-menu">
							    <li><a href="/home/portfolio/pdfresumetdownload"><label class="glyphicon glyphicon-file">[PDF]YonghakYoon-Resume.pdf</label></a></li>
							    <li><a href="/home/portfolio/wordresumetdownload"><label class="glyphicon glyphicon-file">[WORD]YonghakYoon-Resume.docx</label></a></li>
							  </ul>
							</div>
				        </div>
				    </div>
				  </div>
			</div>
				<table class="table table-striped">
					<thead></thead>
					<tbody>
						<tr>
							<td>Name</td>
							<td>Yonghak Yoon</td>
						</tr>
						<tr>
							<td>Github</td>
							<td><a href="https://github.com/harryyoon91" target="_blank">https://github.com/harryyoon91</a></td>
						</tr>
						<tr>
							<td>Contact</td>
							<td><a href="/home/hireyonghak">harryyoon91@gmail.com</a></td>
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
									<li>Java, Servlet, JSP, Spring Framework</li>
									<li>SQL[Oracle SQL, MySQL]</li>
									<li>ORM[iBatis, myBatis, JPA/Hibernate]</li>
									<li>Javascript, jQuery, HTML, CSS</li>
									<li>RESTful, Ajax, Json</li>
									<li>SVN, Github</li>
									<li>AWS Cloud EC2 & Route 53</li>
									<li>Libraries(Apache Commons, Poi, Chart.js, jqTree, FullCalendar and etc)</li>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<br>
</body>

<%@ include file="footer.jsp" %>
</html>