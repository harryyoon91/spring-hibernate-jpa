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
	// email-sender
	$("#submit-btn").click(function() {
		$("#mail-sent-msg").css("display", "none");
		$("#mail-fail-msg").css("display", "none");
		var id = $("#id").val();
		var email = $("#email").val();

		$.ajax({
			url:"/hr/forgotpwd/temporarypwd",
			type:"GET",
			data:{'id':id, 'email':email},
			dataType:"json",
			success:function(data) {
				$("#id").val("");
				$("#email").val("");
				if (data) {
					$("#mail-sent-msg").css("display", "block");
				} else if (!data) {
					$("#mail-fail-msg").css("display", "block");
				}
			}
		})
	});
})
</script>
</head>
<body>
<%@ include file="nav.jsp" %>

<div class="container">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3>Temporary Password</h3>
		</div>
		<div class="panel-body">
			<div class="well" id="mail-sent-msg" style="color:green;display:none;"><label>Temporary Password has been sent to your email !</label></div>
			<div class="well" id="mail-fail-msg" style="color:red;display:none;"><label>ID or Email is Invalid !</label></div>
			<table class="table table-striped">
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<thead>
					<tr>
						<th>
							ID
						</th>
						<th>
							<input class="form-control" type="text" id="id"/>
						</th>
					</tr>
					<tr>
						<th>
							Email
						</th>
						<th>
							<input class="form-control" type="email" id="email"/>
						</th>
					</tr>
				</thead>
			</table>
		</div>
		<div class="panel-footer text-right">
			<button class="btn btn-success" id="submit-btn">Submit</button>
		</div>
	</div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>