package com.spring.collabee.biz.goods;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class GoodsVO {

	private int productNum, price, disRate, saleprice, count, stock, deliveryCode, divisionNum, storageNum;
	private String productName, pDescription, thumOriFilename, thumSysFilename, detaileOriFilename,
					detaileSysFilename, seller, productDel, division, condition, deliveryType, deDescription;
	private Date regdate, disDate;
	
	//파일업로드를 위한 데이터 저장용
	private MultipartFile uploadFile;
	
	
	// 제이슨용 필드(옵션선택)
	@JsonIgnore
	private String categoryType;
	@JsonIgnore
	private String priceRange;
	@JsonIgnore
	private String benefitType;
	
	private String priceStart;
	private String priceEnd;
	
	private List<String> typeList;
	
	
	
	public GoodsVO() {
		System.out.println("GoodsVO 객체 생성~");
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



	public int getCount() {
		return count;
	}



	public void setCount(int count) {
		this.count = count;
	}



	public int getStock() {
		return stock;
	}



	public void setStock(int stock) {
		this.stock = stock;
	}



	public int getDeliveryCode() {
		return deliveryCode;
	}



	public void setDeliveryCode(int deliveryCode) {
		this.deliveryCode = deliveryCode;
	}



	public int getDivisionNum() {
		return divisionNum;
	}



	public void setDivisionNum(int divisionNum) {
		this.divisionNum = divisionNum;
	}



	public int getStorageNum() {
		return storageNum;
	}



	public void setStorageNum(int storageNum) {
		this.storageNum = storageNum;
	}



	public String getProductName() {
		return productName;
	}



	public void setProductName(String productName) {
		this.productName = productName;
	}



	public String getpDescription() {
		return pDescription;
	}



	public void setpDescription(String pDescription) {
		this.pDescription = pDescription;
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
		return detaileOriFilename;
	}



	public void setDetaileOriFilename(String detaileOriFilename) {
		this.detaileOriFilename = detaileOriFilename;
	}



	public String getDetaileSysFilename() {
		return detaileSysFilename;
	}



	public void setDetaileSysFilename(String detaileSysFilename) {
		this.detaileSysFilename = detaileSysFilename;
	}



	public String getSeller() {
		return seller;
	}



	public void setSeller(String seller) {
		this.seller = seller;
	}



	public String getProductDel() {
		return productDel;
	}



	public void setProductDel(String productDel) {
		this.productDel = productDel;
	}



	public String getDivision() {
		return division;
	}



	public void setDivision(String division) {
		this.division = division;
	}



	public String getCondition() {
		return condition;
	}



	public void setCondition(String condition) {
		this.condition = condition;
	}



	public String getDeliveryType() {
		return deliveryType;
	}



	public void setDeliveryType(String deliveryType) {
		this.deliveryType = deliveryType;
	}



	public String getDeDescription() {
		return deDescription;
	}



	public void setDeDescription(String deDescription) {
		this.deDescription = deDescription;
	}



	public Date getRegdate() {
		return regdate;
	}



	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}



	public Date getDisDate() {
		return disDate;
	}



	public void setDisDate(Date disDate) {
		this.disDate = disDate;
	}



	public String getCategoryType() {
		return categoryType;
	}



	public void setCategoryType(String categoryType) {
		this.categoryType = categoryType;
	}



	public String getPriceRange() {
		return priceRange;
	}



	public void setPriceRange(String priceRange) {
		this.priceRange = priceRange;
	}



	public String getBenefitType() {
		return benefitType;
	}



	public void setBenefitType(String benefitType) {
		this.benefitType = benefitType;
	}



	public String getPriceStart() {
		return priceStart;
	}



	public void setPriceStart(String priceStart) {
		this.priceStart = priceStart;
	}



	public String getPriceEnd() {
		return priceEnd;
	}



	public void setPriceEnd(String priceEnd) {
		this.priceEnd = priceEnd;
	}



	public List<String> getTypeList() {
		return typeList;
	}



	public void setTypeList(List<String> typeList) {
		this.typeList = typeList;
	}



	//파일 업로드 ------
	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}



	@Override
	public String toString() {
		return "GoodsVO [productNum=" + productNum + ", price=" + price + ", disRate=" + disRate + ", saleprice="
				+ saleprice + ", count=" + count + ", stock=" + stock + ", deliveryCode=" + deliveryCode
				+ ", divisionNum=" + divisionNum + ", storageNum=" + storageNum + ", productName=" + productName
				+ ", pDescription=" + pDescription + ", thumOriFilename=" + thumOriFilename + ", thumSysFilename="
				+ thumSysFilename + ", detaileOriFilename=" + detaileOriFilename + ", detaileSysFilename="
				+ detaileSysFilename + ", seller=" + seller + ", productDel=" + productDel + ", division=" + division
				+ ", condition=" + condition + ", deliveryType=" + deliveryType + ", deDescription=" + deDescription
				+ ", regdate=" + regdate + ", disDate=" + disDate + ", uploadFile=" + uploadFile + ", categoryType="
				+ categoryType + ", priceRange=" + priceRange + ", benefitType=" + benefitType + ", priceStart="
				+ priceStart + ", priceEnd=" + priceEnd + ", typeList=" + typeList + "]";
	}



	public GoodsVO(int productNum, int price, int disRate, int saleprice, int count, int stock, int deliveryCode,
			int divisionNum, int storageNum, String productName, String pDescription, String thumOriFilename,
			String thumSysFilename, String detaileOriFilename, String detaileSysFilename, String seller,
			String productDel, String division, String condition, String deliveryType, String deDescription,
			Date regdate, Date disDate, MultipartFile uploadFile, String categoryType, String priceRange,
			String benefitType, String priceStart, String priceEnd, List<String> typeList) {
		super();
		this.productNum = productNum;
		this.price = price;
		this.disRate = disRate;
		this.saleprice = saleprice;
		this.count = count;
		this.stock = stock;
		this.deliveryCode = deliveryCode;
		this.divisionNum = divisionNum;
		this.storageNum = storageNum;
		this.productName = productName;
		this.pDescription = pDescription;
		this.thumOriFilename = thumOriFilename;
		this.thumSysFilename = thumSysFilename;
		this.detaileOriFilename = detaileOriFilename;
		this.detaileSysFilename = detaileSysFilename;
		this.seller = seller;
		this.productDel = productDel;
		this.division = division;
		this.condition = condition;
		this.deliveryType = deliveryType;
		this.deDescription = deDescription;
		this.regdate = regdate;
		this.disDate = disDate;
		this.uploadFile = uploadFile;
		this.categoryType = categoryType;
		this.priceRange = priceRange;
		this.benefitType = benefitType;
		this.priceStart = priceStart;
		this.priceEnd = priceEnd;
		this.typeList = typeList;
	}
	
	
	
	
}

