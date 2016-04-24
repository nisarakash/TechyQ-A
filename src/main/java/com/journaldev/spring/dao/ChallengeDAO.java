package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.Challenge;
import com.journaldev.spring.model.ChallengeComment;
import com.journaldev.spring.model.ChallengeVote;

public interface ChallengeDAO {
	
	public void addChallenge(Challenge challenge);
	public Challenge getChallenge(int challengeID);
	public List<Challenge> getOpenChallenges(int points);
	public List<Challenge> getUnderReviewChallenges(int points, String username);
	public List<Challenge> getCloseChallenges(int points);
	public List<Challenge> getAllChallenege(int challengeStatus);
	public List<Challenge> getUserChallengesPosted(String username);
	public List<Challenge> getUserChallengesAttended(String username);
	public void addVote(ChallengeVote vote);
	public boolean checkVote(ChallengeVote vote);
	public int countVote(int challengeId, String vote);
	
	public void addComment(ChallengeComment comment);
	public List<ChallengeComment> getAllCommentToChallengeId(int challengeId);
	
	public void addAnswertoChallenge(Challenge ch);

}
