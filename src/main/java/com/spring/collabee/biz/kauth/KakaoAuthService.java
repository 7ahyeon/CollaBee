package com.spring.collabee.biz.kauth;

import java.util.HashMap;

public interface KakaoAuthService {
	String getKakaoAccessToken(String code);
	HashMap<String, Object> getMeberInfo(String token);

}
