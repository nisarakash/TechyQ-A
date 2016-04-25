package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Answer;
import com.journaldev.spring.model.Question;
import com.journaldev.spring.model.QuestionAnswer;

@Repository
public class AnswerDAOImpl implements AnswerDAO{
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	public QuestionAnswer getAllAnswer(int questionId) {
		Session session = this.sessionFactory.getCurrentSession();
		QuestionAnswer qa = new QuestionAnswer();
		List<Answer> answerList = session.createQuery("from Answer where qid = "+questionId).list();
		Question question = (Question) session.createQuery("from Question where qid = "+questionId).list().get(0);
		qa.setAnswers(answerList);
		qa.setQuestion(question);
		return qa;
	}

	public boolean addAnswer(Answer answer) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(answer);
		return true;
	}

	public List<String> getUniqueAnswerUserToQuestion(int questionId) {
		Session session = this.sessionFactory.getCurrentSession();
		List<String> users = session.createSQLQuery("select distinct concat(a.username,':',u.email) from answer a inner join user u on a.username=u.username where a.qid="+questionId).list();
		return users;
	}
	
	
}
