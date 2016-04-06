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

	@Override
	@Transactional
	public boolean addChallenge(Challenge c){
		challengeDAO.addChallenge(c);
		return true;
	}

	
	@Override
	@Transactional
	public boolean addAnswertoChallenge(Challenge challenge) {
		// TODO Auto-generated method stub
		challengeDAO.addAnswertoChallenge(challenge);
		return true;
	}


	@Override
	@Transactional
	public Challenge getChallenge(int challengeID) {
		return challengeDAO.getChallenge(challengeID);
	}

	@Override
	public List<Challenge> getAllChallenege(int challengeStatus) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public ArrayList<Challenge> getOpenChallenges(int points) {
		// TODO Auto-generated method stub
		ArrayList<Challenge> listchallenges = (ArrayList<Challenge>) challengeDAO.getOpenChallenges(points);
		return listchallenges;
	}
	
	@Override
	@Transactional
	public ArrayList<Challenge> getUnderReviewChallenges(int points, String username) {
		// TODO Auto-generated method stub
		ArrayList<Challenge> listUnderReviewChallenges = (ArrayList<Challenge>) challengeDAO.getUnderReviewChallenges(points,username);
		return listUnderReviewChallenges;
	}
	
	@Override
	@Transactional
	public ArrayList<Challenge> getClosedChallenges(int points) {
		// TODO Auto-generated method stub
		ArrayList<Challenge> listClosedChallenges = (ArrayList<Challenge>) challengeDAO.getCloseChallenges(points);
		return listClosedChallenges;
	}

	@Override
	@Transactional
	public void addVote(ChallengeVote vote) {
		challengeDAO.addVote(vote);
		
	}

	@Override
	@Transactional
	public boolean checkVote(ChallengeVote vote) {
		return challengeDAO.checkVote(vote);
	}

	@Override
	@Transactional
	public int countVote(int challengeId, String vote) {
		return challengeDAO.countVote(challengeId, vote);
	}

	@Override
	@Transactional
	public void addComment(ChallengeComment comment) {
		challengeDAO.addComment(comment);
	}

	@Override
	@Transactional
	public List<ChallengeComment> getAllCommentToChallengeId(int challengeId) {
		return challengeDAO.getAllCommentToChallengeId(challengeId);
	}

}
