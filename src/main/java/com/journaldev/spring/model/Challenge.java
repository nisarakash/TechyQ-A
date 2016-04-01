package com.journaldev.spring.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "challenge")
public class Challenge {
	
	@Id
	@Column(name = "idchallenge")
	private int challengeID;
	@Column(name = "host_user")
	private String hostUser;
	@Column(name = "opponent_user")
	private String opponentUser;
	@Column(name = "oints")
	private int points;
	@Column(name = "question")
	private String question;
	@Column(name = "challenge_start_time")
	private Date startTime;
	@Column(name = "challenge_end_time")
	private Date endTime;
	@Column(name = "challenge_status")
	private int challengeStatus;
	@Column(name = "host_answer")
	private String hostAnswer;
	@Column(name = "opponent_answer")
	private String opponentAnswer;
	@Column(name = "winner")
	private String winner;
	
	public Challenge() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getChallengeID() {
		return challengeID;
	}
	public void setChallengeID(int challengeID) {
		this.challengeID = challengeID;
	}
	public String getHostUser() {
		return hostUser;
	}
	public void setHostUser(String hostUser) {
		this.hostUser = hostUser;
	}
	public String getOpponentUser() {
		return opponentUser;
	}
	public void setOpponentUser(String opponentUser) {
		this.opponentUser = opponentUser;
	}
	public int getPoints() {
		return points;
	}
	public void setPoints(int points) {
		this.points = points;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public int getChallengeStatus() {
		return challengeStatus;
	}
	public void setChallengeStatus(int challengeStatus) {
		this.challengeStatus = challengeStatus;
	}
	public String getHostAnswer() {
		return hostAnswer;
	}
	public void setHostAnswer(String hostAnswer) {
		this.hostAnswer = hostAnswer;
	}
	public String getOpponentAnswer() {
		return opponentAnswer;
	}
	public void setOpponentAnswer(String opponentAnswer) {
		this.opponentAnswer = opponentAnswer;
	}
	public String getWinner() {
		return winner;
	}
	public void setWinner(String winner) {
		this.winner = winner;
	}
	
	

}
