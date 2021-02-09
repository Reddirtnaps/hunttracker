<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="static/css/style.css">
<title>View Hunt</title>
</head>
<body>
<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" >Hunt Tracker</a>
	    </div>
      <ul class="nav navbar-nav">
        <li class="active"><a href="/dashboard">Home</a></li>
        <li><a href="/new">New Hunt</a></li>
        <li><a href="/weather">Weather</a></li>
      </ul>
	     <ul class="nav navbar-nav navbar-right">
	        <li><a href="/logout"><span class="glyphicon glyphicon-log-out"></span> Log Out </a></li>
	      </ul>
	  </div>
	</nav>
	<h1 class="text-center">View Hunt</h1>
	<p class="text-center"><label>Animal:</label> ${ hunt.animal }</p>
	<p class="text-center"><label>Date:</label> <fmt:formatDate value="${hunt.date}" pattern="yyyy-MM-dd" /></p>
	<p class="text-center"><label>Temperature:</label> ${ hunt.temp }°F</p>
	<p class="text-center"><label>Wind Direction:</label> ${ hunt.direction }</p>
	<p class="text-center"><label>Wind Speed:</label> ${ hunt.speed }mph </p>
	<p class="text-center"><label>Pressure:</label> ${ hunt.pressure}mb</p>
	<p class="text-center"><label>Successful:</label> ${ hunt.success }</p>
	<p class="text-center"><label>Hunt Details:</label> ${ hunt.details }</p>
	<p class="text-center"><a href="/delete/${hunt.id}" >Delete</a></p>
</body>
</html>