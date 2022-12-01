package com.spring.collabee.biz.couponBox;

public class CouponBoxVO {
	int memberNum; 
	String issueDate; //발급일
	int couponNum;
	String usageDate, usageState;
	
	
	
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getIssueDate() {
		return issueDate;
	}
	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}
	public int getCouponNum() {
		return couponNum;
	}
	public void setCouponNum(int couponNum) {
		this.couponNum = couponNum;
	}
	public String getUsageDate() {
		return usageDate;
	}
	public void setUsageDate(String usageDate) {
		this.usageDate = usageDate;
	}
	public String getUsageState() {
		return usageState;
	}
	public void setUsageState(String usageState) {
		this.usageState = usageState;
	}
	@Override
	public String toString() {
		return "CouponBoxVO [memberNum=" + memberNum + ", issueDate=" + issueDate + ", couponNum=" + couponNum
				+ ", usageDate=" + usageDate + ", usageState=" + usageState + "]";
	}
	
	
}
