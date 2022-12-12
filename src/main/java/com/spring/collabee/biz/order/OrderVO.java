package com.spring.collabee.biz.order;

import java.sql.Timestamp;

public class OrderVO {
	private int orderNum;
	private String orderName, orderPhone, orderAddr, orderPlace, orderRequest;
	private Timestamp deliveryPick;
	private int deliveryFee, totGoodsprice, totDiscount, totPrice, couponNum, usageAmount, ptNum, memberNum;
	private String ptInstallment, orderAddrDetail, nmemberNum;
	
	public OrderVO() {
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getOrderPhone() {
		return orderPhone;
	}

	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}

	public String getOrderAddr() {
		return orderAddr;
	}

	public void setOrderAddr(String orderAddr) {
		this.orderAddr = orderAddr;
	}

	public String getOrderPlace() {
		return orderPlace;
	}

	public void setOrderPlace(String orderPlace) {
		this.orderPlace = orderPlace;
	}

	public String getOrderRequest() {
		return orderRequest;
	}

	public void setOrderRequest(String orderRequest) {
		this.orderRequest = orderRequest;
	}

	public Timestamp getDeliveryPick() {
		return deliveryPick;
	}

	public void setDeliveryPick(Timestamp deliveryPick) {
		this.deliveryPick = deliveryPick;
	}

	public int getDeliveryFee() {
		return deliveryFee;
	}

	public void setDeliveryFee(int deliveryFee) {
		this.deliveryFee = deliveryFee;
	}

	public int getTotGoodsprice() {
		return totGoodsprice;
	}

	public void setTotGoodsprice(int totGoodsprice) {
		this.totGoodsprice = totGoodsprice;
	}

	public int getTotDiscount() {
		return totDiscount;
	}

	public void setTotDiscount(int totDiscount) {
		this.totDiscount = totDiscount;
	}

	public int getTotPrice() {
		return totPrice;
	}

	public void setTotPrice(int totPrice) {
		this.totPrice = totPrice;
	}

	public int getCouponNum() {
		return couponNum;
	}

	public void setCouponNum(int couponNum) {
		this.couponNum = couponNum;
	}

	public int getUsageAmount() {
		return usageAmount;
	}

	public void setUsageAmount(int usageAmount) {
		this.usageAmount = usageAmount;
	}

	public int getPtNum() {
		return ptNum;
	}

	public void setPtNum(int ptNum) {
		this.ptNum = ptNum;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public String getPtInstallment() {
		return ptInstallment;
	}

	public void setPtInstallment(String ptInstallment) {
		this.ptInstallment = ptInstallment;
	}

	public String getOrderAddrDetail() {
		return orderAddrDetail;
	}

	public void setOrderAddrDetail(String orderAddrDetail) {
		this.orderAddrDetail = orderAddrDetail;
	}

	public String getNmemberNum() {
		return nmemberNum;
	}

	public void setNmemberNum(String nmemberNum) {
		this.nmemberNum = nmemberNum;
	}

	@Override
	public String toString() {
		return "OrderVO [orderNum=" + orderNum + ", orderName=" + orderName + ", orderPhone=" + orderPhone
				+ ", orderAddr=" + orderAddr + ", orderPlace=" + orderPlace + ", orderRequest=" + orderRequest
				+ ", deliveryPick=" + deliveryPick + ", deliveryFee=" + deliveryFee + ", totGoodsprice=" + totGoodsprice
				+ ", totDiscount=" + totDiscount + ", totPrice=" + totPrice + ", couponNum=" + couponNum
				+ ", usageAmount=" + usageAmount + ", ptNum=" + ptNum + ", memberNum=" + memberNum + ", ptInstallment="
				+ ptInstallment + ", orderAddrDetail=" + orderAddrDetail + ", nmemberNum=" + nmemberNum + "]";
	}

	
	
	
}
