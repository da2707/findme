package kr.co.findme.repository.mapper;

import kr.co.findme.repository.domain.User;

public interface UserMapper {
	
	User login(String id);
	void insertUser(User user);
	
}
