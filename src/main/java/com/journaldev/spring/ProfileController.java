package com.journaldev.spring;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.journaldev.spring.dao.userDAO;
import com.journaldev.spring.model.Challenge;
import com.journaldev.spring.model.Question;
import com.journaldev.spring.model.User;
import com.journaldev.spring.service.ChallengeService;
import com.journaldev.spring.service.QuestionService;

@Controller
public class ProfileController {

	@Autowired
	private userDAO userDao;
	@Autowired
	private QuestionService questionService;
	@Autowired
	private ChallengeService challengeService;

 @RequestMapping("/profile")
    public String viewProfile(Model model, HttpServletRequest request){
    	String username = (String) request.getSession().getAttribute("username");
    	User user = userDao.getUserDetails(username);
    	model.addAttribute("user", user);
    	ArrayList<Question>  userQuestions= questionService.getUserQuestion(username);
    	model.addAttribute("userquestion", userQuestions);
    	ArrayList<Challenge> userPostedChallenges = challengeService.getUserChallengesPosted(username);
    	model.addAttribute("userPostedChallenges", userPostedChallenges);
    	ArrayList<Challenge> userAttendedChallenges = challengeService.getUserChallengesAttended(username);
    	model.addAttribute("userAttendedChallenges", userAttendedChallenges);
    	return "profile";
    }
 
 @RequestMapping("/userQuestion")
 public String viewQuestion(Model model, HttpServletRequest request){
	 return null;
 }
 

 @RequestMapping("/userChallenge")
 public String viewChallenge(Model model, HttpServletRequest request){
	 return null;
 }
}
