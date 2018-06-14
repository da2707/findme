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
	public User login(String id) throws Exception {
		return mapper.login(id);
	}

	@Override
	public void insertUser(User user) throws Exception {
		mapper.insertUser(user);
	}

	@Override
	public int countId(String id) throws Exception {
		return mapper.countId(id);
	}

	@Override
	public void changePw(User user) {
		mapper.changePw(user);
	}
}
