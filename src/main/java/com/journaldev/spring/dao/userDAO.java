package com.journaldev.spring.dao;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.User;

@Repository
public class userDAO {

	@Autowired
	private SessionFactory sessionFactory;


	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Transactional
	public User getUserDetails(String username) {
		@SuppressWarnings("unchecked")
		Session session = sessionFactory.getCurrentSession();
		Query query = session
				.createQuery("from User where username = :username");
		query.setParameter("username", username);
		List<User> list = query.list();
		if (list.size()>= 1) {
			return (User) list.get(0);
		}
		return null;
	}

	@Transactional
	public User getUser(User user) {
		@SuppressWarnings("unchecked")
		Session session = sessionFactory.getCurrentSession();
		Query query = session
				.createQuery("from User where username = :username and password = :password");
		query.setParameter("username", user.getUsername());
		query.setParameter("password", user.getPassword());
		List<User> list = query.list();
		if (list.size()>= 1) {
			return (User) list.get(0);
		}
		return null;
	}
	

	@Transactional
	public boolean addUser(User u) {
		@SuppressWarnings("unchecked")
		Session session = sessionFactory.getCurrentSession();
		boolean exists = session.createQuery("from User where username= :username")
                .setParameter("username", u.getUsername())
                .setMaxResults(1)
                .uniqueResult() 
         != null;
		if(!exists)
		{
		session.persist(u);
		return true;
		}
		else
			 return false;
	}
	
	public void dummyCall() {
		System.out.println("This is a dummy call");
	}
}
