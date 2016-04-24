package com.journaldev.spring.dao;

import java.sql.Date;
import java.util.ArrayList;
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
		Session session = this.sessionFactory.getCurrentSession();
		List<Question> questionList = session.createQuery("from Question question where question.id IN :list").setParameterList("list", topQuestion).list();
		return questionList;
	}

	@Override
	public List<Question> latestTenQuestion() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Question> questionList = session.createQuery("from Question order by qtimestamp desc").setMaxResults(10).list();
		
		return questionList;
	}

	@Override
	public List<Question> getTenHotQuestion() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Object[]> rows = session.createSQLQuery("select q.qid,q.qtitle,q.qquestion,q.username,count(a.qid) as num_ans from questions q inner join answer a on q.qid = a.qid GROUP BY q.qid order by num_ans desc").setMaxResults(10).list();
		List<Question> questionList = new ArrayList<Question>();
		for(Object[] row : rows) {
			Question q = new Question();
			q.setQid(Integer.parseInt(row[0].toString()));
			q.setQtitle(row[1].toString());
			q.setQquestion(row[2].toString());
			q.setUserName(row[3].toString());
			questionList.add(q);
		}
		return questionList;
	}

	@Override
	public List<Question> getNumberOfAnswerInQuestion() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Object[]> rows = session.createSQLQuery("select q.qid,count(a.qid) as num_ans from questions q left join answer a on q.qid = a.qid GROUP BY q.qid order by q.timestamp desc").setMaxResults(10).list();
		List<Question> questionList = new ArrayList<Question>();
		for(Object[] row : rows) {
			Question q = new Question();
			q.setQid(Integer.parseInt(row[0].toString()));
			q.setNumberOfAnswers(Integer.parseInt(row[1].toString()));
			questionList.add(q);
		}
		return questionList;	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<Question> getUserQuestion(String username){
		Session session = this.sessionFactory.getCurrentSession();
		List<Question> questionList = session.createQuery("from Question where username='"+username+"'").list();
		System.out.println(questionList);
		return questionList;
	}

	
	
}