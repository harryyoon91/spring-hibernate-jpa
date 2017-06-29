<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<nav class="navbar navbar-inverse">
  <div class="container">
    <div class="navbar-header">
      <a class="navbar-brand" href="hr">HR Program</a>
    </div>

    <ul class="nav navbar-nav navbar-right">
      	<c:choose>
			<c:when test = "${empty sessionScope.LOGINED_USER}">
			      <li><a href="/hr/register"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			      <li><a href="/hr/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
			</c:when>
			<c:otherwise>
			      <li><a href="/hr/changepwd"><span class="glyphicon glyphicon-wrench"></span> Change Password</a></li>
			      <li><a href="/hr/logout"><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
			</c:otherwise>
      	</c:choose>
      <li><a href="/../home/portfolio"><span class="glyphicon glyphicon-list"></span> Portfolio</a></li>
      <li><a href="/../home/hireyonghak"><span class="glyphicon glyphicon-envelope"></span> Hire Yonghak</a></li>
    </ul>
  </div>
</nav>