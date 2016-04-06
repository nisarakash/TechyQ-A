package com.journaldev.spring.service;

import java.util.ArrayList;
import java.util.List;

import com.journaldev.spring.model.Challenge;
import com.journaldev.spring.model.ChallengeComment;
import com.journaldev.spring.model.ChallengeVote;

public interface ChallengeService {

	boolean addChallenge(Challenge c);
	boolean addAnswertoChallenge(Challenge challenge);
    Challenge getChallenge(int challengeID);
    ArrayList<Challenge> getOpenChallenges(int points);
    ArrayList<Challenge> getUnderReviewChallenges(int points, String username);
    ArrayList<Challenge> getClosedChallenges(int points);
	List<Challenge> getAllChallenege(int challengeStatus);
	public void addVote(ChallengeVote vote);
	public boolean checkVote(ChallengeVote vote);
	public int countVote(int challengeId, String vote);
	
	public void addComment(ChallengeComment comment);
	public List<ChallengeComment> getAllCommentToChallengeId(int challengeId);
}
