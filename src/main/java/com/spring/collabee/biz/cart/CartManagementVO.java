package com.spring.collabee.biz.cart;

import java.sql.Date;

public class CartManagementVO {
	
	private int memberNum, productMum, count;
	private String nmemberNum;
	private Date nmemberLimit, addDate;
	
	public CartManagementVO() {
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public int getProductMum() {
		return productMum;
	}

	public void setProductMum(int productMum) {
		this.productMum = productMum;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getNmemberNum() {
		return nmemberNum;
	}

	public void setNmemberNum(String nmemberNum) {
		this.nmemberNum = nmemberNum;
	}

	public Date getNmemberLimit() {
		return nmemberLimit;
	}

	public void setNmemberLimit(Date nmemberLimit) {
		this.nmemberLimit = nmemberLimit;
	}

	public Date getAddDate() {
		return addDate;
	}

	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

	@Override
	public String toString() {
		return "CartManagementVO [memberNum=" + memberNum + ", productMum=" + productMum + ", count=" + count
				+ ", nmemberNum=" + nmemberNum + ", nmemberLimit=" + nmemberLimit + ", addDate=" + addDate + "]";
	}

	
	
}
