package co.yedam.user.mapper;

import co.yedam.user.service.UserVO;

public interface UserMapper {
	public boolean addUser(UserVO vo);
	public boolean editUser(UserVO vo);
	public boolean removeUser(UserVO vo);
}
