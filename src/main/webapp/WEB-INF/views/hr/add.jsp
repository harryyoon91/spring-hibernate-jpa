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

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index">HR Program</a>
    </div>

    <ul class="nav navbar-nav navbar-right">
      <li><a href="changepwd"><span class="glyphicon glyphicon-wrench"></span> Change Password</a></li>
      <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span> Log out</a></li>
      <li><a href="../home/portfolio"><span class="glyphicon glyphicon-list"></span> Portfolio</a></li>
      <li><a href="../home/hireyonghak"><span class="glyphicon glyphicon-envelope"></span> Hire Yonghak</a></li>
    </ul>
  </div>
</nav>

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