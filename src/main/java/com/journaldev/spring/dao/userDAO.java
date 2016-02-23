package com.journaldev.spring.dao;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.User;

import antlr.collections.List;

@Repository
public class userDAO {

	@Autowired
	private SessionFactory sessionFactory;


	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Transactional
	public User getUser(User user) {
		@SuppressWarnings("unchecked")
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Query query = session
				.createQuery("from user_detail where username = :username and password = :password");
		query.setParameter("username", user.getUsername());
		query.setParameter("password", user.getPassword());
		List list = (List) query.list();
		if (list.length() == 1) {
			return (User) list.elementAt(0);
		}
		return null;
	}

	@Transactional
	public boolean addUser(User user) {
		@SuppressWarnings("unchecked")
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Query query = session
				.createQuery("insert into user_details(username, password, first_name,last_name,email) values ("
						+ user.getUsername()
						+ ","
						+ user.getPassword()
						+ ","
						+ user.getFirstName()
						+ ","
						+ user.getLastName()
						+ ","
						+ user.getEmail()					+ ")");
		int result = query.executeUpdate();
		if(result > 0 ) {
			return true;
		}
		return false;
	}
	
	public void dummyCall() {
		System.out.println("This is a dummy call");
	}
}
