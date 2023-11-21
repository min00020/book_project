package co.yedam.user.service;

public interface KakaoService {
	public boolean addKakaoUser(kakaoVO vo);
	public kakaoVO IdCheck(String kakaoId);
	public kakaoVO loginCheck(String kakaoId, String kakaoPw);

}
