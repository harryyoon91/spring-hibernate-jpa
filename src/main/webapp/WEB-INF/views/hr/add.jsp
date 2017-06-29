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
	$("#file").change(function() {
		if ($("#file").val()=="") {
			$("#submit-btn").attr("disabled", "disabled");
		} else {
			$("#submit-btn").removeAttr("disabled");
		}
	});
})
</script>
</head>
<body>
<%@ include file="nav.jsp" %>

<div class="container">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3>Add Custom Employee</h3>
			<h5>You only can insert 1 Employee to Table.</h5>
		</div>
		<div class="panel-body">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Please, Download this Excel(xlsx) file and Fill in the format.</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><a href="add/downloadform"><label class="glyphicon glyphicon-file"></label>add_employee_form.xlsx</a></td>
					</tr>
				</tbody>
			</table>
			<form:form modelAttribute="employeeform" action="/hr/add" method="post" enctype="multipart/form-data">
			<table class="table table-striped">
				<thead>
					<tr>
						<th><input id="file" name="file" type="file"/></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><button id="submit-btn" class="btn btn-success btn-lg" disabled type="submit">업로드</button></td>
					</tr>
				</tbody>
			</table>
			</form:form>
		</div>
		<div class="panel-footer text-right">
		</div>
	</div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>