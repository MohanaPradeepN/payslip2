package com.feedback.model;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="courses")
public class Enroll1 {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	@Column(name="roll_no")
	private String roll_no;
	@Column(name="enroll1")
	private String enroll1;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRoll_no() {
		return roll_no;
	}
	public void setRoll_no(String roll_no) {
		this.roll_no = roll_no;
	}
	public String getEnroll1() {
		return enroll1;
	}
	public void setEnroll1(String enroll1) {
		this.enroll1 = enroll1;
	}
	public Enroll1() {
		
	}
	public Enroll1(String roll_no, String enroll1) {
		
		this.roll_no = roll_no;
		this.enroll1 = enroll1;
	}
	
	
}
