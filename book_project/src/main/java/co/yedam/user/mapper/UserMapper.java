package co.yedam.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.yedam.user.service.UserVO;

public interface UserMapper {
	public boolean insert(UserVO vo);
	public boolean update(UserVO vo);
	public boolean delete(UserVO vo);
	
	public UserVO getUser(@Param("userId")String id, @Param("userPass") String pw);
	public String idcheck(String id);
	public UserVO select(String userId);
}
