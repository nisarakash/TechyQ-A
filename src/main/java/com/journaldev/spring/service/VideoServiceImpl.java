package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.VideoDAO;
import com.journaldev.spring.model.Video;
import com.journaldev.spring.model.VideoComment;
import com.journaldev.spring.model.VideoVote;

@Service
public class VideoServiceImpl implements VideoService {

	private VideoDAO videoDAO;

	public void setVideoDAO(VideoDAO videoDAO) {
		this.videoDAO = videoDAO;
	}

	@Transactional
	public Video getVideoById(int videoId) {
		return videoDAO.getVideoById(videoId);
	}

	@Transactional
	public boolean addVideo(Video video) {
		return videoDAO.addVideo(video);
	}

	@Transactional
	public List<Video> getHighVotedVideo() {
		return videoDAO.getHighVotedVideo();
	}

	@Transactional
	public List<Video> getLatestVotedVideo() {
		return videoDAO.getLatestVotedVideo();
	}

	@Transactional
	public List<Video> getVideoBySearchKeyword(String keyword) {
		return videoDAO.getVideoBySearchKeyword(keyword);
	}

	@Transactional
	public List<VideoComment> getCommentForVideoId(int videoId) {
		return videoDAO.getCommentsForVideoId(videoId);
	}

	@Transactional
	public int getVoteForVideo(int videoId) {
		return videoDAO.getVoteForVideo(videoId);
	}

	@Transactional
	public boolean addComment(VideoComment comment) {
		return videoDAO.addComment(comment);
	}

	@Transactional
	public void updateVote(VideoVote videoVote) {
		videoDAO.updateVote(videoVote);
	}

	@Transactional
	public boolean isAlreadyVoted(String username, int videoId) {
		return videoDAO.isAlreadyVoted(username, videoId);
	}

}
