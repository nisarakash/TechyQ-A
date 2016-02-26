package com.journaldev.spring;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.journaldev.spring.dao.userDAO;
import com.journaldev.spring.model.User;

@Controller
public class SignupController {
	
	@Autowired
	private userDAO dao;
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup() {

		return "signup";

	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(HttpServletRequest request) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String firstName = request.getParameter("firstname");
		String middleName = request.getParameter("middlename");
		String lastName = request.getParameter("lastname");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String state = request.getParameter("state");

		boolean user = dao.addUser(new User(username,password,firstName,middleName,lastName,email,gender,state));
		if(user == true){
			System.out.println("done");
			return "signup";
		}
		else {
			System.out.println("not working");
			return "login";
		}
		

	}
	
	
}
