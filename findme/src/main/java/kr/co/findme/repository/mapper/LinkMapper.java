package kr.co.findme.repository.mapper;

import java.util.List;

import kr.co.findme.repository.domain.Link;

public interface LinkMapper {
	
	public List<Link> selectAllLink(String id);
	
	public List<Link> selectByCategory(Link link);
	
	public void insertLink(Link link);

	public void updateLink(Link link);
	
	public List<Link> selectLinkByNo(Link link); // update&delete
	
	public void deleteLink(Link link);
	
}
