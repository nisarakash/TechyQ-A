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
		List<Question> questionList = session.createQuery("from Question").list();
		return questionList;

	}

	public void addQuestion(Question question) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(question);
	}
	
	@SuppressWarnings("unchecked")
	public List<String> getSearchQuestion() {
		Session session = this.sessionFactory.getCurrentSession();

		List<String> questionList = session.createQuery("SELECT q.qquestion FROM Question q").list();
		return questionList;

	}
	
	@SuppressWarnings("unchecked")
	public List<Question> getTopQuestions(List topQuestion) {
		List<Question> questionList = null;
		try
		{
		Session session = this.sessionFactory.getCurrentSession();
		questionList = session.createQuery("from Question question where question.id IN :list").setParameterList("list", topQuestion).list();
		return questionList;
		}
		catch(Exception e)
		{
			return questionList;
		}
	}
}