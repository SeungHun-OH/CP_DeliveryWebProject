package com.delivery.board.model;

public class SearchDTO {

	private long waybill_Num;
	private String phone_Num;
	private String user_name;
	private String user_email;
	private long reservation_Num;
	
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
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public long getReservation_Num() {
		return reservation_Num;
	}
	
	public void setReservation_Num(long reservation_Num) {
		this.reservation_Num = reservation_Num;
	}
	
	@Override
	public String toString() {
		return "SearchDTO [waybill_Num=" + waybill_Num + ", phone_Num=" + phone_Num + ", user_name=" + user_name
				+ ", user_email=" + user_email + ", reservation_Num=" + reservation_Num + "]";
	}
}
