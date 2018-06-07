package kr.co.findme.user.service;

import kr.co.findme.repository.domain.User;

public interface UserService {
	public User login(User user) throws Exception;
	public User loginSuccess(String id) throws Exception;
}
