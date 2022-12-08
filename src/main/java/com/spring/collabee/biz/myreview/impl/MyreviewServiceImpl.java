package com.spring.collabee.biz.myreview.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.myreview.MyReviewService;
import com.spring.collabee.biz.myreview.MyReviewVO;

@Service("myReviewService")
public class MyreviewServiceImpl implements MyReviewService {
	@Autowired
	MyReviewDAO myReviewDAO;
	
	@Override
	public List<MyReviewVO> getMyReview(Map<String, String> reviewStatus) {
		return myReviewDAO.getMyReview(reviewStatus);
	}

}
