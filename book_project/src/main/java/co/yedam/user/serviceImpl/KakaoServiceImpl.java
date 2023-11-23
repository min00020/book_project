package co.yedam.user.serviceImpl;

import org.apache.ibatis.session.SqlSession;

import co.yedam.common.DataSourceMybatis;
import co.yedam.user.mapper.KakaoMapper;
import co.yedam.user.service.KakaoService;
import co.yedam.user.service.kakaoVO;

public class KakaoServiceImpl implements KakaoService {
	SqlSession sqlSession  = DataSourceMybatis.getInstance().openSession(true);
	KakaoMapper mapper = sqlSession.getMapper(KakaoMapper.class);
	
	@Override
	public boolean addKakaoUser(kakaoVO vo) {
		return mapper.addKakaoUser(vo);
	}

	@Override
	public kakaoVO IdCheck(String kakaoId) {
		return mapper.IdCheck(kakaoId);
	}

	@Override
	public kakaoVO loginCheck(String kakaoId, String kakaoPw) {
		return mapper.loginCheck(kakaoId, kakaoPw);
	}

	@Override
	public boolean delete(String kakaoId, String kakaoPw) {
		return mapper.delete(kakaoId, kakaoPw);
	}

}
