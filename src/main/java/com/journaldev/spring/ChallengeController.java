package com.journaldev.spring;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChallengeController {

	
	@RequestMapping(value = "/createChallenges", method = RequestMethod.GET)
	public String createChallenge() {

		return "createChallenges";

	}
	
	@RequestMapping(value = "/openChallenges", method = RequestMethod.GET)
	public String openChallenge() {

		return "openChallenges";

	}
	
	@RequestMapping(value = "/reviewChallenges", method = RequestMethod.GET)
	public String reviewChallenge() {
		return "challengesUnderReview";

	}
	
	@RequestMapping(value = "/closeChallenges", method = RequestMethod.GET)
	public String closeChallenge() {
		return "challengesUnderReview";

	}
}
