package com.delivery.board.model;

public class SearchDTO {

	private long waybill_Num;
	private String phone_Num;
	
	public long getWaybill_Num() {
		return waybill_Num;
	}
	public void setWaybill_Num(long waybill_Num) {
		this.waybill_Num = waybill_Num;
	}
	public String getPhone_Num() {
		return phone_Num;
	}
	public void setPhone_Num(String phone_Num) {
		this.phone_Num = phone_Num;
	}
	
	@Override
	public String toString() {
		return "SearchDTO [waybill_Num=" + waybill_Num + ", phone_Num=" + phone_Num + "]";
	}
	
	
}
