package com.journaldev.spring.service;

import java.util.List;

import com.journaldev.spring.model.Answer;
import com.journaldev.spring.model.QuestionAnswer;

public interface AnswerService {
	
	public QuestionAnswer getAllAnswer(int questionId);
	public boolean addAnswer(Answer answer);
	public List<String> getUniqueUser(int qid);

}
