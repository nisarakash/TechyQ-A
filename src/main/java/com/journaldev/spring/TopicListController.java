package com.journaldev.spring;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.journaldev.spring.model.Question;
import com.journaldev.spring.service.QuestionService;

@Controller
public class TopicListController {
	
	@Autowired
	QuestionService questionService;
	
	@RequestMapping(value="/home")
	public String showList(ModelMap model) {
		ArrayList<Question> questions = questionService.getAllQuestions();
		System.out.println(questions.size());
		model.addAttribute("questions", questions);
		return "home";
	}
	
	@RequestMapping(value="/newtopic",method=RequestMethod.GET)
	public String addNewTopic(ModelMap model){
		return "newtopic";
	}
	
	@RequestMapping(value="/addTopic",method=RequestMethod.POST)
	public String createNewTopic(HttpServletRequest request){
		Question  q = new Question();
		String username= "abc";
		String title = request.getParameter("title");
		String questionDesc = request.getParameter("desc");
		System.out.println("Title : "+ title + "ques : "+questionDesc);
		q.setQtitle(title);
		
		q.setQquestion(questionDesc);
		q.setUserName(username);
		System.out.println(q.getUserName());
		Date d =  new java.sql.Date(new java.util.Date().getTime());
		q.setQtimestamp(d);
		System.out.println(q);
		
		boolean t=questionService.addQuestion(q);
		System.out.println(t+"    "+q);
		return "home";
	}
	
}
