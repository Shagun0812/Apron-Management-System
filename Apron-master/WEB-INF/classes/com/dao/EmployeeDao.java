package com.dao;

import java.util.List;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.beans.Employee;

public class EmployeeDao {

	private HibernateTemplate template;

	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}

	@Transactional
	public void save(Employee emp) {
		template.save(emp);
	}

	@Transactional
	public void saveOrUpdate(Employee e) {
		template.saveOrUpdate(e);
	}

	public Employee getById(int id) {
		return template.get(Employee.class, id);
	}

	public List<Employee> getAll() {
		return template.loadAll(Employee.class);
	}
}