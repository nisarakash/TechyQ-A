package com.journaldev.spring;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChallengeController {

	@RequestMapping(value = "/challenges", method = RequestMethod.GET)
	public String challenges() {

		return "challenges";

	}
	
	@RequestMapping(value = "/createChallenge", method = RequestMethod.GET)
	public String createChallenge() {

		return "createChallenge";

	}
}
