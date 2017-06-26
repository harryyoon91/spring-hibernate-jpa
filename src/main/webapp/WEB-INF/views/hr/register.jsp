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
$(function() {
	// check id duplication Using ajax
	$("#id-checker").click(function(e) {
		e.preventDefault();
		$("#id-duplication-true").css("display", "none");
		$("#id-duplication-false").css("display", "none");
		var userid = $("#id").val();

		$.ajax({
			url:"/hr/register/idduplicationcheck",
			type:"GET",
			data:{'id':userid},
			dataType:"json",
			success:function(data) {
				if (!data) {
					$("#id-duplication-false").css("display", "block");
				} else {
					$("#id-duplication-true").css("display", "block");
				}
			}
		})
	});
	
	// check email duplication Using ajax
	$("#email-checker").click(function(e) {
		e.preventDefault();
		$("#email-duplication-true").css("display", "none");
		$("#email-duplication-false").css("display", "none");
		var useremail = $("#email").val();

		$.ajax({
			url:"/hr/register/emailduplicationcheck",
			type:"GET",
			data:{'email':useremail},
			dataType:"json",
			success:function(data) {
				if (!data) {
					$("#email-duplication-false").css("display", "block");
				} else {
					$("#email-duplication-true").css("display", "block");
				}
			}
		})
	});
	
	// check input types
		var regemail = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		var regid = /^[A-Za-z0-9+]*$/;	
		var regpwd = /^[A-Za-z0-9+]*$/;
	// check id character type
	$("#id").keyup(function() {
		var id = $(this).val();
		if (regid.test(id) && id.length>3) {
			$("#id-err").css("display", "none");
			$("#id-checker").removeAttr("disabled");
		} else {
			$("#id-err").css("display", "block");
			$("#id-checker").attr("disabled", "disabled");
		}
	});
	// check pwd character type
	$("#pwd").keyup(function() {
		var pwd = $(this).val();
		if (regpwd.test(pwd) && pwd.length>3) {
			$("#pwd-err").css("display", "none");
		} else {
			$("#pwd-err").css("display", "block");
		}
	});
	// check email character type
	$("#email").keyup(function() {
		var email = $(this).val();
		if (regemail.test(email)) {
			$("#email-err").css("display", "none");
			$("#email-checker").removeAttr("disabled");
		} else {
			$("#email-err").css("display", "block");
			$("#email-checker").attr("disabled", "disabled");
		}
	});
	// matching pwd and pwd-confirm
	$("#pwdconfirm").keyup(function() {
		var pwd = $("#pwd").val();
		var pwdconfirm = $(this).val();
		if (pwd===pwdconfirm) {
			$("#pwd-confirm").css("display", "none");
		} else {
			$("#pwd-confirm").css("display", "block");
		}
	});
	// activate submit button
	$(".container").keyup(function() {
		if (regid.test($("#id").val()) && regpwd.test($("#pwd").val()) && regemail.test($("#email").val()) && $("#pwd").val()==$("#pwdconfirm").val()) {
			$("#submit-btn").removeAttr("disabled");
		} else {
			$("#submit-btn").attr("disabled");
		}
	});
	
	// submit-btn
	$("#submit-btn").click(function(e) {
		e.preventDefault();
		$('#duplicate-check').css("display", "none");
		var idcheck = $("#id-duplication-false").css("display");
		var emailcheck = $("#email-duplication-false").css("display");
		if ('block'==idcheck && 'block'==emailcheck) {
			$("#register-form").submit();
		} else {
			$('#duplicate-check').css("display", "block");
		}
		
	});
})
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
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3>Register</h3>
		</div>
		<div class="panel-body">
			<form:form method="post" modelAttribute="user" id="register-form">
				<div class="form-group">
					<label for="id">User ID </label><small>(alphabet and number are available, 4-10 characters)</small>
					<form:input path="id" id="id" class="form-control" minlength="4" maxlength="10" required="required"/>
				</div>
				<button class="btn btn-warning btn-xs" id="id-checker" style="margin-bottom:20px;display:inline;" disabled>Check ID Duplication</button>
				<label id="id-duplication-true" style="color:red;display:none">ID is already exist, try something else</label>
				<label id="id-duplication-false" style="color:green;display:none">You can use this ID !</label>
				<br>
				<div class="form-group">
					<label for="pwd">Password</label><small>(alphabet and number are available, 4-6 characters)</small>
					<form:password path="pwd" id="pwd" class="form-control" minlength="4" maxlength="6" required="required"/>
				</div>
				<div class="form-group">
					<label for="pwdconfirm">Password-confirmation</label>
					<input name="pwdconfirm" id="pwdconfirm" type="password" class="form-control" min="4" maxlength="6" required="required"/>
				</div>
				<br>
				<div class="form-group">
					<label for="pwd">Email </label><small>(verifying mail will be sent to this address)</small>
					<form:input path="email" id="email" class="form-control" minlength="7" maxlength="30" required="required"/>
				</div>
				<button class="btn btn-warning btn-xs" id="email-checker" style="margin-bottom:20px;display:inline;" disabled>Check Email is already using</button>
					<label id="email-duplication-true" style="color:red;display:none">Email is already using, try something else</label>
					<label id="email-duplication-false" style="color:green;display:none">You can use this email !</label>
				<br>
				<hr>
				<div class="pull-right">
					<button class="btn btn-primary btn-lg" id="submit-btn" disabled>Submit</button>
					<button class="btn btn-default btn-lg" type="reset">Reset</button>
				</div>
			</form:form>
			<label id="id-err" style="color:red;display:none">Invalid ID format.</label>
			<label id="pwd-err" style="color:red;display:none">Invalid Password format.</label>
			<label id="pwd-confirm" style="color:red;display:none">Password is not matching.</label>
			<label id="email-err" style="color:red;display:none">Invalid Email format.</label>
			<label id="duplicate-check" style="color:red;display:none">You have to check duplication of 'ID' & 'Email'.</label>
		</div>
		<div class="panel-footer text-right">
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