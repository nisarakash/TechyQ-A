package com.journaldev.spring;

import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {

		return "login";

	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login12(HttpServletRequest request) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		System.out.println("Username : " + username);
		System.out.println("Password : " + password);
		dao.dummyCall();
		User user = dao.getUser(new User(username,password,null,null,null));
		if(user !=null)
			System.out.println("firstName -=" + user.getFirstName());
		else {
			System.out.println("not working");
		}
		return "login";

	}

}
