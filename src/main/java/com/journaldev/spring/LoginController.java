package com.journaldev.spring;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.journaldev.spring.dao.userDAO;
import com.journaldev.spring.model.User;

@Controller
public class LoginController {

	@Autowired
	private userDAO dao;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String defaultController() {
		return "redirect:/home";

	}


	@RequestMapping(value = "/login")
	public String login12(HttpServletRequest request) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		session.setAttribute("username", username);

		User user = dao.getUser(new User(username, password, null, null, null, null, null, null));
		if (user != null) {
			System.out.println("firstName -=" + user.getFirstName());
			session.setAttribute("firstname", user.getFirstName());
			session.setAttribute("email", user.getEmail());
			session.setAttribute("username", user.getUsername());
			return "redirect:/home";
		} else {
			System.out.println("not working");
			session.invalidate();
			return "redirect:/home";
		}

	}

	@RequestMapping(value = "/logout")
	public String test(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/home";
	}
}
