package com.beans;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Employee {

	private int id;
	private String name;
	private String email;
	private String dept;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dateOfJoining;
	private String role;
	private String status;
	
	public Employee() {
		
	}
	
	public Employee(Employee emp) {
		this.id = emp.getId();
		this.name = emp.getName();
		this.email = emp.getEmail();
		this.dept = emp.getDept();
		this.dateOfJoining = emp.getDateOfJoining();
		this.role = emp.getRole();
		this.status = emp.getStatus();
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public Date getDateOfJoining() {
		return dateOfJoining;
	}
	public void setDateOfJoining(Date dateOfJoining) {
		this.dateOfJoining = dateOfJoining;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
