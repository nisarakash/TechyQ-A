package com.journaldev.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.QuestionDAO;
import com.journaldev.spring.model.Question;

@Service
public class QuestionServiceImpl implements QuestionService {

	public void setQuestionDAO(QuestionDAO questionDAO) {
		this.questionDAO = questionDAO;
	}

	private QuestionDAO questionDAO;

	@Override
	@Transactional
	public ArrayList<Question> getAllQuestions() {
		return (ArrayList<Question>) questionDAO.getAllQuestion();
	}

	@Override
	@Transactional
	public boolean addQuestion(Question q) {
		questionDAO.addQuestion(q);
		return true;
	}
	
	@Transactional
	public ArrayList<String> getSearchQuestion() {
		return (ArrayList<String>) questionDAO.getSearchQuestion();
	}
	
	@Transactional
	public ArrayList<Question> getTopQuestions(List topQuestion) {
		return (ArrayList<Question>) questionDAO.getTopQuestions(topQuestion);
	}

	@Override
	@Transactional
	public ArrayList<Question> latestTenQuestion() {
		return (ArrayList<Question>) questionDAO.latestTenQuestion();
	}

	@Override
	@Transactional
	public ArrayList<Question> getTenHotQuestion() {
		return (ArrayList<Question>) questionDAO.getTenHotQuestion();
	}
}