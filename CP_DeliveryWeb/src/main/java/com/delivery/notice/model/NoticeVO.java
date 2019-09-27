package com.delivery.notice.model;

import java.util.Date;

public class NoticeVO {

	private Integer ntc_No;
	private String ntc_Title;
	private String ntc_Content;
	private Date ntc_RegDate;
	private String ntc_Division;
	
	
	public Integer getNtc_No() {
		return ntc_No;
	}
	public void setNtc_No(Integer ntc_No) {
		this.ntc_No = ntc_No;
	}
	public String getNtc_Title() {
		return ntc_Title;
	}
	public void setNtc_Title(String ntc_Title) {
		this.ntc_Title = ntc_Title;
	}
	public String getNtc_Content() {
		return ntc_Content;
	}
	public void setNtc_Content(String ntc_Content) {
		this.ntc_Content = ntc_Content;
	}
	public Date getNtc_RegDate() {
		return ntc_RegDate;
	}
	public void setNtc_RegDate(Date ntc_RegDate) {
		this.ntc_RegDate = ntc_RegDate;
	}
	public String getNtc_Division() {
		return ntc_Division;
	}
	public void setNtc_Division(String ntc_Division) {
		this.ntc_Division = ntc_Division;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [ntc_No=" + ntc_No + ", ntc_Title=" + ntc_Title + ", ntc_Content=" + ntc_Content
				+ ", ntc_RegDate=" + ntc_RegDate + ", ntc_Division=" + ntc_Division + "]";
	}
	
	
	
}
