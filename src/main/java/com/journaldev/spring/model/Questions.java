package com.journaldev.spring.model;

public class Questions {
	String title;
	String date;
	String userName;
	
	public Questions() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Questions(String title, String date, String userName) {
		super();
		this.title = title;
		this.date = date;
		this.userName = userName;
	}

	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "Questions [title=" + title + ", date=" + date + ", userName="
				+ userName + "]";
	}
	
	
}

