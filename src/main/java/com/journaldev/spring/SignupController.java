package com.journaldev.spring;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.journaldev.spring.dao.userDAO;
import com.journaldev.spring.model.User;

@Controller
public class SignupController {
	
	@Autowired
	private userDAO dao;
	
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String signup() {

		return "signup";

	}

	@RequestMapping(value = "/Signup")
	public ModelAndView signup(HttpServletRequest request) {
		try
		{
		ModelAndView modelView = new ModelAndView();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String firstName = request.getParameter("firstname");
		String middleName = request.getParameter("middlename");
		String lastName = request.getParameter("lastname");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String state = request.getParameter("state");
		if(password.isEmpty() || firstName.isEmpty() || lastName.isEmpty() || email.isEmpty()
				&& gender.isEmpty() || state.isEmpty())
		{
			modelView.addObject("emptyFields","Please enter all the fields");
			modelView.setViewName("signup");
			return modelView;
		}

		boolean user = dao.addUser(new User(username,password,firstName,middleName,lastName,email,gender,state));
		if(user == true){
			System.out.println("done");
			modelView.addObject("Successful","Successful Signup");
			modelView.setViewName("signup");
			return modelView;
		}
		else {
			System.out.println("not working");
			modelView.addObject("ExsistingUser","User already exists");
			modelView.setViewName("signup");
			return modelView;
		}
		
		

	}
		catch(Exception e)
		{
			ModelAndView modelView = new ModelAndView();
			modelView.setViewName("signup");
			return modelView;
		}
	}
	
	
}
