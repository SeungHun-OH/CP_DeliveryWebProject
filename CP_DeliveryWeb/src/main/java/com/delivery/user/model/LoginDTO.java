package com.delivery.user.model;

public class LoginDTO {

	private String user_id;
	private String user_pwd;
	private String useCookie;
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUseCookie() {
		return useCookie;
	}
	public void setUseCookie(String useCookie) {
		this.useCookie = useCookie;
	}
	
	
}
