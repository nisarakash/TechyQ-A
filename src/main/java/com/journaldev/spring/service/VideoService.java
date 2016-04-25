package com.journaldev.spring.service;

import java.util.ArrayList;
import java.util.List;

import com.journaldev.spring.model.Answer;
import com.journaldev.spring.model.QuestionAnswer;
import com.journaldev.spring.model.Video;
import com.journaldev.spring.model.VideoComment;

public interface VideoService {
	

	public Video getVideoById(int questionId);
	public boolean addVideo(Video video);
	public List<Video> getHighVotedVideo();
	public List<Video> getLatestVotedVideo();
	public List<Video> getVideoBySearchKeyword(String keyword);
	public List<VideoComment> getCommentForVideoId(int videoId);
	int getVoteForVideo(int videoId); 
	boolean addComment(VideoComment comment);
}
