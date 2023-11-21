package co.yedam.user.service;

public interface UserService {
	public boolean addUser(UserVO vo);
	public boolean editUser(UserVO vo);
	public boolean removeUser(String id, String pw);
	
	public UserVO loginCheck(String id, String pw);
	public UserVO IdCheck(String id);
	public UserVO getUser(String userId);
	public UserVO findUser(String name,String phone);
	public UserVO findPass(String id,String phone);
}
