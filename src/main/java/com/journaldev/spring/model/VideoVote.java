package com.journaldev.spring.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "video_vote")

public class VideoVote {

	@Id
	@Column(name = "video_id")
	private int videoId;
	@Column(name = "username")
	private String userName;
	@Column(name = "upvote")
	private int upVote;
	
	public int getVideoId() {
		return videoId;
	}

	public void setVideoId(int videoId) {
		this.videoId = videoId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	
	public int getUpVote() {
		return upVote;
	}

	public void setUpVote(int upVote) {
		this.upVote = upVote;
	}

	public VideoVote() {
		super();
		// TODO Auto-generated constructor stub
	}
}
