package com.spring.collabee.collections;

import java.util.List;

public interface CollectionsService {
	
		List<CategoriesVO> getCategories(); 
		List<DivisionVO> getDivision();
		List<DivisionVO> getDivision(int categoryNum);
}
