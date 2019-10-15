package com.delivery.support.model;

public class InquiryVO {

	private int inquiryNo;
	private long waybillNum;
	private String name;
	private String phone;
	private String addr;
	private String addr2;
	private String inquiryType;
	private String productName;
	private String title;
	private String content;
	
	
	public int getInquiryNo() {
		return inquiryNo;
	}
	public void setInquiryNo(int inquiryNo) {
		this.inquiryNo = inquiryNo;
	}
	public long getWaybillNum() {
		return waybillNum;
	}
	public void setWaybillNum(long waybillNum) {
		this.waybillNum = waybillNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getInquiryType() {
		return inquiryType;
	}
	public void setInquiryType(String inquiryType) {
		this.inquiryType = inquiryType;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "InquiryVO [waybillNum=" + waybillNum + ", name=" + name + ", phone=" + phone + ", addr=" + addr
				+ ", addr2=" + addr2 + ", inquiryType=" + inquiryType + ", productName=" + productName + ", title=" + title
				+ ", content=" + content + "]";
	}
	
}
