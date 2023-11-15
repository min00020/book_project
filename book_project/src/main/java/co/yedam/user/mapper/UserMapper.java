package co.yedam.user.mapper;

import org.apache.ibatis.annotations.Param;

import co.yedam.user.service.UserVO;

public interface UserMapper {
	public boolean insert(UserVO vo);
	public boolean update(UserVO vo);
	public boolean delete(UserVO vo);
	
	public UserVO getUser(@Param("id")String id, @Param("pw") String pw);
	public int idcheck(UserVO vo);
}
