<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.*,com.beans.*,com.dao.*"%>
<!DOCTYPE html>
<html>
<head>
<title>AAI - Apron Management System</title>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="css/style.css">
<link rel="icon" href="images/favicon.ico">
<script src="js/main.js"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link rel="stylesheet" href="css/all.min.css">
</head>
<body>

	<div class="container">
		<div>
			<div>
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<a href="" class="navbar-brand"> <img
						src="images/aai-logo1_2_0.png" width="50" height="30"
						class="d-inline-block align-top" alt=""> Airport Authority
						of India
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarNav" aria-controls="navbarNav"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarNav">
						<ul class="navbar-nav">
							<li class="nav-items"><a href="index" id="home"
								class="nav-link">Home</a></li>
							<li class="=" nav-items><a href="#" id="airdb"
								class="nav-link">Airline Database</a></li>
							<li class="nav-items"><a href="#" id="airport"
								class="nav-link">Airport</a></li>
							<li class="nav-items"><a href="#" id="schedule"
								class="nav-link">Schedule</a></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<section id="sec_home" class="container mt-2">
			<div>
				<c:if test='${not empty err}'>
					<div class='alert alert-success'>${newApron}</div>
				</c:if>
				<c:if test='${not empty msg}'>
					<div class='alert alert-success'>${msg}</div>
				</c:if>

			</div>
			<div class="row">
				<div class="col col-md-8"></div>
				<div class="col col-md-4">
					<jsp:include page="login.jsp" />
				</div>
			</div>
		</section>
		<section id="sec_airdb" class="container">
			<h1>Airline Database</h1>
			<div class="table-responsive">
				<table id="airdb_table" class="table">
					<tr>
						<th>Name</th>
						<th>Type</th>
						<th>Status</th>
						<th>Founding</th>
						<th>Country Name</th>
					</tr>
				</table>
			</div>
		</section>
		<section id="sec_airport" class="container">
			<h1>Airport Database</h1>
			<div class="table-responsive">
				<table id="airport_table" class="table">
					<tr>
						<th>Name</th>
						<th>Timezone</th>
						<th>Country</th>
						<th style="text-align: center;">View on Map</th>
					</tr>
				</table>
			</div>
		</section>
		<section id="sec_schedule" class="container">
			<h1>Schedule Airline</h1>
			<div>
				<ul class="nav nav-pills nav-fills nav-justified" id="myTab"
					role="tablist">
					<li class="nav-item"><a class="nav-link active"
						id="departure-tab" data-toggle="tab" href="#departure" role="tab"
						aria-controls="departure" aria-selected="true">Departure</a></li>
					<li class="nav-item"><a class="nav-link" id="arrival-tab"
						data-toggle="tab" href="#arrival" role="tab"
						aria-controls="arrival" aria-selected="false">Arrival</a></li>
				</ul>
			</div>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="departure"
					role="tabpanel" aria-labelledby="departure-tab">
					<h2>Departure</h2>
					<div class="table-responsive">
						<table id="departTable" class="table">
							<tr>
								<th span="col">Airline</th>
								<th span="col">To</th>
								<th span="col">Depart</th>
								<th span="col">Arrive</th>
								<th span="col">Status</th>
							</tr>
						</table>
					</div>
				</div>
				<div class="tab-pane fade" id="arrival" role="tabpanel"
					aria-labelledby="arrival-tab">
					<h2>Arrival</h2>
					<div class="table-responsive">
						<table id="arriveTable" class="table">
							<tr>
								<th span="col">Airline</th>
								<th span="col">To</th>
								<th span="col">Depart</th>
								<th span="col">Arrive</th>
								<th span="col">Status</th>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</section>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>