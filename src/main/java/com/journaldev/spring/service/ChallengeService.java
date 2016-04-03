package com.journaldev.spring.service;

import java.util.ArrayList;
import java.util.List;

import com.journaldev.spring.model.Challenge;
import com.journaldev.spring.model.Question;

public interface ChallengeService {

	boolean addChallenge(Challenge c);
    Challenge getChallenge(int challengeID);
    ArrayList<Challenge> getOpenChallenges();
	List<Challenge> getAllChallenege(int challengeStatus);
}
