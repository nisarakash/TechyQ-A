package com.journaldev.spring;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.googleapis.json.GoogleJsonResponseException;
import com.google.api.client.googleapis.media.MediaHttpUploader;
import com.google.api.client.googleapis.media.MediaHttpUploaderProgressListener;
import com.google.api.client.http.InputStreamContent;
import com.google.api.services.samples.youtube.cmdline.Auth;
import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.model.VideoSnippet;
import com.google.api.services.youtube.model.VideoStatus;
import com.google.common.collect.Lists;
import com.journaldev.spring.dao.userDAO;
import com.journaldev.spring.model.User;
import com.journaldev.spring.model.Video;
import com.journaldev.spring.model.VideoComment;
import com.journaldev.spring.model.VideoVote;
import com.journaldev.spring.service.VideoService;

/**
 * 
 * /** Handles requests for the application file upload requests
 */
@Controller
public class FileUploadController {

	@Autowired
	VideoService videoService;
	@Autowired
	userDAO userDAO;

	private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);

	private static YouTube youtube;
	private static final String VIDEO_FILE_FORMAT = "video/*";
	private static final String SAMPLE_VIDEO_FILENAME = "sample-video.mp4";

	
	@RequestMapping(value = "/addVideoComment")
	public String addVideoComment(ModelMap model, HttpServletRequest request) {
		String commentText = request.getParameter("comment");
		String videoId = request.getParameter("videoId");
		String username = (String) request.getSession().getAttribute("username");
		Date d = new java.sql.Date(new java.util.Date().getTime());

		VideoComment comment = new VideoComment();
		comment.setVideoId(Integer.parseInt(videoId));
		comment.setTimeStamp(d);
		comment.setUserName(username);
		comment.setComment(commentText);

		videoService.addComment(comment);

		return "redirect:/watchVideo?videoId=" + videoId;

	}
	
	
	@RequestMapping(value = "/watchVideo", method = RequestMethod.GET)
	public String watchVideo(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("username") != null) {
			String username = (String) request.getSession().getAttribute("username");
			int videoId = Integer.parseInt((String) request.getParameter("videoId"));
			Video video = videoService.getVideoById(videoId);
			List<VideoComment> videoComments = videoService.getCommentForVideoId(videoId);
			int vote = videoService.getVoteForVideo(videoId);
			boolean isAlreadyVoted = videoService.isAlreadyVoted(username,videoId);
			model.addAttribute("video", video);
			model.addAttribute("videoComments", videoComments);
			model.addAttribute("votes", vote);
			model.addAttribute("isAlreadyVoted", isAlreadyVoted);
			return "videoWatch";
		} else {
			return "login";
		}
	}
	
	@RequestMapping(value = "/videoVoteUpdate", method = RequestMethod.POST)
	public String videoVoteUpdate(ModelMap model, HttpServletRequest request) {
		String username = (String) request.getSession().getAttribute("username");
		int videoId = Integer.parseInt(request.getParameter("videoId"));
		VideoVote vote = new VideoVote();
		vote.setUpVote(1);
		vote.setUserName(username);
		vote.setVideoId(videoId);
		videoService.updateVote(vote);
		return "redirect:/watchVideo?videoId=" + videoId;
	}

	@RequestMapping(value = "/video", method = RequestMethod.GET)
	public String uploadFile(ModelMap model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		if (session.getAttribute("username") != null) {
			ArrayList<Video> highRatedVideo = (ArrayList<Video>) videoService.getHighVotedVideo();
			ArrayList<Video> latestVideo = (ArrayList<Video>) videoService.getLatestVotedVideo();
			String username = (String) request.getSession().getAttribute("username");
			User user = userDAO.getUserDetails(username);
			model.addAttribute("highRatedVideo", highRatedVideo);
			model.addAttribute("latestVideo", latestVideo);
			model.addAttribute("points", user.getPoints());
			return "video";
		} else {
			return "login";
		}

	}

	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public String uploadFileHandler(@RequestParam("file") MultipartFile file,
			@RequestParam("videoTitle") String videoTitle, @RequestParam("videoDesc") String videoDesc,
			HttpServletRequest request) {

		HttpSession session = request.getSession();
		if (session.getAttribute("username") == null) {
			return "login";
		} else {
			boolean isVideoFile = false;
			SimpleDateFormat sdfr = new SimpleDateFormat("yyyyMMddhhmmss");
			if (!file.isEmpty()) {
				String[] fileDetails = file.getOriginalFilename().split("[.]");
				String fileExtention = null;
				if (fileDetails.length > 1 && fileDetails[fileDetails.length - 1] != null) {
					fileExtention = fileDetails[fileDetails.length - 1];
				}
				if (fileExtention != null && fileExtention.equals("mp4")) {
					isVideoFile = true;
				}
				if (!isVideoFile) {
					return "redriect:/video";
				} else {
					Video video = new Video();
					video.setUserName((String) session.getAttribute("username"));
					video.setVideoTitle(videoTitle);
					video.setVideoDescription(videoDesc);
					try {
						List<String> scopes = Lists.newArrayList("https://www.googleapis.com/auth/youtube.upload");
						try {
							byte[] bytes = file.getBytes();
							Credential credential = Auth.authorize(scopes, "uploadvideo");
							youtube = new YouTube.Builder(Auth.HTTP_TRANSPORT, Auth.JSON_FACTORY, credential)
									.setApplicationName("youtube-cmdline-uploadvideo-sample").build();

							System.out.println("Uploading: " + SAMPLE_VIDEO_FILENAME);

							com.google.api.services.youtube.model.Video videoObjectDefiningMetadata = new com.google.api.services.youtube.model.Video();

							VideoStatus status = new VideoStatus();
							status.setPrivacyStatus("public");
							videoObjectDefiningMetadata.setStatus(status);

							VideoSnippet snippet = new VideoSnippet();

							snippet.setTitle(videoTitle);
							snippet.setDescription(videoDesc);

							videoObjectDefiningMetadata.setSnippet(snippet);

							InputStreamContent mediaContent = new InputStreamContent(VIDEO_FILE_FORMAT,
									new ByteArrayInputStream(bytes));
							YouTube.Videos.Insert videoInsert = youtube.videos().insert("snippet,statistics,status",
									videoObjectDefiningMetadata, mediaContent);

							MediaHttpUploader uploader = videoInsert.getMediaHttpUploader();

							uploader.setDirectUploadEnabled(false);

							MediaHttpUploaderProgressListener progressListener = new MediaHttpUploaderProgressListener() {
								public void progressChanged(MediaHttpUploader uploader) throws IOException {
									switch (uploader.getUploadState()) {
									case INITIATION_STARTED:
										System.out.println("Initiation Started");
										break;
									case INITIATION_COMPLETE:
										System.out.println("Initiation Completed");
										break;
									case MEDIA_IN_PROGRESS:
										System.out.println("Upload in progress");
										break;
									case MEDIA_COMPLETE:
										System.out.println("Upload Completed!");
										break;
									case NOT_STARTED:
										System.out.println("Upload Not Started!");
										break;
									}
								}
							};
							uploader.setProgressListener(progressListener);

							com.google.api.services.youtube.model.Video returnedVideo = videoInsert.execute();
							video.setThumbnailLocation(returnedVideo.getSnippet().getThumbnails().getMedium().getUrl());
							video.setVideoLocation(returnedVideo.getId());
							java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());
							video.setTimeStamp(date);
							videoService.addVideo(video);

						} catch (GoogleJsonResponseException e) {
							System.err.println("GoogleJsonResponseException code: " + e.getDetails().getCode() + " : "
									+ e.getDetails().getMessage());
							e.printStackTrace();
						} catch (IOException e) {
							System.err.println("IOException: " + e.getMessage());
							e.printStackTrace();
						} catch (Throwable t) {
							System.err.println("Throwable: " + t.getMessage());
							t.printStackTrace();
						}

					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
			return "redirect:/video";

		}
	}

}