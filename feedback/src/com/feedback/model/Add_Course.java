package com.feedback.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="add_course")
public class Add_Course {
	@Id
	@Column(name = "id")
	private String id;
	@Column(name="course_id")
	private String course_id;
	@Column(name="course_name")
	private String course_name;
	@Column(name="semester")
	private String semester;
	@Column(name="staff")
	private String staff;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCourse_id() {
		return course_id;
	}
	public void setCourse_id(String course_id) {
		this.course_id = course_id;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public String getStaff() {
		return staff;
	}
	public void setStaff(String staff) {
		this.staff = staff;
	}
	public Add_Course(String id, String course_id, String course_name, String semester, String staff) {
		
		this.id = id;
		this.course_id = course_id;
		this.course_name = course_name;
		this.semester = semester;
		this.staff = staff;
	}
	public Add_Course() {
		
	}
	
	
}
