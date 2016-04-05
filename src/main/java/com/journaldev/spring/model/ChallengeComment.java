package com.journaldev.spring.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "challenge_review")
public class ChallengeComment {
	@Id
	@Column(name = "idchallenge")
	private int challengeId;
	@Column(name = "reviewer")
	private String reviewer;
	@Column(name = "reviewer_comment")
	private String reviewerComment;
	@Column(name = "timestamp")
	private Date timeStamp;

	public int getChallengeId() {
		return challengeId;
	}

	public void setChallengeId(int challengeId) {
		this.challengeId = challengeId;
	}

	public String getReviewer() {
		return reviewer;
	}

	public void setReviewer(String reviewer) {
		this.reviewer = reviewer;
	}

	public String getReviewerComment() {
		return reviewerComment;
	}

	public void setReviewerComment(String reviewerComment) {
		this.reviewerComment = reviewerComment;
	}

	public Date getTimeStamp() {
		return timeStamp;
	}

	public void setTimeStamp(Date timeStamp) {
		this.timeStamp = timeStamp;
	}

	public ChallengeComment() {
		super();
		// TODO Auto-generated constructor stub
	}

}
