package kr.co.findme.studyroom.service;

import java.util.List;

import kr.co.findme.repository.domain.Link;
import kr.co.findme.repository.domain.Video;

public interface StudyRoomService {
	
	public List<Video> retrieveVideo(String id);

	public void registVideo(Video video);
	
	public void updateVideo(Video video);

	public List<Video> updateFormVideo(Video video);

	public void deleteVideo(Video video);
	
	
	public List<Link> retrieveLink(String id);

	public List<Link> retrieveLinkByCategory(Link link);
	
	public void registLink(Link link);

	public void updateLink(Link link);

	public List<Link> updateFormLink(Link link);

	public void deleteLink(Link link);
}
