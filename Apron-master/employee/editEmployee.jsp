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

<link rel="icon" href="../images/favicon.ico">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>

	<div class="container">

		<div>
			<jsp:include page="../header.jsp" />
		</div>

		<div>
			<div class="row">
				<div class="col col-md-3">
					<jsp:include page="../userPanel.jsp" />
				</div>
				<div class="col col-md-9">
					<form:form action="updateEmployee" method="post"
						modelAttribute="employee">
						<div class="form-group">
							<label for="id" class="form-label">Employee Id:</label>
							<div>
								<form:input path="id" class="form-control" id="id"
									readonly="true" />
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="form-label">Employee Name:</label>
							<div>
								<form:input path="name" class="form-control" id="name" />
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="form-label">Employee Email:</label>
							<div>
								<form:input path="email" class="form-control" id="email" />
							</div>
						</div>
						<div class="form-group">
							<label for="dept" class="form-label">Department:</label>
							<div>
								<form:input path="dept" class="form-control" id="dept" />
							</div>
						</div>
						<div class="form-group">
							<label for="dateOfJoining" class="form-label">Date of
								joining:</label>
							<div>
								<form:input type="date" path="dateOfJoining"
									class="form-control" id="dateOfJoining" />
							</div>
						</div>
						<div class="form-group">
							<label for="role" class="form-label">Role:</label>
							<div>
								<form:select path="role" class="form-control" id="role">
									<form:option value="General" />
									<form:option value="Data-Entry" />
									<form:option value="Admin" />
								</form:select>
							</div>
						</div>
						<div class="form-group">
							<label for="status" class="form-label">Status:</label>
							<div>
								<form:select path="status" class="form-control" id="status">
									<form:option value="Active" />
									<form:option value="Inactive" />
								</form:select>
							</div>
						</div>

						<div class="form-group">
							<button class="btn btn-secondary" type="reset">Reset</button>
							<button type="submit" class="btn btn-primary">Update</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>

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