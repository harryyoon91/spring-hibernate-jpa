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

</script>
</head>
<body>
<%@ include file="nav.jsp" %>
  
<div class="container">
 <div class="panel panel-danger">
		<div class="panel-heading">
			<h3>Error Page</h3>
		</div>
		<div class="panel-body">
			This error was caused : : <c:out value="${message }"></c:out>.
		</div>
	</div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>