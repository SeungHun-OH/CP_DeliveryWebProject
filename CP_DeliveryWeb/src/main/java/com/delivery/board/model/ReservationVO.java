package com.delivery.board.model;

import java.util.Calendar;

public class ReservationVO {
	private String se_name;
	private String se_phone;
	private String se_phone2;
	private String se_addr;
	private String se_addr2;
	private String se_email;
	private String se_resDate;
	private String se_req;
	private String se_reqContents;
	private String re_name;
	private String re_phone;
	private String re_phone2;
	private String re_addr;
	private String re_addr2;
	private String item_name;
	private int item_price;
	private int item_count;
	private String item_weight;
	private String item_fare;
	private int item_farePrice;
	private long res_number;
	
	
	public String getSe_name() {
		return se_name;
	}
	public void setSe_name(String se_name) {
		this.se_name = se_name;
	}
	public String getSe_phone() {
		return se_phone;
	}
	public void setSe_phone(String se_phone) {
		this.se_phone = se_phone;
	}
	public String getSe_phone2() {
		return se_phone2;
	}
	public void setSe_phone2(String se_phone2) {
		this.se_phone2 = se_phone2;
	}
	public String getSe_addr() {
		return se_addr;
	}
	public void setSe_addr(String se_addr) {
		this.se_addr = se_addr;
	}
	public String getSe_addr2() {
		return se_addr2;
	}
	public void setSe_addr2(String se_addr2) {
		this.se_addr2 = se_addr2;
	}
	public String getSe_email() {
		return se_email;
	}
	public void setSe_email(String se_email) {
		this.se_email = se_email;
	}
	public String getSe_resDate() {
		return se_resDate;
	}
	public void setSe_resDate(String se_resDate) {
		Calendar cal =  Calendar.getInstance();
		String year = Integer.toString(cal.get(cal.YEAR));
		se_resDate=year.substring(2)+"년"+se_resDate;
		this.se_resDate = se_resDate;
	}
	public String getSe_req() {
		return se_req;
	}
	public void setSe_req(String se_req) {
		this.se_req = se_req;
	}
	public String getSe_reqContents() {
		return se_reqContents;
	}
	public void setSe_reqContents(String se_reqContents) {
		this.se_reqContents = se_reqContents;
	}
	public String getRe_name() {
		return re_name;
	}
	public void setRe_name(String re_name) {
		this.re_name = re_name;
	}
	public String getRe_phone() {
		return re_phone;
	}
	public void setRe_phone(String re_phone) {
		this.re_phone = re_phone;
	}
	public String getRe_phone2() {
		return re_phone2;
	}
	public void setRe_phone2(String re_phone2) {
		this.re_phone2 = re_phone2;
	}
	public String getRe_addr() {
		return re_addr;
	}
	public void setRe_addr(String re_addr) {
		this.re_addr = re_addr;
	}
	public String getRe_addr2() {
		return re_addr2;
	}
	public void setRe_addr2(String re_addr2) {
		this.re_addr2 = re_addr2;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public int getItem_count() {
		return item_count;
	}
	public void setItem_count(int item_count) {
		this.item_count = item_count;
	}
	public String getItem_weight() {
		return item_weight;
	}
	public void setItem_weight(String item_weight) {
		this.item_weight = item_weight;
	}
	public String getItem_fare() {
		return item_fare;
	}
	public void setItem_fare(String item_fare) {
		this.item_fare = item_fare;
	}
	public int getItem_farePrice() {
		return item_farePrice;
	}
	public void setItem_farePrice(int item_farePrice) {
		this.item_farePrice = item_farePrice;
	}
	public long getRes_number() {
		return res_number;
	}
	public void setRes_number(long res_number) {
		this.res_number = res_number;
	}
	
	@Override
	public String toString() {
		return "ReservationVO [se_name=" + se_name + ", se_phone=" + se_phone + ", se_phone2=" + se_phone2
				+ ", se_addr=" + se_addr + ", se_addr2=" + se_addr2 + ", se_email=" + se_email + ", se_resDate="
				+ se_resDate + ", se_req=" + se_req + ", se_reqContents=" + se_reqContents + ", re_name=" + re_name
				+ ", re_phone=" + re_phone + ", re_phone2=" + re_phone2 + ", re_addr=" + re_addr + ", re_addr2="
				+ re_addr2 + ", item_name=" + item_name + ", item_price=" + item_price + ", item_weight=" + item_weight
				+ ", item_fare=" + item_fare + ", item_farePrice=" + item_farePrice + ", res_number=" + res_number
				+ "]";
	}
	
}
	
	
	