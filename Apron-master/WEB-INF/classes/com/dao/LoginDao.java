package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.beans.Employee;
import com.beans.Login;

public class LoginDao {
	private HibernateTemplate template;

	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}
	
	@SuppressWarnings("unchecked")
	public boolean validateUser(Login u) {
		boolean isValid=false;
		String query="from Login log where log.username= :username and log.password= :password";
		Session session = null;
		try {
			session = template.getSessionFactory().openSession();
			session.beginTransaction();
			Query<Login> q = session.createQuery(query);
			q.setParameter("username", u.getUsername());
			q.setParameter("password", u.getPassword());
			List<Login> user = q.list();
			session.getTransaction().commit();
			if(user != null && user.size()>0) {
				System.out.println("Username= " + user.get(0).getUsername() + ", Password= " + user.get(0).getPassword());
                isValid = true;
			}
		}
		catch(Exception e) {
			isValid=false;
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		
		return isValid;
	}

	@SuppressWarnings("unchecked")
	public Login getUser(Login u) {
		String query="from Login log where log.username= :username and log.password= :password";
		Session session = null;
		try {
			session = template.getSessionFactory().openSession();
			session.beginTransaction();
			Query<Login> q = session.createQuery(query);
			q.setParameter("username", u.getUsername());
			q.setParameter("password", u.getPassword());
			List<Login> user = q.list();
			session.getTransaction().commit();
			if(user != null && user.size()>0) {
                return user.get(0);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return null;
	}
	
	@Transactional
	public void save(Employee emp) {
		Login u = new Login(emp);
		template.saveOrUpdate(u);
	}
	
	@Transactional
	public void update(Login u) {
		template.update(u);
	}
}