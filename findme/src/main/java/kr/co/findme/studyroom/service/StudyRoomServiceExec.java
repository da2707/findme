package kr.co.findme.studyroom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.findme.repository.domain.Link;
import kr.co.findme.repository.domain.Video;
import kr.co.findme.repository.mapper.LinkMapper;
import kr.co.findme.repository.mapper.VideoMapper;

@Service("studyRoomService")
public class StudyRoomServiceExec implements StudyRoomService {
	@Autowired
	private VideoMapper vmapper;
	@Autowired
	private LinkMapper lmapper;
	
	@Override
	public List<Video> retrieveVideo(String id) {
		return vmapper.selectVideo(id);
	}
	
	@Override
	public void registVideo(Video video){
		vmapper.insertVideo(video);
	}

	@Override
	public void updateVideo(Video video) {
		vmapper.updateVideo(video);
	}

	@Override
	public List<Video> updateFormVideo(Video video) {
		return vmapper.selectVideoByNo(video);
	}

	@Override
	public void deleteVideo(Video video) {
		vmapper.deleteVideo(video);
	}

	@Override
	public List<Link> retrieveLink(String id) {
		return lmapper.selectAllLink(id);
	}

	@Override
	public void registLink(Link link) {
		lmapper.insertLink(link);
		
	}

	@Override
	public void updateLink(Link link) {
		lmapper.updateLink(link);
	}

	@Override
	public List<Link> updateFormLink(Link link) {
		return lmapper.selectLinkByNo(link);
	}

	@Override
	public void deleteLink(Link link) {
		lmapper.deleteLink(link);
	}
}
	