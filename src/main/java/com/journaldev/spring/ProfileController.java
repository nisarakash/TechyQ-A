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
    	String image=getImage(user.getLevel());
    	String progress=getProgress(user.getLevel());
    	model.addAttribute("image", image);
    	model.addAttribute("width", progress);
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
 
 private String getImage(String level){
	 String image="";
	 if(level.equalsIgnoreCase("beginner")){
		 image="https://wednesdaynighthop.com/wordpress/wp-content/uploads/2015/03/level-1-icon.png";
	 }
	 else if(level.equalsIgnoreCase("intermediate")){
		 image="https://wednesdaynighthop.com/wordpress/wp-content/uploads/2015/03/level-2-icon.png";
	 }
	 else if(level.equalsIgnoreCase("expert")){
		 image="https://wednesdaynighthop.com/wordpress/wp-content/uploads/2015/03/level-3-icon-150x150.png";
	 }
	 return image;
 }
 
 private String getProgress(String level){
	 String progress="";
	 if(level.equalsIgnoreCase("beginner")){
		 progress="33%";
	 }
	 else if(level.equalsIgnoreCase("intermediate")){
		 progress="66%";
	 }
	 else if(level.equalsIgnoreCase("expert")){
		 progress="100%";
	 }
	 return progress;
 }
}
