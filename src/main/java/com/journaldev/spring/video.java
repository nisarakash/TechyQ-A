package com.journaldev.spring;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class video {


	@RequestMapping(value = "/video")
	public String showAnswers(ModelMap model, HttpServletRequest request) {
		return "video";
		
	}

}
