package com.delivery.user.model;

import java.util.Date;

public class UserVO {
private String user_id;
private String user_name;
private String user_birth;
private String user_gender;
private String user_pwd;
private String user_phone;
private String user_addr;
private String user_addr2;
private String user_email;
private Date user_joinDate;
private Date user_loginDate;


public String getUser_addr2() {
	return user_addr2;
}
public void setUser_addr2(String user_addr2) {
	this.user_addr2 = user_addr2;
}
public String getUser_id() {
	return user_id;
}
public void setUser_id(String user_id) {
	this.user_id = user_id;
}
public String getUser_name() {
	return user_name;
}
public void setUser_name(String user_name) {
	this.user_name = user_name;
}
public String getUser_birth() {
	return user_birth;
}
public void setUser_birth(String user_birth) {
	this.user_birth = user_birth;
}
public String getUser_gender() {
	return user_gender;
}
public void setUser_gender(String user_gender) {
	this.user_gender = user_gender;
}
public String getUser_pwd() {
	return user_pwd;
}
public void setUser_pwd(String user_pwd) {
	this.user_pwd = user_pwd;
}
public String getUser_phone() {
	return user_phone;
}
public void setUser_phone(String user_phone) {
	this.user_phone = user_phone;
}
public String getUser_addr() {
	return user_addr;
}
public void setUser_addr(String user_addr) {
	this.user_addr = user_addr;
}
public String getUser_email() {
	return user_email;
}
public void setUser_email(String user_email) {
	this.user_email = user_email;
}
public Date getUser_joinDate() {
	return user_joinDate;
}
public void setUser_joinDate(Date user_joinDate) {
	this.user_joinDate = user_joinDate;
}
public Date getUser_loginDate() {
	return user_loginDate;
}
public void setUser_loginDate(Date user_loginDate) {
	this.user_loginDate = user_loginDate;
}

}
