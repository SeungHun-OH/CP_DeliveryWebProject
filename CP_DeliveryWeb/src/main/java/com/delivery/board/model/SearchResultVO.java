package com.delivery.board.model;

public class SearchResultVO {

	long waybill_Num;
	String sender;
	String receiver;
	String product_Name;
	String quantity;
	String step;
	String process_Time;
	String product_Status;
	String charge_Place;
	
	public long getWaybill_Num() {
		return waybill_Num;
	}
	public void setWaybill_Num(long waybill_Num) {
		this.waybill_Num = waybill_Num;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		String val = (sender.charAt(0)+"*");
		this.sender = val;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		String val = (receiver.charAt(0)+"*");
		this.receiver = val;
	}
	public String getProduct_Name() {
		return product_Name;
	}
	public void setProduct_Name(String product_Name) {
		this.product_Name = product_Name;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getStep() {
		return step;
	}
	public void setStep(String step) {
		this.step = step;
	}
	public String getProcess_Time() {
		return process_Time;
	}
	public void setProcess_Time(String process_Time) {
		this.process_Time = process_Time;
	}
	public String getProduct_Status() {
		return product_Status;
	}
	public void setProduct_Status(String product_Status) {
		this.product_Status = product_Status;
	}
	public String getCharge_Place() {
		return charge_Place;
	}
	public void setCharge_Place(String charge_Place) {
		this.charge_Place = charge_Place;
	}
	
	@Override
	public String toString() {
		return "SearchResultVO [waybill_Num=" + waybill_Num + ", sender=" + sender + ", receiver=" + receiver
				+ ", product_Name=" + product_Name + ", quantity=" + quantity + ", step=" + step + ", process_Time="
				+ process_Time + ", product_Status=" + product_Status + ", charge_Place=" + charge_Place + "]";
	}
	
}
