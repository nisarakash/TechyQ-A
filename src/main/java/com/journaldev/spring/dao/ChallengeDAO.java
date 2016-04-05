package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.Challenge;

public interface ChallengeDAO {
	
	public void addChallenge(Challenge challenge);
	public Challenge getChallenge(int challengeID);
	public List<Challenge> getOpenChallenges(int points);
	public List<Challenge> getAllChallenege(int challengeStatus);

}
