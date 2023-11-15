package co.yedam.user.service;

import java.util.List;

import co.yedam.user.mapper.UserMapper;

public interface UserService {
	public boolean addUser(UserVO vo);
	public boolean editUser(UserVO vo);
	public boolean removeUser(UserVO vo);
	
	public UserVO loginCheck(String id, String pw);
	public String IdCheck(String id);

	
}
