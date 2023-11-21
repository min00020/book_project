package co.yedam.user.mapper;

import org.apache.ibatis.annotations.Param;

import co.yedam.user.service.kakaoVO;

public interface KakaoMapper {
	public boolean addKakaoUser(kakaoVO vo);
	public kakaoVO IdCheck(@Param("kakaoId")String kakaoId);
	public kakaoVO loginCheck(@Param("kakaoId")String kakaoId, @Param("kakaoPw") String kakaoPw);
}
