package com.delivery.board.vo;

public class DeliveryVO {

	long waybill;
	long reservation;
	String name;
	
	public long getWaybill() {
		return waybill;
	}
	public void setWaybill_Num(long waybill_Num) {
		this.waybill = waybill_Num;
	}
	public long getReservation() {
		return reservation;
	}
	public void setReservation(long reservation) {
		this.reservation = reservation;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
