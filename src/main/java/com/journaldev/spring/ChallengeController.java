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
			model.setViewName("login");
			session.invalidate();
			return model;
		}
	}
	
	@RequestMapping(value = "/answerChallenges", method = RequestMethod.GET)
	public ModelAndView answerChallenge(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView model = new ModelAndView();
		if(session.getAttribute("username") != null)
		{
			model.setViewName("answerChallenges");
			return model;
		}
		else
		{
			model.addObject("Request","Please login to enter the challenges. Thanks !!!!");
			model.setViewName("login");
			session.invalidate();
			return model;
		}

	}
	
	
	@RequestMapping(value = "/openChallenges", method = RequestMethod.GET)
	public ModelAndView openChallenge(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView modelView = new ModelAndView();
		if(session.getAttribute("username") != null)
		{
			modelView.setViewName("openChallenges");
			ArrayList<Challenge> opechallenges = challengeService.getOpenChallenges();
			model.addAttribute("openChallenge", opechallenges);
			return modelView;
		}
		else
		{
			modelView.setViewName("login");
			session.invalidate();
			return modelView;
		}		
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
	public ModelAndView reviewChallenge(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView modelView = new ModelAndView();
		if(session.getAttribute("username") != null)
		{
			modelView.setViewName("challengesUnderReview");
			return modelView;
		}
		else
		{
			modelView.setViewName("login");
			session.invalidate();
			return modelView;
		}

	}
	
	@RequestMapping(value = "/closeChallenges", method = RequestMethod.GET)
	public ModelAndView closeChallenge(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView modelView = new ModelAndView();
		if(session.getAttribute("username") != null)
		{
			modelView.setViewName("challengesUnderReview");
			return modelView;
		}
		else
		{
			modelView.setViewName("login");
			session.invalidate();
			return modelView;
		}
	}
	
	@RequestMapping(value = "/challengeq", method = RequestMethod.GET)
	public String openChallengeWithId(ModelMap model, HttpServletRequest request) {
		int challengeId = Integer.parseInt(request.getParameter("challengeID"));
		Challenge ch = challengeService.getChallenge(challengeId);
		model.addAttribute("challenge", ch);
		return "answerChallenge";

	}
}
