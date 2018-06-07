package kr.co.findme.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.findme.repository.domain.User;
import kr.co.findme.repository.mapper.UserMapper;

@Service("userService")
public class UserServiceExec implements UserService{
	
	@Autowired
	private UserMapper mapper;
	
	@Override
	public User login(User user) throws Exception {
		return null;
	}

	@Override
	public User loginSuccess(String id) throws Exception {
		return mapper.loginSuccess(id);
	}

}
