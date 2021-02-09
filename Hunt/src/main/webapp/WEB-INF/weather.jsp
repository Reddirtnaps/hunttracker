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
<link rel="stylesheet" href="static/css/style.css">
<title>Weather</title>
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
	<div class="col-md-4 col-md-offset-4">
	<h1 class="text-center">Today's Weather </h1>
	<p class="text-center"><label>Location: </label> ${ weather.name }</p>
	<p class="text-center"><label>Description: </label> ${ weather.description }</p>
	<p class="text-center"><label>Temperature: </label> ${ weather.temp }°F</p>
	<p class="text-center"><label>Wind Speed: </label> ${ weather.speed } mph</p>
	<p class="text-center"><label>Wind Direction: </label> ${ weather.dir }</p>
	<p class="text-center"><label>Pressure: </label> ${ weather.pressure } mb</p>
	</div>
	<form:form class="col-md-4 col-md-offset-5" action="/weather">
			<input placeholder="Enter City" type="text" name="city">
			<button class="btn btn-success">Submit</button>		
	</form:form>
</body>
</html>