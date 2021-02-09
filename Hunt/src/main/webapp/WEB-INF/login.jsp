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
<title>Login</title>
</head>
<body>
<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" >Hunt Tracker</a>
	    </div>
	  </div>
	</nav>
<form:form class="user-form col-md-4 col-md-offset-4" action="/login" method="POST">
<h3 class="text-center">Login to Hunt Tracker</h3>
	<p>${ loginError }</p>
	<div class="form-group">
		<label for="theEmail">Email</label>
		<input type="text" name="theEmail" class="form-control">
		<label for="thePassword">Password</label>
		<input type="password" name="thePassword" class="form-control">
	</div>
	<div class="form-group">	
	<button class="btn btn-success col-md-4 col-md-offset-4">Login</button>
	</div>
	</form:form>
	
</body>
</html>