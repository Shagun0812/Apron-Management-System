package com.dao;

import java.util.List;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.beans.Apron;

public class ApronDao {

	private HibernateTemplate template;

	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}
	
	@Transactional
	public void add(Apron ap) {
		template.save(ap);
	}
	
	public void getMaxID() {
		
	}

	@Transactional
	public void update(Apron ap) {
		template.update(ap);
	}
	
	public Apron getById(int id) {
		return template.get(Apron.class, id);
	}
	
	public List<Apron> getAll(){
		return template.loadAll(Apron.class);
	}
}
