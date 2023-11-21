package co.yedam.user.mapper;


import org.apache.ibatis.annotations.Param;

import co.yedam.user.service.UserVO;

public interface UserMapper {
	public boolean insert(UserVO vo);
	public boolean update(UserVO vo);
	public boolean delete(@Param("id")String id, @Param("pw") String pw);
	
	public UserVO getUser(@Param("id")String id, @Param("pw") String pw);
	public UserVO idcheck(String id);
	public UserVO select(String userId);
	public UserVO findUser(@Param("name") String nickName, @Param("phone")String userPhone);
	public UserVO findPass(@Param("id") String userId, @Param("phone")String userPhone);
}