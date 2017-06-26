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

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function() {
	//coloring orderBy-sort button
	var orderbysort = $("#orderBy").val()+"-"+$("#sort").val();
	$.each($("tr th a label"), function( index, value ) {
		if (orderbysort==value.id) {
			$(this).parent().attr("class", "btn btn-primary btn-xs");
		}
	});
	
	// when ui-form is changed, pass datas to search-form.
	//display
	$("#ui-display").change(function() {
		$("#display").val($("#ui-display").val());
		$("#pageNo").val("1");
		$("#search-form").submit();
	});
	//minSalary
	$("#ui-minsalary").change(function() {
		$("#minSalary").val($("#ui-minsalary").val());
	});
	//maxSalary
	$("#ui-maxsalary").change(function() {
		$("#maxSalary").val($("#ui-maxsalary").val());
	});
	//opt
	$("#ui-opt").change(function() {
		$("#opt").val($("#ui-opt").val());
		//preventing format error in search
		if ("last_name" == $("#ui-opt").val() || "job_id" == $("#ui-opt").val()) {
			$("#ui-keyword").attr("type", "text");
		} else if ("employee_id" == $("#ui-opt").val()) {
			$("#ui-keyword").attr("type", "number");			
		}
	});
	//keyword
	$("#ui-keyword").change(function() {
		$("#keyword").val($("#ui-keyword").val());
		$("#search-form").submit();
	});
	
	// when sort button is clicked, pass datas to search-form.
	// sort buttons
	$("tr th a").click(function(e) {
		e.preventDefault();
		var orderBySort = $(this).children().attr("id").split("-");
		$("#orderBy").val(orderBySort[0]);
		$("#sort").val(orderBySort[1]);
		$("#pageNo").val("1");
		$("#search-form").submit();
	});
	
	// when search button is clicked, pass datas to search-form.
	// search button
	$("#search-icon").click(function(e) {
		e.preventDefault();
		$("#search-form").submit();		
	});
	
	// when pagination is clicked, pass datas to search-form
	// paginations
	$("#pagination li a").click(function(e) {
		e.preventDefault();
		var pno = $(this).attr("id").replace("page-", "");
		$("#pageNo").val(pno);;
		$("#search-form").submit();	
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
      	<c:choose>
			<c:when test = "${empty sessionScope.LOGINED_USER}">
			      <li><a href="register"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			      <li><a href="login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
			</c:when>
			<c:otherwise>
			      <li><a href="changepwd"><span class="glyphicon glyphicon-wrench"></span> Change Password</a></li>
			      <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
			</c:otherwise>
      	</c:choose>
      <li><a href="../home/portfolio"><span class="glyphicon glyphicon-list"></span> Portfolio</a></li>
      <li><a href="../home/hireyonghak"><span class="glyphicon glyphicon-envelope"></span> Hire Yonghak</a></li>
    </ul>
  </div>
</nav>
  
<div class="container">
  <h3>Basic CRUD</h3>
  <p>Schema is from Oracle HR.</p>
	<form id="ui-searchform">
	  <div class="well" id="searchform">
		<label>Display</label>
		<select id="ui-display">
			<option ${searchform.display eq 10 ? 'selected=selected' : '' }>10</option>
			<option ${searchform.display eq 20 ? 'selected=selected' : '' }>20</option>
			<option ${searchform.display eq 50 ? 'selected=selected' : '' }>50</option>
		</select>
		<label style="padding-left:30px">Min. Salary</label>
		<input type="number" id="ui-minsalary" name="minSalary" value="${empty searchform.minSalary ? '' : searchform.minSalary}">
		<label style="padding-left:5px">Max. Salary</label>
		<input type="number" id="ui-maxsalary" name="maxSalary" value="${empty searchform.minSalary ? '' : searchform.maxSalary}">
		<label style="padding-left:30px">Search</label>
		<select id="ui-opt">
			<option value=""></option>
			<option value="employee_id" ${searchform.opt eq 'employee_id' ? 'selected=selected' : '' }>Employee ID</option>
			<option value="last_name" ${searchform.opt eq 'last_name' ? 'selected=selected' : '' }>Last Name</option>
			<option value="job_id" ${searchform.opt eq 'job_id' ? 'selected=selected' : '' }>Job ID</option>
		</select>
		<input type="text" id="ui-keyword" value="${not empty searchform.keyword ? searchform.keyword : ''}"><a href="search" type="submit"><label id="search-icon" style="padding-left:10px" class="glyphicon glyphicon-search"></label></a>
	  </div>
  </form>
  <table class="table table-striped">
  	<colgroup>
  		<col width="9%">
  		<col width="10%">
  		<col width="10%">
  		<col width="11%">
  		<col width="11%">
  		<col width="9%">
  		<col width="10%">
  		<col width="10%">
  		<col width="10%">
  		<col width="5%">
  		<col width="5%">
  	</colgroup>
  	<thead>
  		<tr>
  			<th>ID# 
  				<a href="" class="btn btn-default btn-xs">
  					<label id="employee_id-asc" class="glyphicon glyphicon-sort-by-order"></label>
  				</a>
  				<a href="" class="btn btn-default btn-xs">
  					<label id="employee_id-desc" class="glyphicon glyphicon-sort-by-order-alt"></label>
  				</a>
  			</th>
  			<th>Last Name</th>
  			<th>First Name</th>
  			<th>Job ID 
  				<a href="" class="btn btn-default btn-xs">
  					<label id="job_id-asc" class="glyphicon glyphicon-sort-by-alphabet"></label>
  				</a>
  				<a href="" class="btn btn-default btn-xs">
  					<label id="job_id-desc" class="glyphicon glyphicon-sort-by-alphabet-alt"></label>
  				</a>
  			</th>
  			<th>Salary 
  				<a href="" class="btn btn-default btn-xs">
  					<label id="salary-asc" class="glyphicon glyphicon-sort-by-order"></label>
  				</a>
  				<a href="" class="btn btn-default btn-xs">
  					<label id="salary-desc" class="glyphicon glyphicon-sort-by-order-alt"></label>
  				</a>
  			</th>
  			<th>Manager ID</th>
  			<th>Dept# 
  				<a href="" class="btn btn-default btn-xs">
  					<label id="department_id-asc" class="glyphicon glyphicon-sort-by-alphabet"></label>
  				</a>
  				<a href="" class="btn btn-default btn-xs">
  					<label id="department_id-desc" class="glyphicon glyphicon-sort-by-alphabet-alt"></label>
  				</a>
  			</th>
  			<th>Dept. Name</th>
  			<th>City 
  				<a href="" class="btn btn-default btn-xs">
  					<label id="location.city-asc" class="glyphicon glyphicon-sort-by-alphabet"></label>
  				</a>
  				<a href="" class="btn btn-default btn-xs">
  					<label id="location.city-desc" class="glyphicon glyphicon-sort-by-alphabet-alt"></label>
  				</a>
  			</th>
  			<th>Country</th>
  			<th>Delete</th>
  		</tr>
  	</thead>
  	<tbody>
  		<c:forEach items="${employeeList }" var="item">
  			<tr>
  				<td><c:out value="${item.employee_id }"/></td>
  				<td><c:out value="${item.last_name }"/></td>
  				<td><c:out value="${item.first_name }"/></td>
  				<td><c:out value="${item.job_id }"/></td>
  				<td><fmt:formatNumber type="currency" pattern="#,###.##" value="${item.salary }"></fmt:formatNumber></td>
  				<td><c:out value="${item.manager_id }"/></td>
  				<td><c:out value="${item.department_id }"/></td>
  				<td><c:out value="${item.department.department_name }"/></td>
  				<td><c:out value="${item.department.location.city }"/></td>
  				<td><c:out value="${item.department.location.country_id }"/></td>
  				<td>
  					<c:choose>
  						<c:when test="${not empty sessionScope.LOGINED_USER.user_no }" >
  							<c:if test="${item.user_no eq sessionScope.LOGINED_USER.user_no }">
								<a href="delete?empid=${item.employee_id }"><label class="glyphicon glyphicon-trash"></label></a>
  							</c:if>
  						</c:when>
  						<c:otherwise>
  						</c:otherwise>
  					</c:choose>
  				</td>
  			</tr>
  		</c:forEach>
  	</tbody>
	</table>
	<div class="pull-right">
		<a href="add" class="btn btn-success" >Add Employee</a>
	</div>
	<div class="row text-center">
 		<c:set var="link" value="index"/>
		<%@ include file="paging.jsp" %>
	</div>
	<form id="search-form" method="post" action="index" >
		<input type="hidden" id="display" name="display" value="${searchform.display }"/>
		<input type="hidden" id="pageNo" name="pageNo" value="${pagination.currentPage }"/>
		<input type="hidden" id="opt" name="opt" value="${empty searchform.opt ? '' : searchform.opt}"/>
		<input type="hidden" id="minSalary" name="minSalary" value="${empty searchform.minSalary ? '' : searchform.minSalary}"/>
		<input type="hidden" id="maxSalary" name="maxSalary" value="${empty searchform.maxSalary ? '' : searchform.maxSalary}"/>
		<input type="hidden" id="sort" name="sort" value="${empty searchform.sort ? '' : searchform.sort }"/>
		<input type="hidden" id="orderBy" name="orderBy" value="${empty searchform.orderBy ? '' : searchform.orderBy}"/>
		<input type="hidden" id="keyword" name="keyword" value="${empty searchform.keyword ? '' : searchform.keyword}"/>
	</form>
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