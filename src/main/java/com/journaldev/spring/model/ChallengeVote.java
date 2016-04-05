package com.journaldev.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "challenge_voting")
public class ChallengeVote {
	@Id
	@Column(name = "vote")
	private String vote;
	@Column(name = "reviewer")
	private String reviewer;
	@Column(name = "idchallenge")
	private int challengeId;
	public String getVote() {
		return vote;
	}
	public void setVote(String vote) {
		this.vote = vote;
	}
	public String getReviewer() {
		return reviewer;
	}
	public void setReviewer(String reviewer) {
		this.reviewer = reviewer;
	}
	public int getChallengeId() {
		return challengeId;
	}
	public void setChallengeId(int challengeId) {
		this.challengeId = challengeId;
	}
	public ChallengeVote() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
