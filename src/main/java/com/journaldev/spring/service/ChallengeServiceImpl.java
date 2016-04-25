package com.journaldev.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.ChallengeDAO;
import com.journaldev.spring.model.Challenge;
import com.journaldev.spring.model.ChallengeComment;
import com.journaldev.spring.model.ChallengeVote;

@Service
public class ChallengeServiceImpl implements ChallengeService {

	public void setchallengeDAO(ChallengeDAO challengeDAO) {
		this.challengeDAO = challengeDAO;
	}

	private ChallengeDAO challengeDAO;

	@Transactional
	public boolean addChallenge(Challenge c) {
		challengeDAO.addChallenge(c);
		return true;
	}

	@Transactional
	public boolean addAnswertoChallenge(Challenge challenge) {
		challengeDAO.addAnswertoChallenge(challenge);
		return true;
	}

	@Transactional
	public Challenge getChallenge(int challengeID) {
		return challengeDAO.getChallenge(challengeID);
	}

	public List<Challenge> getAllChallenege(int challengeStatus) {
		return null;
	}

	@Transactional
	public ArrayList<Challenge> getOpenChallenges(int points) {
		ArrayList<Challenge> listchallenges = (ArrayList<Challenge>) challengeDAO.getOpenChallenges(points);
		return listchallenges;
	}

	@Transactional
	public ArrayList<Challenge> getUnderReviewChallenges(int points, String username) {
		ArrayList<Challenge> listUnderReviewChallenges = (ArrayList<Challenge>) challengeDAO
				.getUnderReviewChallenges(points, username);
		return listUnderReviewChallenges;
	}

	@Transactional
	public ArrayList<Challenge> getClosedChallenges(int points) {
		ArrayList<Challenge> listClosedChallenges = (ArrayList<Challenge>) challengeDAO.getCloseChallenges(points);
		return listClosedChallenges;
	}

	@Transactional
	public ArrayList<Challenge> getUserChallengesPosted(String username) {
		ArrayList<Challenge> userPostedChallenges = (ArrayList<Challenge>) challengeDAO
				.getUserChallengesPosted(username);
		return userPostedChallenges;
	}

	@Transactional
	public ArrayList<Challenge> getUserChallengesAttended(String username) {
		ArrayList<Challenge> userAttendedChallenges = (ArrayList<Challenge>) challengeDAO
				.getUserChallengesAttended(username);
		return userAttendedChallenges;
	}

	@Transactional
	public void addVote(ChallengeVote vote) {
		challengeDAO.addVote(vote);

	}

	@Transactional
	public boolean checkVote(ChallengeVote vote) {
		return challengeDAO.checkVote(vote);
	}

	@Transactional
	public int countVote(int challengeId, String vote) {
		return challengeDAO.countVote(challengeId, vote);
	}

	@Transactional
	public void addComment(ChallengeComment comment) {
		challengeDAO.addComment(comment);
	}

	@Transactional
	public List<ChallengeComment> getAllCommentToChallengeId(int challengeId) {
		return challengeDAO.getAllCommentToChallengeId(challengeId);
	}

}
