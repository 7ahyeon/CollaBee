package com.spring.collabee.faq;

import java.util.List;

public interface FaqService {
	//FAQ 자주묻는질문
	void insertFaq(FaqVO vo);
	void updateFaq(FaqVO vo);
	void deletFaq(FaqVO vo);
	FaqVO getFaq(FaqVO vo);
	List<FaqVO> getFaqList(FaqVO vo);
}
