package co.yedam.user.mapper;

import co.yedam.user.service.kakaoVO;

public interface KakaoMapper {
	public boolean addKakaoUser(kakaoVO vo);
	public kakaoVO IdCheck(String kakaoId);
}
