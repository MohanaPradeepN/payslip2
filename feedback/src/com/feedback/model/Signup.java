package com.feedback.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="signup")
public class Signup {
	@Id
	@Column(name = "id")
	private String id;
	@Column(name = "username1")
	private String username1;
	@Column(name = "password1")
	private String password1;
	@Column(name="roll1")
	private String roll1;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUsername1() {
		return username1;
	}
	public void setUsername1(String username1) {
		this.username1 = username1;
	}
	public String getPassword1() {
		return password1;
	}
	public void setPassword1(String password1) {
		this.password1 = password1;
	}
	public String getRoll1() {
		return roll1;
	}
	public void setRoll1(String roll1) {
		this.roll1 = roll1;
	}
	public Signup(String id, String username1, String password1, String roll1) {
		
		this.id = id;
		this.username1 = username1;
		this.password1 = password1;
		this.roll1 = roll1;
	}
	public Signup() {
		
	}
	
	
	
}
