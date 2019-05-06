package com.feedback.dao;

import java.util.List;

import com.feedback.model.Enroll1;
import com.feedback.model.Signup;

public interface Signup_interface {
	public String add(String id,String username1,String Password1,String roll1);
	public Signup check_login(String username,String password);
	public Signup check_login1(String username,String password);
	public List show_feedback();
	public List read_course(String stud_semester);
	public String check_enroll(String check,String semester);
	public String Read_staff(String Course_Id);
	public String Read_feedback();
	public String Read_courseId(String username);
	public String read_semester(String courseid);
}
