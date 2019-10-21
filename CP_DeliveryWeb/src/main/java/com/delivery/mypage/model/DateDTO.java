package com.delivery.mypage.model;

public class DateDTO {

	private String startDate;
	private String endDate;
	private String loginName;
	private String phone;
	
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		if(startDate.equals(""))
			startDate = null;
		this.startDate = startDate;
	}
	public String getEndDate() {
		if(endDate.equals(""))
			endDate = null;
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Override
	public String toString() {
		return "DateDTO [startDate=" + startDate + ", endDate=" + endDate + ", loginName=" + loginName + ", phone="
				+ phone + "]";
	}
}
