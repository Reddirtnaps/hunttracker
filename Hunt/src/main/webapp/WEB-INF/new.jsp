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
	<form:form  action="/autofill/new" method="get">
		<button class="btn btn-success col-md-2 col-md-offset-5" id="autofill">AutoFill Weather</button>	
	</form:form>
	<form:form  class="user-form col-md-4 col-md-offset-4" action="/new" method="post" modelAttribute="hunt">
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
		<form:label path="temp">Temperature</form:label>
		<form:errors class="errors" path="temp"></form:errors>
		<form:input  class="form-control" path="temp" placeholder="°F"/>
		</div>
		<div class="form-group">
		<form:label path="speed">Wind Speed</form:label>
		<form:errors class="errors" path="speed"></form:errors>
		<form:input class="form-control" path="speed" placeholder="mph" />
		</div>
		<div class="form-group">
		<form:label path="direction">Wind Direction</form:label>
		<form:errors class="errors" path="direction"></form:errors>
		<form:select  class="form-control" path="direction">
			<form:option value="N">N</form:option>
			<form:option value="NW">NW</form:option>
			<form:option value="W">W</form:option>
			<form:option value="SW">SW</form:option>
			<form:option value="S">S</form:option>
			<form:option value="SE">SE</form:option>
			<form:option value="E">E</form:option>
			<form:option value="NE">NE</form:option>
		</form:select>
	</div>
		<div class="form-group">
		<form:label path="pressure">Barometric Pressure</form:label>
		<form:errors class="errors" path="pressure"></form:errors>
		<form:input  type="number" class="form-control" path="pressure" placeholder="mb"/>
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
		<form:textarea class="form-control" path="details" />
		</div>
		<button class="btn btn-success col-md-4 col-md-offset-4">Submit</button>
	</form:form>
</body>
</html>