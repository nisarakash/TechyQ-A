package com.journaldev.spring.service;

import java.util.ArrayList;
import java.util.List;

import com.journaldev.spring.model.Question;

public interface QuestionService {

	ArrayList<Question> getAllQuestions();

	boolean addQuestion(Question q);
	ArrayList<String> getSearchQuestion();
	
	ArrayList<Question> getTopQuestions(List topQuestion);

	ArrayList<Question> latestTenQuestion();

	ArrayList<Question> getTenHotQuestion();
	
	ArrayList<Question> getNumberOfAnswerInQuestion();
}
