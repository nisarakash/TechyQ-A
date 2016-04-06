package com.journaldev.spring;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.journaldev.spring.model.Challenge;
import com.journaldev.spring.model.ChallengeComment;
import com.journaldev.spring.model.ChallengeVote;
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
	public String answerChallenge(ModelMap model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		
			int challengeId = Integer.parseInt(request.getParameter("challengeID"));
			Challenge ch = challengeService.getChallenge(challengeId);
			//String userName = (String) session.getAttribute("username");
			model.addAttribute("challenge",ch);
			//model.setViewName("answerChallenges");
			return "answerChallenges";

	}
	
	
	@RequestMapping(value = "/openChallenges", method = RequestMethod.GET)
	public ModelAndView openChallenge(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView modelView = new ModelAndView();
		if(session.getAttribute("username") != null)
		{
			modelView.setViewName("openChallenges");
			int points =(Integer) session.getAttribute("points");
			ArrayList<Challenge> opechallenges = challengeService.getOpenChallenges(points);
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
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		challenge.setStartTime(date);
		
		
		boolean t= challengeService.addChallenge(challenge);
		
		
		

		return "redirect:/home";

	}
	
	@RequestMapping(value = "/reviewChallenges", method = RequestMethod.GET)
	public ModelAndView reviewChallenge(ModelMap model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView modelView = new ModelAndView();
		if(session.getAttribute("username") != null)
		{
			modelView.setViewName("challengesUnderReview");
			int points =(Integer) session.getAttribute("points");
			ArrayList<Challenge> opechallenges = challengeService.getOpenChallenges(points);
			model.addAttribute("underReviewChallenge", opechallenges);
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
	public ModelAndView closeChallenge(ModelMap model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView modelView = new ModelAndView();
		if(session.getAttribute("username") != null)
		{
			modelView.setViewName("closedChallenges");
			int points =(Integer) session.getAttribute("points");
			ArrayList<Challenge> opechallenges = challengeService.getOpenChallenges(points);
			model.addAttribute("closeChallenge", opechallenges);
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
	public String openChallengeWithId(ModelMap model, HttpServletRequest request, HttpSession session) {
		int challengeId = Integer.parseInt(request.getParameter("challengeID"));
		Challenge ch = challengeService.getChallenge(challengeId);
		String userName = (String) session.getAttribute("username");
		ChallengeVote vote = new ChallengeVote();
		vote.setChallengeId(challengeId);
		vote.setReviewer(userName);
		boolean alreadyVoted = challengeService.checkVote(vote);
		System.out.println("Voted : +" + alreadyVoted);
		ArrayList<ChallengeComment> cc = (ArrayList<ChallengeComment>) challengeService
				.getAllCommentToChallengeId(challengeId);
		System.out.println("Comment Size" + cc.size());
		model.addAttribute("challenge", ch);
		model.addAttribute("alreadyVoted", alreadyVoted);
		model.addAttribute("comments", cc);
		return "openChallengeComment";

		// return "answerChallenge";

	}

	@RequestMapping(value = "/challengeVote", method = RequestMethod.POST)
	public String vote(ModelMap model, HttpServletRequest request, HttpSession session) {
		System.out.println("Inside challenge Vote");
		String vote = request.getParameter("vote");
		int challengeId = Integer.parseInt(request.getParameter("challengeid"));
		String username = (String) session.getAttribute("username");
		boolean alreadyVoted = false;
		System.out.println(vote);
		ChallengeVote cv = new ChallengeVote();
		cv.setChallengeId(challengeId);
		cv.setReviewer(username);
		cv.setVote(vote);

		alreadyVoted = challengeService.checkVote(cv);
		if (alreadyVoted == false) {
			challengeService.addVote(cv);
			alreadyVoted = true;
		} else {
			model.addAttribute("message", "You have already voted for this challenge");
		}
		Challenge ch = challengeService.getChallenge(challengeId);
		ArrayList<ChallengeComment> cc = (ArrayList<ChallengeComment>) challengeService
				.getAllCommentToChallengeId(challengeId);
		model.addAttribute("challenge", ch);
		model.addAttribute("comments", cc);
		model.addAttribute("alreadyVoted", alreadyVoted);
		return "openChallengeComment";
		// return "answerChallenge";

	}
	
	@RequestMapping(value = "/addComment")
	public String addComment(ModelMap model, HttpServletRequest request) {
		String comment = request.getParameter("comment");
		String challengeId = request.getParameter("challengeid");
		String username = (String) request.getSession().getAttribute("username");
		Date d = new java.sql.Date(new java.util.Date().getTime());

		ChallengeComment c = new ChallengeComment();
		c.setChallengeId(Integer.parseInt(challengeId));
		c.setTimeStamp(d);
		c.setReviewer(username);
		c.setReviewerComment(comment);

		challengeService.addComment(c);

		return "redirect:challengeq?challengeID=" + challengeId;

	}
	
	@RequestMapping(value="/addAnswertoChallenge", method = RequestMethod.POST)
	public String addAnswertoChallenge(ModelMap model, HttpServletRequest request){
		System.out.println(request.getParameter("answer"));
		System.out.println(request.getParameter("challengeId"));
		int challengeId = Integer.parseInt(request.getParameter("challengeId"));
		Challenge ch = challengeService.getChallenge(challengeId);
		String opponentAnswer = request.getParameter("answer");
		String opponentUser= (String) request.getSession().getAttribute("username");
		ch.setOpponentUser(opponentUser);
		ch.setOpponentAnswer(opponentAnswer);
		java.sql.Timestamp endTime = new java.sql.Timestamp(new java.util.Date().getTime());
		ch.setEndTime(endTime);
		boolean t =challengeService.addAnswertoChallenge(ch);
		
		return "openChallengeComment";
	}
}
