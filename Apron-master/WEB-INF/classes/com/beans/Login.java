package com.beans;

public class Login extends Employee {

	private String username;
	private String password;
	
	public Login() {
		
	}
	
	public Login(Login log) {
		super.setId(log.getId());
		this.setName(log.getName());
		this.setEmail(log.getEmail());
		this.setDept(log.getDept());
		this.setDateOfJoining(log.getDateOfJoining());
		this.setRole(log.getRole());
		this.setStatus(log.getStatus());
		this.username = log.getUsername();
		this.password = log.getPassword();
	}
	
	public Login(Employee emp) {
		super(emp);
		this.username = emp.getEmail();
		this.password = emp.getName().toLowerCase()+emp.getId();
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
