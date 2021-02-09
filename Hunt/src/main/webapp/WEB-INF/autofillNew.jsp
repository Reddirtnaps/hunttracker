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
<title>New Hunt</title>
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
	<h3 class="text-center">Enter new hunt!</h3>
	<form:form  class="user-form col-md-4 col-md-offset-4" action="/autofill" method="post" modelAttribute="hunt">
	<div class="form-group">
		<form:hidden value="${ userId }" path="hunter"/>
		<form:label path="animal">Animal</form:label>
		<form:errors class="errors" path="animal"></form:errors>
		<form:select class="form-control" path="animal">
			<form:option value="Waterfowl">Waterfowl</form:option>
            <form:option value="Whitetail">Whitetail</form:option>
  			<form:option value="Predator">Predator</form:option>
		</form:select>
	</div>
		<div class="form-group">
		<form:label path="date">Date</form:label>
		<form:errors class="errors" path="date"></form:errors>
		<form:input type="date" class="form-control" path="date" />
		</div>
		<div class="form-group">
		<form:errors class="errors" path="temp"></form:errors>
		<form:input value="${ weather.temp }" type="hidden" class="form-control" path="temp"/>
		</div>
		<div class="form-group">
		<form:errors class="errors" path="speed"></form:errors>
		<form:input value="${ weather.speed }" type="hidden" class="form-control" path="speed" />
		</div>
		<div class="form-group">
		<form:errors class="errors" path="direction"></form:errors>
		<form:input value="${ weather.dir }" type="hidden" class="form-control" path="direction"/>
	</div>
		<div class="form-group">
		<form:errors class="errors" path="pressure"></form:errors>
		<form:input value="${ weather.pressure }" type="hidden" class="form-control" path="pressure"/>
		</div>
		<div class="form-group">
		<form:label path="success">Successful</form:label>
		<form:errors class="errors" path="success"></form:errors>
		<form:select  class="form-control" path="success">
			<form:option value="Yes">Yes</form:option>
			<form:option value="No">No</form:option>
		</form:select>
		</div>
		<div class="form-group">
		<form:label path="details">Details of the hunt</form:label>
		<form:errors class="errors" path="details"></form:errors>
		<form:textarea class="form-control" path="details"/>
		</div>
		<button class="btn btn-success col-md-4 col-md-offset-4">Submit</button>
	</form:form>
</body>
</html>