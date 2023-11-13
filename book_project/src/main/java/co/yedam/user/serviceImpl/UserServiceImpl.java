package co.yedam.user.serviceImpl;

import org.apache.ibatis.session.SqlSession;

import co.yedam.common.DataSourceMybatis;
import co.yedam.user.mapper.UserMapper;
import co.yedam.user.service.UserService;
import co.yedam.user.service.UserVO;

public class UserServiceImpl implements UserService {

	SqlSession sqlSession  = DataSourceMybatis.getInstance().openSession(true);
	UserMapper mapper = sqlSession.getMapper(UserMapper.class);
	
	@Override
	public boolean addUser(UserVO vo) {
		return mapper.addUser(vo);
	}

	@Override
	public boolean editUser(UserVO vo) {
		// TODO Auto-generated method stub
		return mapper.editUser(vo);
	}

	@Override
	public boolean removeUser(UserVO vo) {
		// TODO Auto-generated method stub
		return mapper.removeUser(vo);
	}

}
