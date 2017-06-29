<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HR Program by Yonghak Yoon</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="shortcut icon" href="\resources\favicon.ico" type="image/x-icon">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<%@ include file="nav.jsp" %>

<div class="container">
	<c:if test="${'verified-fail' eq process }"><div class="well"><label style="color:red;">Sorry, the code to access is invalid. Contact me via harryyoon91@gmail.com</label></div></c:if>
	<c:if test="${'noauth' eq param.process }"><div class="well"><label style="color:red;">Sorry, you have to login to access the page.</label></div></c:if>
	<c:if test="${'login-fail' eq process }"><div class="well"><label style="color:red;">Sorry, ID or Password is incorrect.</label></div></c:if>
	<c:if test="${'no-verified' eq process }"><div class="well"><label style="color:red;">Please, complete your email verification.</label></div></c:if>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3>Log In</h3>
		</div>
		<div class="panel-body">
			<form:form method="post" modelAttribute="user">
				<div class="form-group">
					<label for="id">User ID:</label>
					<form:input path="id" class="form-control" minlength="4" maxlength="10" required="required"/>
				</div>
				<div class="form-group">
					<label for="pwd">Password:</label>
					<form:password path="pwd" class="form-control" minlength="4" maxlength="6" required="required"/>
				</div>
				<hr>
				<div class="pull-right">
						<button class="btn btn-primary btn-lg" type="submit">Login</button>
						<a href="register" class="btn btn-default btn-lg">Sign Up</a>
				</div>
			</form:form>
		</div>
		<div class="panel-footer text-right">
			<a href="/hr/forgotpwd">forgot your password ?</a>
		</div>
	</div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>