package com.spring.collabee.admingoods;

import java.util.Date;

public class AdminGoodsVO {

	private String productName, description, condition, delivery, seller, thumOriFilename, thumSysFilename, DetaileOriFilename, DetaileSysFilename;
	private int productNum, price, disRate, saleprice, stock;
	private Date disDate, regdate;
	public AdminGoodsVO(String productName, String description, String condition, String delivery, String seller,
			String thumOriFilename, String thumSysFilename, String detaileOriFilename, String detaileSysFilename,
			int productNum, int price, int disRate, int saleprice, int stock, Date disDate, Date regdate) {
		
		this.productName = productName;
		this.description = description;
		this.condition = condition;
		this.delivery = delivery;
		this.seller = seller;
		this.thumOriFilename = thumOriFilename;
		this.thumSysFilename = thumSysFilename;
		DetaileOriFilename = detaileOriFilename;
		DetaileSysFilename = detaileSysFilename;
		this.productNum = productNum;
		this.price = price;
		this.disRate = disRate;
		this.saleprice = saleprice;
		this.stock = stock;
		this.disDate = disDate;
		this.regdate = regdate;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public String getThumOriFilename() {
		return thumOriFilename;
	}
	public void setThumOriFilename(String thumOriFilename) {
		this.thumOriFilename = thumOriFilename;
	}
	public String getThumSysFilename() {
		return thumSysFilename;
	}
	public void setThumSysFilename(String thumSysFilename) {
		this.thumSysFilename = thumSysFilename;
	}
	public String getDetaileOriFilename() {
		return DetaileOriFilename;
	}
	public void setDetaileOriFilename(String detaileOriFilename) {
		DetaileOriFilename = detaileOriFilename;
	}
	public String getDetaileSysFilename() {
		return DetaileSysFilename;
	}
	public void setDetaileSysFilename(String detaileSysFilename) {
		DetaileSysFilename = detaileSysFilename;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDisRate() {
		return disRate;
	}
	public void setDisRate(int disRate) {
		this.disRate = disRate;
	}
	public int getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public Date getDisDate() {
		return disDate;
	}
	public void setDisDate(Date disDate) {
		this.disDate = disDate;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	@Override
	public String toString() {
		return "adminVO [productName=" + productName + ", description=" + description + ", condition=" + condition
				+ ", delivery=" + delivery + ", seller=" + seller + ", thumOriFilename=" + thumOriFilename
				+ ", thumSysFilename=" + thumSysFilename + ", DetaileOriFilename=" + DetaileOriFilename
				+ ", DetaileSysFilename=" + DetaileSysFilename + ", productNum=" + productNum + ", price=" + price
				+ ", disRate=" + disRate + ", saleprice=" + saleprice + ", stock=" + stock + ", disDate=" + disDate
				+ ", regdate=" + regdate + "]";
	}

}



