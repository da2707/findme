package kr.co.findme.repository.mapper;

import java.util.List;

import kr.co.findme.repository.domain.Video;

public interface VideoMapper {
	
	public List<Video> selectVideo(String id);
	
	public void insertVideo(Video video);

	public void updateVideo(Video video);

	public void deleteVideo(Video video);

}
