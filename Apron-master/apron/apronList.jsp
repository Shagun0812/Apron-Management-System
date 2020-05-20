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
<link rel="icon" href="../images/favicon.ico">
<script src="js/main.js"></script>

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
				<div class="col col-mf-9">
					<div>
						<div class="alert mb-0" style="">
							<a href="addApron">Add New apron area</a>
						</div>
						<c:if test='${not empty newApron}'>
							<div class='alert alert-success'>${newApron}</div>
						</c:if>
					</div>
					<c:if test='${not empty err}'>
						<div class='alert alert-success'>${newApron}</div>
					</c:if>
					<c:if test='${not empty msg}'>
						<div class='alert alert-success'>${msg}</div>
					</c:if>

					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th span="col">Apron Id</th>
									<th span="col">Apron status</th>
									<th span="col">Change status</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="u">
									<tr>
										<td>${u.getId()}</td>
										<td>${u.getStatus()}</td>
										<td>
											<button type="button" class="btn btn-primary"
												data-toggle="modal" data-target="#apronListModal"
												data-id="${u.getId()}" data-status="${u.getStatus()}"
												data-airline="${u.getAirlineId()}">See Details</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

				</div>
			</div>

			<div>
				<div class="modal fade" id="apronListModal" tabindex="-1"
					role="dialog" aria-labelledby="apronListModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="apronListModalLabel">Apron Area
									Details</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form>
									<div class="form-group">
										<label for="id" class="col-form-label">Apron Id:</label> <input
											type="text" class="form-control" id="id" disabled />
									</div>
									<div class="form-group">
										<label for="status" class="col-form-label">Apron
											Status:</label> <input type="text" class="form-control" id="status"
											disabled />
									</div>
									<div class="form-group" id="airlineId">
										<label for="airline" class="col-form-label">Airline
											Id:</label> <input type="text" class="form-control" id="airline"
											disabled />
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<a href="" id="editApron"><button type="button"
										class="btn btn-primary">Update Details</button></a>
							</div>
						</div>
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

	<script type="text/javascript">
		$('#apronListModal').on(
				'show.bs.modal',
				function(event) {
					var button = $(event.relatedTarget)
					var id = button.data('id')
					var status = button.data('status')
					var airlineId = button.data('airline')

					var modal = $(this)
					modal.find('.modal-title').text('Apron ' + id + ' Details')
					modal.find('.modal-body #id').val(id)
					modal.find('.modal-body #status').val(status)
					if (status == "Occupied") {
						modal.find('.modal-body #airlineId').show()
						modal.find('.modal-body #airline').val(airlineId)
					} else {
						modal.find('.modal-body #airlineId').hide()
					}

					modal.find('.modal-footer #editApron').attr("href",
							"editApron?id=" + id)
				})
	</script>

</body>
</html>
