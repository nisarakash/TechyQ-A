package com.journaldev.spring.service;

import java.util.ArrayList;

import com.journaldev.spring.model.Question;

public interface QuestionService {

	ArrayList<Question> getAllQuestions();

	boolean addQuestion(Question q);
}
