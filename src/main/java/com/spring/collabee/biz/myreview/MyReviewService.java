package com.spring.collabee.biz.myreview;

import java.util.List;
import java.util.Map;

public interface MyReviewService {
	List<MyReviewVO> getMyReview(Map<String,String> reviewStatus);//memberNum, 리뷰작성상태
}
