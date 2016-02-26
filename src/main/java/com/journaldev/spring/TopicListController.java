package com.journaldev.spring;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.journaldev.spring.model.Questions;
import com.journaldev.spring.service.QuestionService;

@Controller
public class TopicListController {
	
	@Autowired
	QuestionService mquesService;
	
	@RequestMapping(value="/home",method=RequestMethod.GET)
	public String showList(ModelMap model) {
		/*ArrayList<Questions> questions = new ArrayList<Questions>();
		questions.add(new Questions("Is there a way to create out of DOM elements in Web Worker?","2016-10-2","Alex"));
		questions.add(new Questions("Is there a way to create out of DOM elements in Web Worker?","2016-10-2","Alex"));
		questions.add(new Questions("Is there a way to create out of DOM elements in Web Worker?","2016-10-2","Alex"));
		questions.add(new Questions("Is there a way to create out of DOM elements in Web Worker?","2016-10-2","Alex"));
		System.out.println(questions);*/
		
		model.addAttribute("questions", mquesService.getAllQuestions());
		return "home";
	}
	
}