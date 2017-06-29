<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    var url = location.href;
    var parameter = (url.slice(url.indexOf('?') + 1, url.length)).split('=');
    if (parameter[1]=='registered') {
    	$("#registered").css("display", "block");
    } else if (parameter[1]=='verified') {
    	$("#verified").css("display", "block");
    } else if (parameter[1]=="added") {
    	$("#added").css("display", "block");
    	$("#mainpage-btn").css("display", "inline");
    }
})
</script>
</head>
<body>
<%@ include file="nav.jsp" %>
  
<div class="container">
 <div class="panel panel-success">
		<div class="panel-heading">
			<h3>Success !</h3>
		</div>
		<div class="panel-body">
			<h4 style="color:green;display:none;" id="registered">Welcome to Yonghak Yoon's Portfolio. Please, check your email for verification.</h4>
			<h4 style="color:green;display:none;" id="verified">You can login now! You just completed verification.</h4>
			<h4 style="color:green;display:none;" id="added">The form has been successfully submitted.</h4>
			<a style="display:none;" id="mainpage-btn" href="/hr/hr" class="btn btn-success pull-right">Go to main page</a>
		</div>
	</div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>