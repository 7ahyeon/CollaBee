package com.spring.collabee.biz.goods;
import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;
public class GoodsReviewVO {
	private int reviewNum, orderNum, productNum, memberNum, rec, point;
	private String rContent, rOriFilename, rSysFilename;
	private Date rDate;

	public GoodsReviewVO() {
		System.out.println("GoodsReview() 객체 생성");
	}

	//파일업로드를 위한 데이터 저장용
	private MultipartFile uploadFile;
	
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public int getRec() {
		return rec;
	}
	public void setRec(int rec) {
		this.rec = rec;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public String getrOriFilename() {
		return rOriFilename;
	}
	public void setrOriFilename(String rOriFilename) {
		this.rOriFilename = rOriFilename;
	}
	public String getrSysFilename() {
		return rSysFilename;
	}
	public void setrSysFilename(String rSysFilename) {
		this.rSysFilename = rSysFilename;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	
	
	
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
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
		return "GoodsReviewVO [reviewNum=" + reviewNum + ", orderNum=" + orderNum + ", productNum=" + productNum
				+ ", memberNum=" + memberNum + ", rec=" + rec + ", point=" + point + ", rContent=" + rContent
				+ ", rOriFilename=" + rOriFilename + ", rSysFilename=" + rSysFilename + ", rDate=" + rDate
				+ ", uploadFile=" + uploadFile + "]";
	}
	
	
	
	
	
	
}