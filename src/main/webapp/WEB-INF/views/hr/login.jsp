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

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index">HR Program</a>
    </div>

    <ul class="nav navbar-nav navbar-right">
      <li><a href="register"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      <li><a href="../home/portfolio"><span class="glyphicon glyphicon-list"></span> Portfolio</a></li>
      <li><a href="../home/hireyonghak"><span class="glyphicon glyphicon-envelope"></span> Hire Yonghak</a></li>
    </ul>
  </div>
</nav>

<div class="container">
	<c:if test="${'registered' eq process }"><div class="well"><label style="color:green;">Welcome to Yonghak Yoon's Portfolio. Please, check your email for verification.</label></div></c:if>
	<c:if test="${'verified' eq process }"><div class="well"><label style="color:green;">You can login now! You just completed verification!</label></div></c:if>
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
			<a href="forgotpwd">forgot your password ?</a>
		</div>
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