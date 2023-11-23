package co.yedam.user.service;

import org.apache.ibatis.annotations.Param;

public interface KakaoService {
	public boolean addKakaoUser(kakaoVO vo);
	public kakaoVO IdCheck(String kakaoId);
	public kakaoVO loginCheck(String kakaoId, String kakaoPw);
	public boolean delete(String kakaoId, String kakaoPw);

}
