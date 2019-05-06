package com.feedback.dao;




import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.feedback.model.Add_Course;
import com.feedback.model.Signup;
import com.feedback.model.Store_Enroll;
import com.feedback.model.Store_Feedback;

@Repository
public class Signup_dao implements Signup_interface {
	@Autowired
	SessionFactory sf;
	@Override
	@Transactional
	public String add(String id,String username1,String password1,String roll1)
	{
		Signup tempsignup=new Signup(id,username1,password1,roll1);
		Session session=sf.getCurrentSession();
		session.save(tempsignup);
		
	return null;
	}
	@Transactional
	public List show_feedback()
	{
		Session s=sf.getCurrentSession();
		List<Store_Feedback> feedback=s.createQuery("from Store_Feedback").list();
		List<String> b=new ArrayList<String>();
		for(int i=1;i<=feedback.size();i++)
		{
			
			b.add(feedback.get(i-1).getFeedback());
		}
		return b;
	}
	@Transactional
	@Override
	public Signup check_login(String username,String password)
	{
		Session session=sf.getCurrentSession();
		Signup check=session.get(Signup.class, username+"_01");
		if(check!=null)
		{
			return check;
		}
		else {
			return null;
		}
		
	}
	@Transactional
	public Signup check_login1(String username,String password)
	{
		Session session=sf.getCurrentSession();
		Signup check=session.get(Signup.class, username+"_02");
		if(check!=null)
		{
			return check;
		}
		else {
			return null;
		}
		
	}
	@Transactional
	public List read_course(String stud_semester)
	{
		Session s=sf.getCurrentSession();
		List<Add_Course> course=s.createQuery("from Add_Course").list();
		List<String> b=new ArrayList<String>();
		for(int i=1;i<=course.size();i++)
		{
			if(course.get(i-1).getSemester().equals(stud_semester))
			{
			b.add(course.get(i-1).getCourse_id());
			b.add(course.get(i-1).getCourse_name());
			}
		}
		return b;
	}
	@Transactional
	public String check_enroll(String check,String semester) {
		Session s=sf.getCurrentSession();
		List<Store_Enroll> checkenroll=s.createQuery("from Store_Enroll").list();
		int j=0;
		if(checkenroll!=null)
		{
		for(int i=0;i<checkenroll.size();i=i+1)
		{
		if(checkenroll.get(i).getId().equals(check) && checkenroll.get(i).getSemester().equals(semester))
		{
			j=j+1;
			break;
		}
		
		}
		}
		if(j>0)
		{
			return "Enrolled";
		}
		else
		{
			return "Not_Enrolled";
		}
	}
	@Transactional
	public String Read_courseId(String username) {
		Session s=sf.getCurrentSession();
		List<String> courseid=s.createQuery("select se.course_id from Store_Enroll se where se.id="+"'"+username+"'").list();
		return courseid.get(0);
	}
	@Transactional
	public String Read_staff(String Course_Id) {
		Session s=sf.getCurrentSession();
		String[] course_id=Course_Id.split(",");
		List<String> staff1 = new ArrayList<String> ();
		for(int i=0;i<course_id.length;i++)
		{
			List<String> staff2=s.createQuery("select ac.staff from Add_Course ac where ac.course_id="+"'"+course_id[i]+"'").list();
			staff1.add(staff2.get(0));
		}
		String staff="";
		for(String i:staff1)
		{
			staff +=i+",";
		}
		return staff;
	}
	@Transactional
	public String Read_feedback() {
		Session s=sf.getCurrentSession();
		List<String> feedback1=s.createQuery("select sf.feedback from Store_Feedback sf").list();
		String feedback="";
		for(String i:feedback1)
		{
			feedback+=i+",";
		}
		return feedback;
	}
	@Transactional
	public String read_semester(String courseid) {
		Session s=sf.getCurrentSession();
		List<String> semester=s.createQuery("select ac.semester from Add_Course ac where ac.course_id="+"'"+courseid+"'").list();
		return semester.get(0);
	}
}
