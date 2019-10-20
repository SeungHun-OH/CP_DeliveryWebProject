package com.delivery.mypage.model;

public class LookUpVO {

	private String productName;
	private long wabillNum;
	private String sender;
	private String processDate;
	private String deliveryStep;
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public long getWabillNum() {
		return wabillNum;
	}
	public void setWabillNum(long wabillNum) {
		this.wabillNum = wabillNum;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getProcessDate() {
		return processDate;
	}
	public void setProcessDate(String processDate) {
		this.processDate = processDate;
	}
	public String getDeliveryStep() {
		return deliveryStep;
	}
	public void setDeliveryStep(String deliveryStep) {
		this.deliveryStep = deliveryStep;
	}
	
}
