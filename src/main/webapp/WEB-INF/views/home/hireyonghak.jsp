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
	$("#hireyonghak").attr("class", "active");
});
</script>
</head>
<body>
<%@ include file="nav.jsp" %>
	<div class="container">
		<div class="row">
			<form:form method="post" modelAttribute="hire" id="hire-form">
				<div class="form-group">
					<label for="email">Email address</label>
					<input type="email" class="form-control" id="email" name="email" required>
				</div>
				<div class="form-group">
					<label for="company">Company</label>
					<input type="text" class="form-control" id="company" name="company" required>
				</div>
				<div class="form-group">
					<label for="website">Website</label>
					 <input type="url" class="form-control" id="website" name="website" required>
				</div>
				<div class="form-group">
					<label for="location">Location </label>
					 <input type="text" class="form-control" id="location" name="location" placeholder="e.g.)City, State, Zipcode" required>
				</div>
				<div class="form-group">
					<label for="jobtype">Job Type</label>
					<div class="radio">
						<label><input type="radio" name="jobtype">Full-time</label>
					</div>
					<div class="radio">
						<label><input type="radio" name="jobtype">Contract</label>
					</div>
				</div>
				<div class="form-group">
					<label for="salary">Salary Offer </label><small>(USD)</small>
					 <input type="number" class="form-control" id="salary" name="salary" required>
				</div>
				<div class="form-group">
					<label for="description">What you want me to know about : </label>
					<textarea class="form-control" rows="5" id="description" name="description" style="resize:vertical"></textarea>
				</div>
				<div class="pull-right">
					<button type="submit" class="btn btn-success">Submit</button>
					<button type="reset" class="btn btn-danger">Reset</button>
				</div>
			</form:form>
		</div>
	</div>
	<br>
</body>

<%@ include file="footer.jsp" %>
</html>
