<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="static/css/style.css">
<title>Hunt Tracker</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" >Hunt Tracker</a>
	    </div>
	     <ul class="nav navbar-nav navbar-right">
	        <li><a href="/welcome"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
	      </ul>
	  </div>
	</nav>
	<h1 class="text-center"> Welcome to Hunt Tracker!</h1>
	<form:form  class="user-form col-md-4 col-md-offset-4" action="/register" method="post" modelAttribute="user">
	<h3 class="text-center">Register New User!</h3>
	<div class="form-group">
		<form:label path="firstName">First Name</form:label>
		<form:errors class="errors" path="firstName"></form:errors>
		<form:input class="form-control" path="firstName"/>
	</div>
		<div class="form-group">
		<form:label path="email">Email</form:label>
		<form:errors class="errors" path="email"></form:errors>
		<form:input class="form-control" path="email"/>
		</div>
		<div class="form-group">
		<form:label path="password">Password</form:label>
		<form:errors class="errors" path="password"></form:errors>
		<form:input type="password" class="form-control" path="password"/>
		</div>
		<div class="form-group">
		<form:label path="conPassword">Confirm Password</form:label>
		<form:errors class="errors" path="conPassword"></form:errors>
		<form:input type="password" class="form-control" path="conPassword"/>
		</div>
		<button class="btn btn-success col-md-4 col-md-offset-4">Register</button>
			<p class="text-center">Already have an account?<a href="/welcome"> Log In</a></p>
	</form:form>
</body>
</html>