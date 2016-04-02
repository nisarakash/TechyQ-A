package com.journaldev.spring.dao;

import java.util.ArrayList;
import java.util.List;

import com.journaldev.spring.model.Person;
import com.journaldev.spring.model.Question;

public interface QuestionDAO {

	public List<Question> getAllQuestion();
	public void addQuestion(Question question);
	public List<String> getSearchQuestion();
	public List<Question> getTopQuestions(List topQuestion);
	public List<Question> latestTenQuestion();
	public List<Question> getTenHotQuestion();
}
