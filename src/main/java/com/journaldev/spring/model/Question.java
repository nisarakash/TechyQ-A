package com.journaldev.spring.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "questions")
public class Question {

	@Id
	@Column(name = "qid")
	private int qid;
	@Column(name = "qtitle")
	private String qtitle;
	@Column(name = "qquestion")
	private String qquestion;
	@Column(name = "timestamp")
	private Date qtimestamp;
	@Column(name = "username")
	private String userName;
	@Transient
	private int numberOfAnswers;
	
	public Question() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Questions [qid=" + qid + ", title=" + qtitle + ", date=" + qtimestamp + ", userName=" + userName + "]";
	}

	public String getQtitle() {
		return qtitle;
	}

	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}

	public String getQquestion() {
		return qquestion;
	}

	public void setQquestion(String qquestion) {
		this.qquestion = qquestion;
	}

	public Date getQtimestamp() {
		return qtimestamp;
	}

	public void setQtimestamp(Date qtimestamp) {
		this.qtimestamp = qtimestamp;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getQid() {
		return qid;
	}

	public void setQid(int qid) {
		this.qid = qid;
	}

	public int getNumberOfAnswers() {
		return numberOfAnswers;
	}

	public void setNumberOfAnswers(int numberOfAnswers) {
		this.numberOfAnswers = numberOfAnswers;
	}

}
