package kr.co.findme.studyroom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.findme.repository.domain.Video;
import kr.co.findme.repository.mapper.VideoMapper;

@Service("studyRoomService")
public class StudyRoomServiceExec implements StudyRoomService {
	@Autowired
	private VideoMapper vmapper;
//	@Autowired
//	private LinkMapper lmapper;
	
	@Override
	public List<Video> retrieveVideo(String id) {
		return vmapper.selectVideo(id);
	}
	
	@Transactional(rollbackFor=Exception.class)
	public void registVideo(Video video){
		vmapper.insertVideo(video);
	}

	@Transactional(rollbackFor=Exception.class)
	public void updateVideo(Video video) {
		vmapper.updateVideo(video);
	}

	@Transactional(rollbackFor=Exception.class)
	public void deleteVideo(Video video) {
		vmapper.deleteVideo(video);
	}
}
	