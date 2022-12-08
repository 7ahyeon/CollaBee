package com.spring.collabee.biz.myreview.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.collabee.biz.myreview.MyReviewVO;

@Repository
public class MyReviewDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<MyReviewVO> getMyReview(Map<String, String> reviewStatus) {
		return mybatis.selectList("mypageDAO.getMyReview", reviewStatus);
	}
	
	

}
