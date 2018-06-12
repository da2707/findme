package kr.co.findme.user.service;

import kr.co.findme.repository.domain.User;

public interface UserService {
	public User login(String id) throws Exception;
	public void insertUser(User user) throws Exception;
}
