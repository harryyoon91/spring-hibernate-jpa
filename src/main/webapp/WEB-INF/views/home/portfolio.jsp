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
<link rel="shortcut icon" href="\resources\favicon.ico" type="image/x-icon">
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(function() {
	$("#portfolio").attr("class", "active");
});
</script>
</head>
<body>
<%@ include file="nav.jsp" %>
	<div class="container">
		<div class="row">
			<table class="table table-striped">
				<col width="30%">
				<col width="70%">
				<thead>
					<tr>
						<th>Portfolio #1</th>
						<th>HR Program using JPA/Hibernate</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Description</td>
						<td>Basic CRUD application.</td>
					</tr>	
					<tr>
						<td>Duration</td>
						<td>3 days</td>
					</tr>
					<tr>
						<td>OS</td>
						<td>Windows 10</td>
					</tr>	
					<tr>
						<td>DB</td>
						<td>MySQL</td>
					</tr>	
					<tr>
						<td>Cloud</td>
						<td>AWS</td>
					</tr>	
					<tr>
						<td>WAS</td>
						<td>Tomcat 8.5</td>
					</tr>	
					<tr>
						<td>IDE</td>
						<td>Eclipse Neon</td>
					</tr>	
					<tr>
						<td>Back-end Framework</td>
						<td>Spring 4</td>
					</tr>	
					<tr>
						<td>Web Page</td>
						<td>JSP</td>
					</tr>	
					<tr>
						<td>ORM</td>
						<td>JPA/Hibernate</td>
					</tr>		
					<tr>
						<td>Language</td>
						<td>Java, Javascript, jQuery, HTML5, CSS3[Bootstrap]</td>
					</tr>		
					<tr>
						<td>etc</td>
						<td>Ajax, RESTful, JSON, JUnit, Javax.mail, Apache Commons, Apache POI</td>
					</tr>		
					<tr>
						<td>Github</td>
						<td><a href="https://github.com/harryyoon91/spring-hibernate-jpa" target="_blank">https://github.com/harryyoon91/spring-hibernate-jpa</a></td>
					</tr>
					<tr>
						<td colspan="2" class="text-right"><a href="../hr/hr" type="button" class="btn btn-primary btn-lg">Go to application <span class="glyphicon glyphicon-share"></span></a></td>
					</tr>
				</tbody>
			</table>
		</div>
		<hr>
		<div class="row">
			<table class="table table-striped">
				<col width="30%">
				<col width="70%">
				<thead>
					<tr>
						<th>Portfolio #2</th>
						<th>HR Search using MyBatis</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Description</td>
						<td>Basic CRUD application.</td>
					</tr>	
					<tr>
						<td>Duration</td>
						<td>1 days</td>
					</tr>
					<tr>
						<td>OS</td>
						<td>Windows 10</td>
					</tr>	
					<tr>
						<td>DB</td>
						<td>Oracle SQL</td>
					</tr>	
					<tr>
						<td>WAS</td>
						<td>Tomcat 8.5</td>
					</tr>	
					<tr>
						<td>IDE</td>
						<td>Eclipse Neon</td>
					</tr>	
					<tr>
						<td>Back-end Framework</td>
						<td>Spring 4</td>
					</tr>	
					<tr>
						<td>Web Page</td>
						<td>JSP</td>
					</tr>	
					<tr>
						<td>ORM</td>
						<td>MyBatis</td>
					</tr>		
					<tr>
						<td>Language</td>
						<td>Java, Javascript, jQuery, HTML5, CSS3[Bootstrap]</td>
					</tr>		
					<tr>
						<td>etc</td>
						<td>Ajax, RESTful, JSON</td>
					</tr>		
					<tr>
						<td>Github</td>
						<td><a href="https://github.com/harryyoon91/spring-mybatis" target="_blank">https://github.com/harryyoon91/spring-mybatis</a></td>
					</tr>
				</tbody>
			</table>
		</div>
		<hr>
		<div class="row">
			<table class="table table-striped">
				<col width="30%">
				<col width="70%">
				<thead>
					<tr>
						<th>Portfolio #3</th>
						<th>Chatroom using Websocket</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Description</td>
						<td>Basic chat application.</td>
					</tr>	
					<tr>
						<td>Duration</td>
						<td>1 days</td>
					</tr>
					<tr>
						<td>OS</td>
						<td>Windows 10</td>
					</tr>	
					<tr>
						<td>DB</td>
						<td>N/A</td>
					</tr>	
					<tr>
						<td>WAS</td>
						<td>Tomcat 8.5</td>
					</tr>	
					<tr>
						<td>IDE</td>
						<td>Eclipse Neon</td>
					</tr>	
					<tr>
						<td>Back-end Framework</td>
						<td>Spring 4</td>
					</tr>	
					<tr>
						<td>Web Page</td>
						<td>JSP</td>
					</tr>	
					<tr>
						<td>ORM</td>
						<td>N/A</td>
					</tr>		
					<tr>
						<td>Language</td>
						<td>Java, Javascript, jQuery, HTML5, CSS3[Bootstrap]</td>
					</tr>		
					<tr>
						<td>etc</td>
						<td>Websocket</td>
					</tr>		
					<tr>
						<td>Github</td>
						<td><a href="https://github.com/harryyoon91/spring-websocket" target="_blank">https://github.com/harryyoon91/spring-websocket</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<br>
</body>

<%@ include file="footer.jsp" %>
</html>
