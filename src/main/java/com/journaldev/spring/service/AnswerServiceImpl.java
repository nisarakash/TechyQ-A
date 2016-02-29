package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.AnswerDAO;
import com.journaldev.spring.model.Answer;
import com.journaldev.spring.model.QuestionAnswer;

@Service
public class AnswerServiceImpl implements AnswerService {

	private AnswerDAO answerDAO;

	public void setAnswerDAO(AnswerDAO answerDAO) {
		this.answerDAO = answerDAO;
	}

	@Override
	@Transactional
	public QuestionAnswer getAllAnswer(int questionId) {

		return answerDAO.getAllAnswer(questionId);
	}

	@Override
	@Transactional
	public boolean addAnswer(Answer answer) {
		answerDAO.addAnswer(answer);
		return true;
	}
	
	@Override
	@Transactional
	public List<String> getUniqueUser(int qid){
		return answerDAO.getUniqueAnswerUserToQuestion(qid);
	}

}
