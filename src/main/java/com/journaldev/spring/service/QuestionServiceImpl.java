package com.journaldev.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.QuestionDAO;
import com.journaldev.spring.dao.QuestionDAOImpl;
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

}