package com.journaldev.spring;

import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.journaldev.spring.model.Challenge;
import com.journaldev.spring.service.ChallengeService;

@Controller
public class ChallengeController {
	
	@Autowired
	ChallengeService challengeService;

	
	@RequestMapping(value = "/createChallenges", method = RequestMethod.GET)
	public ModelAndView createChallenge(HttpServletRequest request) {

		HttpSession session = request.getSession();
		ModelAndView model = new ModelAndView();
		if(session.getAttribute("username") != null)
		{
			model.setViewName("createChallenges");
			return model;
		}
		else
		{
			model.addObject("Request","Please login to enter the challenges. Thanks !!!!");
			model.setViewName("forward:/home");
			session.invalidate();
			return model;
		}
	}
	
	@RequestMapping(value = "/answerChallenges", method = RequestMethod.GET)
	public String answerChallenge() {

		return "answerChallenges";

	}
	
	
	@RequestMapping(value = "/openChallenges", method = RequestMethod.GET)
	public String openChallenge(ModelMap model, HttpServletRequest request) {
		
		ArrayList<Challenge> opechallenges = challengeService.getOpenChallenges();
		model.addAttribute("openChallenge", opechallenges);

		return "openChallenges";

	}
	@RequestMapping(value = "/addChallenge", method = RequestMethod.POST)
	public String addChallenge(ModelMap model, HttpServletRequest request) {
		String title = request.getParameter("title");
		String question= request.getParameter("ques");
		String hostAnswer =request.getParameter("ans");
		int points = Integer.parseInt(request.getParameter("points"));
		String hostUser= (String) request.getSession().getAttribute("username");
		
		Challenge challenge = new Challenge();
		challenge.setTitle(title);
		challenge.setHostUser(hostUser);
		challenge.setQuestion(question);
		challenge.setHostAnswer(hostAnswer);
		challenge.setPoints(points);
		java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());
		challenge.setStartTime(date);
		
		
		boolean t= challengeService.addChallenge(challenge);
		
		
		

		return "redirect:/home";

	}
	
	@RequestMapping(value = "/reviewChallenges", method = RequestMethod.GET)
	public String reviewChallenge() {
		return "challengesUnderReview";

	}
	
	@RequestMapping(value = "/closeChallenges", method = RequestMethod.GET)
	public String closeChallenge() {
		return "challengesUnderReview";

	}
}
