package com.feedback.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="store_stud_feedback")
public class Store_Stud_Feedback {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="s_no")
	private int s_no;
	@Column(name="username")
	private String username;
	@Column(name="semester")
	private String semester;
	@Column(name="feedback")
	private String feedback;
	@Column(name="value")
	private String value;
	@Column(name="staff")
	private String staff;
	@Column(name="courseid")
	private String courseid;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getStaff() {
		return staff;
	}
	public void setStaff(String staff) {
		this.staff = staff;
	}
	public String getCourseid() {
		return courseid;
	}
	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}
	public Store_Stud_Feedback(String username, String semester, String feedback, String value, String staff,
			String courseid) {
		this.username = username;
		this.semester = semester;
		this.feedback = feedback;
		this.value = value;
		this.staff = staff;
		this.courseid = courseid;
	}
	public Store_Stud_Feedback() {
	}
	

}
