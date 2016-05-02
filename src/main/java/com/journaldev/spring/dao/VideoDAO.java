package com.journaldev.spring.dao;

import java.util.ArrayList;
import java.util.List;

import com.journaldev.spring.model.Video;
import com.journaldev.spring.model.VideoComment;
import com.journaldev.spring.model.VideoVote;

public interface VideoDAO {

	public Video getVideoById(int questionId);
	public boolean addVideo(Video video);
	public List<Video> getHighVotedVideo();
	public List<Video> getLatestVotedVideo();
	public List<Video> getVideoBySearchKeyword(String keyword);
	public List<VideoComment> getCommentsForVideoId(int videoId);
	public int getVoteForVideo(int videoId);
	public boolean addComment(VideoComment comment);
	public void updateVote(VideoVote videoVote);
	public boolean isAlreadyVoted(String username, int videoId); 	
}
