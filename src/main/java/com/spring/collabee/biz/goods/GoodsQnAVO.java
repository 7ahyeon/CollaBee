package com.spring.collabee.biz.goods;
import java.sql.Date;

public class GoodsQnAVO {
	//상품 문의
		private int proQnaNum, productNum, memberNum, qSecret, aNum; 
		private String qTitle, qContent, qStatus;
		private Date qDate;

		private Date aRegdate;
		private String aContent;
		

	public GoodsQnAVO() {
		System.out.println("GoodsQnAVO() 생성 ~");
	}


	public int getProQnaNum() {
		return proQnaNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public int getqSecret() {
		return qSecret;
	}
	public void setqSecret(int qSecret) {
		this.qSecret = qSecret;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}
	public int getaNum() {
		return aNum;
	}
	public void setaNum(int aNum) {
		this.aNum = aNum;
	}
	public Date getaRegdate() {
		return aRegdate;
	}
	public void setaRegdate(Date aRegdate) {
		this.aRegdate = aRegdate;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	@Override
	public String toString() {
		return "GoodsQnAVO [proQnaNum=" + proQnaNum + ", productNum=" + productNum + ", memberNum=" + memberNum
				+ ", qSecret=" + qSecret + ", qTitle=" + qTitle + ", qContent=" + qContent + ", qStatus=" + qStatus
				+ ", qDate=" + qDate + ", aNum=" + aNum + ", aRegdate=" + aRegdate + ", aContent=" + aContent + "]";
	}





}