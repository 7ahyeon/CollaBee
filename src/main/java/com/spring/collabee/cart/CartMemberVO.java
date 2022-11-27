package com.spring.collabee.cart;

import java.sql.Date;

public class CartMemberVO {
	private int memberNum;
	private String id, password, name, email, phone, address, gender, birth;
	private int grade;
	private Date regdate;
	private int emoney, memberState, agreeState, leaveDate;
	private String addressDetail;
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getEmoney() {
		return emoney;
	}
	public void setEmoney(int emoney) {
		this.emoney = emoney;
	}
	public int getMemberState() {
		return memberState;
	}
	public void setMemberState(int memberState) {
		this.memberState = memberState;
	}
	public int getAgreeState() {
		return agreeState;
	}
	public void setAgreeState(int agreeState) {
		this.agreeState = agreeState;
	}
	public int getLeaveDate() {
		return leaveDate;
	}
	public void setLeaveDate(int leaveDate) {
		this.leaveDate = leaveDate;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	@Override
	public String toString() {
		return "CartMemberVO [memberNum=" + memberNum + ", id=" + id + ", password=" + password + ", name=" + name
				+ ", email=" + email + ", phone=" + phone + ", address=" + address + ", gender=" + gender + ", birth="
				+ birth + ", grade=" + grade + ", regdate=" + regdate + ", emoney=" + emoney + ", memberState="
				+ memberState + ", agreeState=" + agreeState + ", leaveDate=" + leaveDate + ", addressDetail="
				+ addressDetail + "]";
	}
	
	
}
