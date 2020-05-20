<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.*,com.beans.*,com.dao.*"%>
<c:set var="url" value="${pageContext.request.contextPath}" />
<div>
	<nav class="navbar navbar-expand-lg navbar-light bg-light mb-2">
		<a href="" class="navbar-brand"> <img
			src="${url}/images/aai-logo1_2_0.png" width="50" height="30"
			class="d-inline-block align-top" alt=""> Airport Authority of
			India
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-items"><a href="/Apron/index" id="home"
					class="nav-link">Home</a></li>
				<li class="nav-items"><a href="/Apron/apronList"
					class="nav-link">Apron List</a></li>
				<li class="nav-items"><a href="/Apron/employee/employeeForm"
					class="nav-link">Add Employee</a></li>
				<li class="nav-items"><a href="/Apron/employee/employeeList"
					class="nav-link">Employee List</a></li>
			</ul>
		</div>
	</nav>
</div>
