package com.spring.collabee.biz.mypicklist.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.mypicklist.MyPickListVO;

@Repository
public class MyPickListDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public MyPickListDAO() {
		System.out.println("PickListDAO mybatis () 객체 생성");
	}
	public List<MyPickListVO> getPickList(MemberVO mvo) {
		System.out.println("getPickList()실행 >> ");
		return mybatis.selectList("mypageDAO.getPickList", mvo);
	}
	public int delPickList(Map<String, Integer> pickInfo) {
		System.out.println("getPickList()실행 >> ");
		return mybatis.delete("mypageDAO.delPickList", pickInfo);
	}
	
	
	
}
