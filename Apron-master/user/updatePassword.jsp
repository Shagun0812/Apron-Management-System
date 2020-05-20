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

<link rel="icon"
	href="${pageContext.request.contextPath}/images/favicon.ico">

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
				<div class="col col-md-4">
					<jsp:include page="../userPanel.jsp" />
				</div>
				<div class="col col-md-9">
					<div>
						<c:if test="${not empty err}">
							<div class="alert alert-danger">${err}</div>
						</c:if>
						<c:if test="${not empty msg}">
							<div class="alert alert-success">${msg}</div>
						</c:if>
					</div>
					<div>
						<form action="updatePassword" method="post">
							<div class="form-group">
								<input type="hidden" name="id" id="id" value="${user.getId()}">
							</div>
							<div class="form-group">
								<label for="oldPassword" class="form-label">Enter Old
									Password:</label>
								<div>
									<input type="password" name="oldPassword" id="oldPassword"
										class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label for="newPassword" class="form-label">Enter New
									Password:</label>
								<div>
									<input type="password" name="newPassword" id="newPassword"
										class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label for="reNewPassword" class="form-label">Enter Old
									Password:</label>
								<div>
									<input type="password" name="reNewPassword" id="reNewPassword"
										class="form-control" />
								</div>
								<div style="">Please Re-enter the same password.</div>
								<script type="text/javascript">
									var newPass = document
											.getElementById("newPassword");
									var reNewPass = document
											.getElementById("reNewPassword");
									var passValid = document
											.getElementById("passValid");
									if (newPass.value() != reNewPass.value()) {
										passValid.style.display = "none";
									}
								</script>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-primary">Update</button>
							</div>
						</form>
					</div>

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