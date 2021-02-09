<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<title>Dashboard</title>
</head>
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
	<h1 class="text-center">Welcome ${ user.firstName }</h1>
		<form:form action="/dashboard" methos="post">
			<label for="animal">Sort Animal</label>
			<select name="animal" >
				<option value=""></option>
				<option value="Waterfowl">Waterfowl</option>
				<option value="Whitetail">Whitetail</option>
				<option value="Predator">Predator</option>
			</select>
			<label for="success"></label>
			<select name="success" >
				<option value=""></option>
	  			<option value="Yes">Yes</option>
	  			<option value="No">No</option>
			</select>
			<button class="btn btn-success">Submit</button>
		</form:form>
	<table class="table table-dark table-hover">
				<thead>
					<tr>
						<th>Date</th>
						<th>Animal</th>
						<th>Temperature</th>
						<th>Wind Speed</th>
						<th>Wind Direction</th>
						<th>Pressure</th>
						<th>Successful</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ user.hunts }" var="h">
						<tr>
							<td><a href="/hunt/${ h.id }"><fmt:formatDate value="${h.date}" pattern="yyyy-MM-dd" /></a></td>
							<td>${ h.animal }</td>
							<td>${ h.temp }°F</td>
							<td>${ h.speed }mph</td>
							<td>${ h.direction }</td>
							<td>${ h.pressure }mb</td>
							<td>${ h.success }</td>
							<td><a href="/delete/${ h.id }">Delete</a></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<form action="/new">
				<button class="btn btn-success col-md-2 col-md-offset-5">Add A Hunt</button>
		</form>
<body>

</body>
</html>