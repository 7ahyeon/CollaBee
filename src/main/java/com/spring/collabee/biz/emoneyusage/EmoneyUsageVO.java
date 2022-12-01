package com.spring.collabee.biz.emoneyusage;

public class EmoneyUsageVO {
	int memberNum;
	int orderNum;
	String saveDate;
	int amount;
	String usageDate;
	int usageAmount;
	int totalEmoney;
	String emoneyHistory;
	String expirationDate;
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public String getSaveDate() {
		return saveDate;
	}
	public void setSaveDate(String saveDate) {
		this.saveDate = saveDate;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getUsageDate() {
		return usageDate;
	}
	public void setUsageDate(String usageDate) {
		this.usageDate = usageDate;
	}
	public int getUsageAmount() {
		return usageAmount;
	}
	public void setUsageAmount(int usageAmount) {
		this.usageAmount = usageAmount;
	}
	public int getTotalEmoney() {
		return totalEmoney;
	}
	public void setTotalEmoney(int totalEmoney) {
		this.totalEmoney = totalEmoney;
	}
	public String getEmoneyHistory() {
		return emoneyHistory;
	}
	public void setEmoneyHistory(String emoneyHistory) {
		this.emoneyHistory = emoneyHistory;
	}
	public String getExpirationDate() {
		return expirationDate;
	}
	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}
	@Override
	public String toString() {
		return "EmoneyUsageVO [memberNum=" + memberNum + ", orderNum=" + orderNum + ", saveDate=" + saveDate
				+ ", amount=" + amount + ", usageDate=" + usageDate + ", usageAmount=" + usageAmount + ", totalEmoney="
				+ totalEmoney + ", emoneyHistory=" + emoneyHistory + ", expirationDate=" + expirationDate + "]";
	}
	
	
	
	
}
