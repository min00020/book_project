package co.yedam.user.serviceImpl;

import org.apache.ibatis.session.SqlSession;

import co.yedam.common.DataSourceMybatis;
import co.yedam.user.mapper.UserMapper;
import co.yedam.user.service.UserService;
import co.yedam.user.service.UserVO;
import lombok.Setter;

public class UserServiceImpl implements UserService {

	SqlSession sqlSession  = DataSourceMybatis.getInstance().openSession(true);
	UserMapper mapper = sqlSession.getMapper(UserMapper.class);
	
	@Override
	public boolean addUser(UserVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public boolean editUser(UserVO vo) {
		return mapper.update(vo);
	}

	@Override
	public boolean removeUser(UserVO vo) {
		return mapper.delete(vo);
	}

	@Override
	public UserVO loginCheck(String id, String pw) {
		return mapper.getUser(id, pw);
	}

	@Override
	public String IdCheck(String id) {
		return mapper.idcheck(id);
	}
	
	@Override
	public UserVO getUser(String userId) {
		return mapper.select(userId);
	}

}
