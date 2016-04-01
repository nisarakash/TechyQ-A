package com.journaldev.spring;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.journaldev.spring.model.Answer;
import com.journaldev.spring.model.QuestionAnswer;
import com.journaldev.spring.model.User;
import com.journaldev.spring.service.AnswerService;

@Controller
public class AnswerController {

	@Autowired
	AnswerService answerService;
	User user;

	@RequestMapping(value = "/answers")
	public String showAnswers(ModelMap model, HttpServletRequest request) {
		String qid = request.getParameter("qid");
		int questionId = Integer.parseInt(qid);
		QuestionAnswer qa = answerService.getAllAnswer(questionId);
		System.out.println(qa.getAnswers().size() + qa.getQuestion().getQtitle());
		model.addAttribute("question", qa.getQuestion());
		model.addAttribute("answers", qa.getAnswers());
		return "answers";
	}

	@RequestMapping(value = "/addAnswer")
	public String addAnswer(ModelMap model, HttpServletRequest request) {
		String ans = request.getParameter("answer");
		String qid = request.getParameter("questionid");
		String username = (String) request.getSession().getAttribute("username");
		Date d = new java.sql.Date(new java.util.Date().getTime());

		Answer answer = new Answer();
		answer.setQid(Integer.parseInt(qid));
		answer.setTimeStamp(d);
		answer.setUserName(username);
		answer.setAnswer(ans);

		answerService.addAnswer(answer);

		return "redirect:answers?qid=" + qid;

	}

	@RequestMapping(value = "/getUser")
	public @ResponseBody String getUser(HttpServletRequest request) {
		String questionId = request.getParameter("qid");
		System.out.println(questionId);
		int qid = Integer.parseInt(questionId);
		ArrayList<String> uniqueUser = (ArrayList<String>) answerService.getUniqueUser(qid);
		String result = "";
		for (String user : uniqueUser) {
			result += user + ",";
		}

		return result.substring(0, result.length() - 1);
	}

	@RequestMapping(value = "/setMeeting", method = RequestMethod.POST)
	public String scheduleMeeting(HttpServletRequest request) {

		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String[] userEmail = request.getParameterValues("invitees");
		String questionId = request.getParameter("questionId");
		String questionTitle = request.getParameter("questionTitle");

		SecureRandom random = new SecureRandom();
		String randomString = new BigInteger(130, random).toString(32);

		String meetingUrl = "https://appear.in/" + randomString;

		// Sender's email ID needs to be mentioned
		String from = "techqa.cse591@gmail.com";

		// Assuming you are sending email from localhost
		String host = "localhost";

		// Get system properties
		Properties properties = System.getProperties();

		// Setup mail server
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.setProperty("mail.user", "techqa.cse591");
		properties.setProperty("mail.password", "cse591tolc");
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.auth", "true");

		// Get the default Session object.
		Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("techqa.cse591@gmail.com", "cse591tolc");
			}
		});

		try {
			// Create a default MimeMessage object.
			MimeMessage message = new MimeMessage(session);

			// Set From: header field of the header.
			message.setFrom(new InternetAddress(from));

			// Set To: header field of the header.
			for (String email : userEmail) {
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			}

			// Set Subject: header field
			message.setSubject("Followup Meeting Invitation");
			String firstname = (String) request.getSession().getAttribute("firstname");
			String email = (String) request.getSession().getAttribute("email");
			// Now set the actual message
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			
			message.setText(firstname +"("+email+") would like to invite you for the follow up meeting on topic: "+questionTitle + "\n \n" + "Date : " + date + "\nTime :" + time +" \nInvitation Link:"
					+ meetingUrl);

			// Send message
			Transport.send(message);
			System.out.println("Sent message successfully....");
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
		return "redirect:answers?qid=" + questionId;

	}
}
