package com.journaldev.spring.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "answer")
public class Answer {

	@Id
	@Column(name = "aid")
	private int aid;
	@Column(name = "qid")
	private int qid;
	@Column(name = "username")
	private String userName;
	@Column(name = "answer")
	private String answer;
	@Column(name = "timestamp")
	private Date timeStamp;

	public int getQid() {
		return qid;
	}

	public void setQid(int qid) {
		this.qid = qid;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Date getTimeStamp() {
		return timeStamp;
	}

	public void setTimeStamp(Date timeStamp) {
		this.timeStamp = timeStamp;
	}

	public Answer() {
		super();
		// TODO Auto-generated constructor stub
	};

}
