package com.journaldev.spring;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.journaldev.spring.dao.userDAO;
import com.journaldev.spring.model.User;

@Controller
public class ProfileController {

	@Autowired
	private userDAO userDao;

 @RequestMapping("/profile")
    public String viewProfile(Model model, HttpServletRequest request){
    	String username = (String) request.getSession().getAttribute("username");
    	User user = userDao.getUserDetails(username);
    	 	model.addAttribute("user", user);
    	return "profile";
    }
}
