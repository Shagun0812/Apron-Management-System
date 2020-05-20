<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.*,com.beans.*,com.dao.*"%>
<c:set var="url" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div>
		<ul class="nav flex-column">
			<li class="nav-item">Hello, ${user.getName()}</li>
			<li class="nav-item"><a
				href="${url}/employee/editEmployee?id=${user.getId()}"
				clas="nav-link">Update Profile</a></li>
			<li class="nav-item"><a href="${url}/user/updatePassword"
				clas="nav-link">Change Password</a></li>
			<li class="nav-item"><a href="${url}/logout" clas="nav-link">Logout</a>
			</li>
		</ul>

	</div>

</body>
</html>