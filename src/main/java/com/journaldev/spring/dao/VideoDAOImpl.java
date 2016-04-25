package com.journaldev.spring.dao;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Video;
import com.journaldev.spring.model.VideoComment;

@Repository
public class VideoDAOImpl implements VideoDAO {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}

	public Video getVideoById(int videoId) {
		Session session = this.sessionFactory.getCurrentSession();
		Video video = (Video) session.createQuery("from Video where videoId= " + videoId).list().get(0);
		return video;
	}

	public boolean addVideo(Video video) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(video);
		return true;
	}

	public List<Video> getHighVotedVideo() {
		/*
		 * Session session = this.sessionFactory.getCurrentSession();
		 * List<Video> videos =
		 * session.createQuery("").setMaxResults(10).list(); return videos;
		 */
		return null;
	}

	public List<Video> getLatestVotedVideo() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Video> videos = session.createQuery("from Video order by timeStamp desc").setMaxResults(10).list();
		return videos;
	}

	public List<Video> getVideoBySearchKeyword(String keyword) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Video> videos = session
				.createQuery("from Video where videoTitle like '%" + keyword + "%' order by timeStamp desc")
				.setMaxResults(10).list();
		return videos;
	}

	public List<VideoComment> getCommentsForVideoId(int videoId) {
		Session session = this.sessionFactory.getCurrentSession();
		ArrayList<VideoComment> videoComments = new ArrayList<VideoComment>();
		List<Object[]> rows = session
				.createSQLQuery(
						"Select video_id,comment,username,timestamp from video_comment where video_id = " + videoId)
				.list();
		for (Object[] row : rows) {
			VideoComment comment = new VideoComment();
			comment.setVideoId(Integer.parseInt(row[0].toString()));
			comment.setComment(row[1].toString());
			System.out.println(row[2].toString());
			comment.setUserName(row[2].toString());

			String startDate = row[3].toString();
			System.out.println(startDate);
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date date;
			try {
				date = sdf1.parse(startDate);
				java.sql.Date dateSQL = new java.sql.Date(date.getTime());
				comment.setTimeStamp(dateSQL);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			videoComments.add(comment);
		}
		return videoComments;

	}

	public int getVoteForVideo(int videoId) {
		int vote = 0;
		Session session = this.sessionFactory.getCurrentSession();
		Object videoVotes = session.createSQLQuery("Select sum(upvote) from video_vote where video_id = " + videoId)
				.list().get(0);
		BigDecimal bd = (BigDecimal) videoVotes;
		if (bd != null) {
			vote = bd.intValue();
		}

		return vote;
	}

	public boolean addComment(VideoComment comment) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(comment);
		return true;
	}

}
