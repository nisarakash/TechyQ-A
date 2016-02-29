package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.Answer;
import com.journaldev.spring.model.QuestionAnswer;

public interface AnswerDAO {

	public QuestionAnswer getAllAnswer(int questionId);
	public boolean addAnswer(Answer answer);
	public List<String> getUniqueAnswerUserToQuestion(int questionId);
	
}
