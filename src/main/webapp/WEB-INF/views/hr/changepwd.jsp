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
$(function() {
	var regpwd = /^[A-Za-z0-9+]*$/;

	// using ajax to check current pwd is correct
	$("#curr-pwd").keyup(function() {
		$("#curr-pwd-incorrect").css("display", "none");
		$("#curr-pwd-correct").css("display", "none");
		var pwd = $(this).val();

		$.ajax({
			url:"/hr/changepwd/currentpwdcheck",
			type:"POST",
			data:{'pwd':pwd},
			dataType:"json",
			success:function(data) {
				if (!data) {
					$("#curr-pwd-incorrect").css("display", "block");
				} else {
					$("#curr-pwd-correct").css("display", "block");
				}
			}
		})
	});
	// new pwd checker
	$("#new-pwd").keyup(function() {
		var pwd = $(this).val();
		if (regpwd.test(pwd) && pwd.length>3) {
			$("#new-pwd-incorrect").css("display", "none");
		} else {
			$("#new-pwd-incorrect").css("display", "block");
		}
	});
	// new email confirmation
	$("#new-pwd-confirm").keyup(function() {
		var pwd = $("#new-pwd").val();
		var pwdconfirm = $(this).val();
		if (pwd===pwdconfirm) {
			$("#new-pwd-confirmation").css("display", "none");
			$("#new-pwd-confirmed").css("display", "block");
		} else {
			$("#new-pwd-confirmation").css("display", "block");
			$("#new-pwd-confirmed").css("display", "none");
		}
	});
	// activate submit button
	$(".container").keyup(function() {
		if ($("#new-pwd-confirmed").css("display") == "block" && $("#curr-pwd-correct").css("display") == "block") {
			$("#submit-btn").removeAttr("disabled");
		} else {
			$("#submit-btn").attr("disabled");
		}
	});
})
</script>
</head>
<body>
<%@ include file="nav.jsp" %>

<div class="container">
	<form method="post" action="changepwd">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3>Change Password</h3>
		</div>
		<div class="panel-body">
			<c:if test="${'pwd-changed' eq process }"><div class="well"><label style="color:green;">Password has been changed !</label></div></c:if>
			<table class="table table-striped">
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<thead>
					<tr>
						<th>
							Current Password
							<br>
							<label id="curr-pwd-incorrect" style="color:red;display:none;">Incorrect Password.</label>
							<label id="curr-pwd-correct" style="color:green;display:none;">Correct Password !</label>
						</th>
						<th>
							<input class="form-control" type="password" id="curr-pwd"/>
						</th>
					</tr>
					<tr>
						<th>
							New Password
							<br>
							<small>(alphabet and number are available, 4-6 characters)</small>
							<br>
							<label id="new-pwd-incorrect" style="color:red;display:none;">Invalid Password.</label>
						</th>
						<th>
							<input class="form-control" type="password" id="new-pwd" name="new-pwd"/>
						</th>
					</tr>
					<tr>
						<th>
							New Password Confirmation
							<br>
							<label id="new-pwd-confirmation" style="color:red;display:none;">Password is not matched.</label>
							<label id="new-pwd-confirmed" style="color:green;display:none;">Password is matched.</label>
						</th>
						<th>
							<input class="form-control" type="password" id="new-pwd-confirm"/>
						</th>
					</tr>
				</thead>
			</table>
		</div>
		<div class="panel-footer text-right">
			<button class="btn btn-success" id="submit-btn" disabled>Submit</button>
		</div>
	</div>
	</form>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>