package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Question;

@Repository
public class QuestionDAOImpl implements QuestionDAO {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}

	@SuppressWarnings("unchecked")
	public List<Question> getAllQuestion() {
		Session session = this.sessionFactory.getCurrentSession();

		List<Question> questionList = session.createQuery("from Question order by qtimestamp desc").list();
		return questionList;

	}

	public void addQuestion(Question question) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(question);
	}

}
