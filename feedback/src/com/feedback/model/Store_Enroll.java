package com.feedback.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="stud_enroll")
public class Store_Enroll {
	@Id
	@Column(name="id")
	String id;
	@Column(name="semester")
	public String semester;
	@Column(name="course_id")
	String course_id;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public String getCourse_id() {
		return course_id;
	}
	public void setCourse_id(String course_id) {
		this.course_id = course_id;
	}
	public Store_Enroll(String id, String semester, String course_id) {
		this.id = id;
		this.semester = semester;
		this.course_id = course_id;
	}
	public Store_Enroll() {
	}
	
	
	

}
