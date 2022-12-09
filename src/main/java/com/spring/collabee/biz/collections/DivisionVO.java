package com.spring.collabee.biz.collections;

public class DivisionVO {

	private int divisionNum, categoryNum;
	private String division;
	
	
	@Override
	public String toString() {
		return "DivisionVO [divisionNum=" + divisionNum + ", categoryNum=" + categoryNum + ", division=" + division
				+ "]";
	}
	public int getDivisionNum() {
		return divisionNum;
	}
	public void setDivisionNum(int divisionNum) {
		this.divisionNum = divisionNum;
	}
	public int getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	
	
	public DivisionVO(int divisionNum, int categoryNum, String division) {
		super();
		this.divisionNum = divisionNum;
		this.categoryNum = categoryNum;
		this.division = division;
	}
	public DivisionVO() {
		super();
	}
}
