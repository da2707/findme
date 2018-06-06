package kr.co.findme.studyroom.service;

import java.util.List;

import kr.co.findme.repository.domain.Video;

public interface StudyRoomService {
	
	public List<Video> retrieveVideo(String id);
	
	public void registVideo(Video video);
	
	public void updateVideo(Video video);

	public void deleteVideo(Video video);
}
