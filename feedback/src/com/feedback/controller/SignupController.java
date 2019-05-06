package com.feedback.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.feedback.dao.Signup_interface;
import com.feedback.model.Add_Course;
import com.feedback.model.Signup;
import com.feedback.model.Store_Enroll;
import com.feedback.model.Store_Feedback;
import com.feedback.model.Store_Stud_Feedback;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
public class SignupController {
	@Autowired
	HttpSession pageSession;
	@Autowired
	Signup_interface sd;
	@Autowired
	HttpServletRequest request;
	@Autowired
	SessionFactory sf;
	@RequestMapping(value="/")
	public String doStart(){
		return "login-signup";
	} 
	@RequestMapping("/stud_home")
	public String stud_home() {
		if(pageSession.getAttribute("username")!=null)
		{
			return "stud-detail2";
		}
		else {
			return "login-signup";
		}
		
	}
	@RequestMapping("/staff_home")
	public String staff_home() {
		if(pageSession.getAttribute("username")!=null)
		{
			return "stud-detail";
		}
		else {
			return "login-signup";
		}
		
	}
	@RequestMapping(value="/course")
	public String doStart4(){
		if(pageSession.getAttribute("username")!=null)
		{
			return "course";
		}
		else {
			return "login-signup";
		}
		
	} 
	@RequestMapping(value="/feedback")
	public String doStart6(){
		if(pageSession.getAttribute("username")==null)
		{
			return "login-signup";
			
		}
		else {
			return "feedback";
		}
		
	} 
	@RequestMapping(value="/Add_Feedback")
	public String doStart7(){
		if(pageSession.getAttribute("username")!=null)
		{
			return "Add_Feedback";
		}
		else {
			return "login-signup";
		}
		
	}
	@RequestMapping(value="/Show_Feedback")
	@Transactional
	public String getNum(Model themodel) {
		
		List<String> numbersList = sd.show_feedback();
		themodel.addAttribute("a", numbersList);
		if(pageSession.getAttribute("username")!=null)
		{
			return "Show_Feedback";
		}
		else {
			return "login-signup";
		}
		
	}
	@RequestMapping(value="/Delete_Feedback")
	@Transactional
	public String doStart9(Model themodel){
		List<String> numbersList = sd.show_feedback();
		themodel.addAttribute("a", numbersList);
		String name="Hai";
		themodel.addAttribute("name", name);
		if(pageSession.getAttribute("username")!=null)
		{
			return "Delete_Feedback";
		}
		else {
			return "login-signup";
		}
		
	}
	@RequestMapping(value="/delete_feed")
	@Transactional
	public String delete_feed(@ModelAttribute("delete_feed") Store_Feedback thestf,Model themodel){
		String delfeed=thestf.getFeedback();
		String[] delfeed1=delfeed.split(",");
		
		List<String> numbersList = sd.show_feedback();
		String[] store_feed=new String[numbersList.size()];

		if(delfeed1.length==numbersList.size())
		{
			Session s=sf.getCurrentSession();
			s.createQuery("delete from Store_Feedback").executeUpdate();
			return "Delete_Feedback1";
		}
		else
		{
			Session s=sf.getCurrentSession();
			s.createQuery("delete from Store_Feedback").executeUpdate();
		
		int k=0;
		List<String> list = new ArrayList<String> ();
		for(int i=0;i<numbersList.size();i++)
		{
			int count=0;
			for(int j=0;j<delfeed1.length;j++)
			{
				if((delfeed1[j].equals(numbersList.get(i))))
				{
					System.out.println(numbersList.get(i));
					count++;
					break;
				}
			}
			if(count==0)
			{
				store_feed[k]=numbersList.get(i);
				System.out.println(store_feed[k]);
				k++;
			}
		}
		
		
		for(int i=0;i<k;i++)
		{
			Store_Feedback tempstf=new Store_Feedback(store_feed[i]);
			s.save(tempstf);
		}
		}
		themodel.addAttribute("name", null);
		if(pageSession.getAttribute("username")!=null)
		{
			return "Delete_Feedback1";
		}
		else {
			return "login-signup";
		}
		
	}
	@RequestMapping(value="/Delete_Feedback1")
	public String doStart5(Model themodel){
		List<String> numbersList = sd.show_feedback();
		themodel.addAttribute("a", numbersList);
		String name="Hai";
		themodel.addAttribute("name", name);
		if(pageSession.getAttribute("username")!=null)
		{
			return "Delete_Feedback";
		}
		else {
			return "login-signup";
		}
		
	}
	@RequestMapping(value="/Edit_Course1")
	public String doStart1(){
		
		if(pageSession.getAttribute("username")!=null)
		{
			return "Edit_Course";
		}
		else {
			return "login-signup";
		}
	} 	
	@RequestMapping(value="/Delete_Course1")
	public String doStart2(){
		if(pageSession.getAttribute("username")!=null)
		{
			return "Delete_Course";
		}
		else {
			return "login-signup";
		}
		
	} 
	@RequestMapping(value="/Add_Course1")
	public String doStart3(){
		if(pageSession.getAttribute("username")!=null)
		{
		return "Add_Course";
		}
		else {
			return "login-signup";
		}
	} 
	@RequestMapping(value="/signup")
	public String add(@ModelAttribute("signup") Signup tempsignup) {
		String id;
		if(tempsignup.getRoll1().equals("staff"))
		{
			id=tempsignup.getUsername1()+"_01";
		}
		else
		{
			id=tempsignup.getUsername1()+"_02";
		}
		sd.add(id,tempsignup.getUsername1(),tempsignup.getPassword1(),tempsignup.getRoll1());
		if(tempsignup.getRoll1().equals("staff"))
		{
		return "stud-detail";
		}
		else
		{
		return "stud-detail2";
		}
	}
	@RequestMapping(value="/login")
	@Transactional
	public String add1(Model themodel) {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		Signup tempsignup=sd.check_login(username, password);
		if(tempsignup!=null)
		{
			if(tempsignup.getUsername1().equals(username) && tempsignup.getPassword1().equals(password))
			{
			pageSession.setAttribute("username", tempsignup.getUsername1());
			pageSession.setAttribute("checkenroll", "welcome");
			pageSession.setAttribute("course_id", "nr");
			pageSession.setAttribute("staff", "nr");
			pageSession.setAttribute("report", "notgathered");
			themodel.addAttribute("message","");
			return "stud-detail";
			}
			else {
				themodel.addAttribute("message","error");
				return "login-signup";
			}
		}
		Signup tempsignup1=sd.check_login1(username, password);
		if(tempsignup1!=null) {
			if(tempsignup1.getUsername1().equals(username) && tempsignup1.getPassword1().equals(password))
			{
			pageSession.setAttribute("username", tempsignup1.getUsername1());
			pageSession.setAttribute("checkenroll", "welcome");
			pageSession.setAttribute("all", "notdone");
			pageSession.setAttribute("course_id", "nr");
			pageSession.setAttribute("staff", "nr");
			themodel.addAttribute("message","");
			return "stud-detail2";
			}
			else {
				themodel.addAttribute("message","error");
				return "login-signup";
			}
		}
		themodel.addAttribute("message","not_exist");
		return "login-signup";
		
	}
	
	
	

	@RequestMapping(value="/addcourse")
	@Transactional
	public String add_course(@ModelAttribute("addcourse") Add_Course tempaddcourse) {
		
		Session s=sf.getCurrentSession();
		tempaddcourse.setId(tempaddcourse.getCourse_id());
		s.save(tempaddcourse);
		if(pageSession.getAttribute("username")!=null)
		{
			return "Add_Course";
		}
		else {
			return "login-signup";
		}
		
	}
	
	@RequestMapping(value="/deletecourse")
	@Transactional
	public String delete_course(@ModelAttribute("deletecourse") Add_Course tempaddcourse) {
		String a=request.getParameter("course_code_delete");
		
		Session s=sf.getCurrentSession();
		tempaddcourse=s.get(Add_Course.class, a);
		s.delete(tempaddcourse);
		if(pageSession.getAttribute("username")!=null)
		{
			return "Delete_Course";
		}
		else {
			return "login-signup";
		}
		
	}
	@RequestMapping(value="/editcourse")
	@Transactional
	public String edit_course(@ModelAttribute("editcourse") Add_Course tempeditcourse) {
		String a=request.getParameter("old_id");
		String b=request.getParameter("new_id");
		String c=request.getParameter("course_name");
		String d=request.getParameter("semester");
		String e=request.getParameter("staff");
		
		Session s=sf.getCurrentSession();
		tempeditcourse=s.get(Add_Course.class, a);
		s.delete(tempeditcourse);
		tempeditcourse.setId(b);
		tempeditcourse.setCourse_id(b);
		tempeditcourse.setCourse_name(c);
		tempeditcourse.setSemester(d);
		tempeditcourse.setStaff(e);
		s.save(tempeditcourse);
		if(pageSession.getAttribute("username")!=null)
		{
			return "Edit_Course";
		}
		else {
			return "login-signup";
		}
		
	}
	
	@RequestMapping("/Store_Feedback")
	@Transactional
	public String Store_Feedback(@ModelAttribute("Store_Feedback") Store_Feedback tempsf) {
		String a=tempsf.getFeedback();
		ArrayList<String> b= new ArrayList<String>(Arrays.asList(a.split(",")));
		Session s=sf.getCurrentSession();
		for(int i=0;i<b.size();i++)
		{
			Store_Feedback tempsf1=new Store_Feedback(b.get(i));
			s.save(tempsf1);
		}
		
		if(pageSession.getAttribute("username")!=null)
		{
			return "Add_Feedback1";
		}
		else {
			return "login-signup";
		}
		
	}
	
	@RequestMapping("/Enroll")
	public String gotoenroll() {
		if(pageSession.getAttribute("username")!=null)
		{
			return "Enroll";
		}
		else {
			return "login-signup";
		}
		
	}
	@RequestMapping("/Enroll1")
	public String gotoenroll1(Model themodel) {
		String a=request.getParameter("stud_semester");
		pageSession.setAttribute("sem", a);
		List<String> numbersList = sd.read_course(a);
		System.out.println(numbersList);
		themodel.addAttribute("a", numbersList);
		String check=sd.check_enroll(pageSession.getAttribute("username").toString(),a);
		if(pageSession.getAttribute("username")!=null && check.equals("Enrolled"))
		{
			pageSession.setAttribute("checkenroll", check);
			return "Enroll";
		}
		else if(pageSession.getAttribute("username")!=null && check.equals("Not_Enrolled"))
		{
			return "Enroll1";
		}
		else {
			return "login-signup";
		}
		
	}
	
	
	
	
	
	@RequestMapping("/Stud_Feedback")
	public String gotostud_feedback(Model themodel) {
		
		if(!(pageSession.getAttribute("course_id").equals("nr")) && !(pageSession.getAttribute("staff").equals("nr")))
		{
		int a1=(int)pageSession.getAttribute("loop1");
		themodel.addAttribute("complete", "notcompleted");
		String feedback1=(String)pageSession.getAttribute("feedback");
		String[] b=feedback1.split(",");
		String store_value="";
		int count=0;
		for(int i=a1;i<(b.length+a1);i++)
		{
			if(i==(b.length)-1)
			{
				String a=request.getParameter(Integer.toString(i));
				if(a==null)
				{
					count=count+1;
				}
				store_value+=a;
			}
			else
			{

			String a=request.getParameter(Integer.toString(i));
			if(a==null)
			{
				count=count+1;
			}
			store_value+=a+',';
			
			}
			
		}
		if(count>0)
		{
			return "Stud_Feedback";
		}
		}
		
		int find=0;
		themodel.addAttribute("complete", "notcompleted");
		String Course_Id=sd.Read_courseId(pageSession.getAttribute("username").toString());
		String Staff=sd.Read_staff(Course_Id);
		String feedback=sd.Read_feedback();
		String[] arr=feedback.split(",");
		String[] Course_Id1=Course_Id.split(",");
		
		String[] staff1=Staff.split(",");
		pageSession.setAttribute("loop1",arr.length );
		pageSession.setAttribute("feedback", feedback);
		if(pageSession.getAttribute("course_id").equals("nr") && pageSession.getAttribute("staff").equals("nr"))
		{
		pageSession.setAttribute("course_id", Course_Id1[0]);
		pageSession.setAttribute("staff",staff1[0]);
		}
		else {
			
			for(int i=0;i<Course_Id1.length;i++)
			{
				if(Course_Id1[i].equals(pageSession.getAttribute("course_id")))
				{
					find=i;
					break;
				}
			}
			find++;
		}
		
		if(pageSession.getAttribute("username")!=null)
		{
			if(find==(Course_Id1.length)-1)
			{
				pageSession.setAttribute("course_id", Course_Id1[find]);
				pageSession.setAttribute("staff", staff1[find]);
				pageSession.setAttribute("all", "done");
				return "Stud_Feedback";
			}
			else
			{
				pageSession.setAttribute("course_id", Course_Id1[find]);
				pageSession.setAttribute("staff", staff1[find]);
				return "Stud_Feedback";
			}
		
		}
		else {
			return "login-signup";
		}
	}
	
	
	
	
	@RequestMapping("/Stud_Feedback1")
	@Transactional
	public String gotostud_feedback1(Model themodel,@ModelAttribute("store_stud_feedback") Store_Stud_Feedback tempssf) {
		int a2=(int)pageSession.getAttribute("loop1");
		Session s=sf.getCurrentSession();
		String feedback1=(String)pageSession.getAttribute("feedback");
		String[] b=feedback1.split(",");
		String store_value="";
		int count=0;
		for(int i=a2;i<(b.length+a2);i++)
		{
			if(i==(b.length)-1)
			{
				String a=request.getParameter(Integer.toString(i));
				if(a==null)
				{
					count=count+1;
				}
				store_value+=a;
				
			}
			else
			{

			String a=request.getParameter(Integer.toString(i));
			if(a==null)
			{
				count=count+1;
			}
			store_value+=a+',';
			
			}
			
		}
		if(count>0)
		{
			themodel.addAttribute("complete", "notcompleted");
			return "Stud_Feedback";
		}
		String semester=sd.read_semester(pageSession.getAttribute("course_id").toString());
		pageSession.setAttribute("loop1", a2+b.length);
		tempssf.setCourseid(pageSession.getAttribute("course_id").toString());
		tempssf.setFeedback(pageSession.getAttribute("feedback").toString());
		tempssf.setSemester(semester);
		tempssf.setStaff(pageSession.getAttribute("staff").toString());
		tempssf.setUsername(pageSession.getAttribute("username").toString());
		tempssf.setValue(store_value);
		s.save(tempssf);
		
		
		
		int find=0;
		themodel.addAttribute("complete", "notcompleted");
		String Course_Id=sd.Read_courseId(pageSession.getAttribute("username").toString());
		String Staff=sd.Read_staff(Course_Id);
		String feedback=sd.Read_feedback();
		String[] Course_Id1=Course_Id.split(",");
		String[] staff1=Staff.split(",");
		pageSession.setAttribute("feedback", feedback);
		if(pageSession.getAttribute("course_id").equals("nr") && pageSession.getAttribute("staff").equals("nr"))
		{
		pageSession.setAttribute("course_id", Course_Id1[0]);
		pageSession.setAttribute("staff",staff1[0]);
		}
		else {
			
			for(int i=0;i<Course_Id1.length;i++)
			{
				if(Course_Id1[i].equals(pageSession.getAttribute("course_id")))
				{
					find=i;
					break;
				}
			}
			find++;
		}
		
		if(pageSession.getAttribute("username")!=null)
		{
			if(find==(Course_Id1.length)-1)
			{
				pageSession.setAttribute("course_id", Course_Id1[find]);
				pageSession.setAttribute("staff", staff1[find]);
				pageSession.setAttribute("all", "done");
				return "Stud_Feedback";
			}
			else
			{
				pageSession.setAttribute("course_id", Course_Id1[find]);
				pageSession.setAttribute("staff", staff1[find]);
				return "Stud_Feedback";
			}
		
		}
		else {
			return "login-signup";
		}
	}
	
	
	
	
	@RequestMapping("/store_enroll")
	@Transactional
	public String store_enroll(@ModelAttribute("store_enroll") Store_Enroll tempstoreenroll) {
		String enrolled_course=tempstoreenroll.getCourse_id();
		Session s=sf.getCurrentSession();
		tempstoreenroll.setId(pageSession.getAttribute("username").toString());
		tempstoreenroll.setSemester(pageSession.getAttribute("sem").toString());
		s.save(tempstoreenroll);
		pageSession.setAttribute("checkenroll", "success");
		return "Enroll";
	}
	
	
	
	
	@RequestMapping("/complete_feedback")
	@Transactional
	public String complete_feedback(Model themodel,Store_Stud_Feedback tempssf) {
		int a2=(int)pageSession.getAttribute("loop1");
		Session s=sf.getCurrentSession();
		String feedback1=(String)pageSession.getAttribute("feedback");
		String[] b=feedback1.split(",");
		String store_value="";
		int count=0;
		for(int i=a2;i<(b.length+a2);i++)
		{
			if(i==(b.length)-1)
			{
				String a=request.getParameter(Integer.toString(i));
				if(a==null)
				{
					count=count+1;
				}
				store_value+=a;
				
			}
			else
			{

			String a=request.getParameter(Integer.toString(i));
			if(a==null)
			{
				count=count+1;
			}
			store_value+=a+',';
			
			}
			
		}
		if(count>0)
		{
			themodel.addAttribute("complete", "notcompleted");
			return "Stud_Feedback";
		}
		String semester=sd.read_semester(pageSession.getAttribute("course_id").toString());
		
		tempssf.setCourseid(pageSession.getAttribute("course_id").toString());
		tempssf.setFeedback(pageSession.getAttribute("feedback").toString());
		tempssf.setSemester(semester);
		tempssf.setStaff(pageSession.getAttribute("staff").toString());
		tempssf.setUsername(pageSession.getAttribute("username").toString());
		tempssf.setValue(store_value);
		s.save(tempssf);
		themodel.addAttribute("complete", "completed");
		pageSession.setAttribute("course_id", "nr");
		pageSession.setAttribute("staff","nr");
		pageSession.setAttribute("all", "notdone");
		return "Stud_Feedback";
	}
	
	
	
	@RequestMapping("/report_generation")
	@Transactional
	public String report_generate() {
		Session s=sf.getCurrentSession();
		List<Add_Course> tableadd=s.createQuery("from Add_Course ").list();
		List<Store_Stud_Feedback> tableadd1=s.createQuery("from Store_Stud_Feedback ").list();
		String course_id=tableadd.get(0).getCourse_id();
		String staff=tableadd.get(0).getStaff();
		String student=tableadd1.get(0).getUsername();
		
		for(int i=1;i<tableadd.size();i++)
		{
			course_id+=","+tableadd.get(i).getCourse_id();
			staff+=","+tableadd.get(i).getStaff();
			
		}
		for(int i=1;i<tableadd1.size();i++)
		{
			Pattern p = Pattern.compile(tableadd1.get(i).getUsername());
		     Matcher m = p.matcher(student);
		     if(!m.find())
		    	 student+=","+tableadd1.get(i).getUsername();
		}
		pageSession.setAttribute("course_id", course_id);
		pageSession.setAttribute("staff", staff);
		pageSession.setAttribute("student", student);
		return "reportgeneration";
	}
	
	
	@RequestMapping("/get_report")
	@Transactional
	public String getreport() {
		String a=request.getParameter("report_type");
		Session s=sf.getCurrentSession();
		if(a.equals("staff"))
		{
			String b=request.getParameter("course_staff");
			List<String> someList = new ArrayList<String>();
			List<String> value=s.createQuery("select s.value from Store_Stud_Feedback s where s.staff="+"'"+b+"'").list();
			List<String> feedback=s.createQuery("select s.feedback from Store_Stud_Feedback s where s.staff="+"'"+b+"'").list();
			int[] arr = new int[5];
			for(int k=0;k<5;k++)
			{
				arr[k]=0;
			}
			String[] value2 = value.get(0).split(",");
			for(int i=0;i<(value2.length);i++)
			{
				int s2=i;
				int s3=0;
				while(s3<value.size())
						{
				
				String[] value1 = value.get(s3).split(",");
				s3++;
				
				
					if(value1[s2].equals("5"))
					{
						arr[4]++;
					}
					else if(value1[s2].equals("4"))
					{
						arr[3]++;
					}
					else if(value1[s2].equals("3"))
					{
						arr[2]++;
					}
					else if(value1[s2].equals("2"))
					{
						arr[1]++;
					}
					else if(value1[s2].equals("1"))
					{
						arr[0]++;
						
					}
				}
				someList.add(Arrays.toString(arr));
				for(int k=0;k<5;k++)
				{
					arr[k]=0;
				}
				
			}
			pageSession.setAttribute("feedback", feedback.get(0));
			pageSession.setAttribute("value", String.join(",", someList));
			pageSession.setAttribute("report", "gathered");
		}
		if(a.equals("course_id"))
		{
			String b=request.getParameter("course_course");
			List<String> someList = new ArrayList<String>();
			List<String> value=s.createQuery("select s.value from Store_Stud_Feedback s where s.courseid="+"'"+b+"'").list();
			List<String> feedback=s.createQuery("select s.feedback from Store_Stud_Feedback s where s.courseid="+"'"+b+"'").list();
			int[] arr = new int[5];
			for(int k=0;k<5;k++)
			{
				arr[k]=0;
			}
			String[] value2 = value.get(0).split(",");
			for(int i=0;i<(value2.length);i++)
			{
				int s2=i;
				int s3=0;
				while(s3<value.size())
						{
				
				String[] value1 = value.get(s3).split(",");
				s3++;
				
				
					if(value1[s2].equals("5"))
					{
						arr[4]++;
					}
					else if(value1[s2].equals("4"))
					{
						arr[3]++;
					}
					else if(value1[s2].equals("3"))
					{
						arr[2]++;
					}
					else if(value1[s2].equals("2"))
					{
						arr[1]++;
					}
					else if(value1[s2].equals("1"))
					{
						arr[0]++;
						
					}
				}
				someList.add(Arrays.toString(arr));
				for(int k=0;k<5;k++)
				{
					arr[k]=0;
				}
				
			}
			pageSession.setAttribute("feedback", feedback.get(0));
			pageSession.setAttribute("value", String.join(",", someList));
			pageSession.setAttribute("report", "gathered");
		}
		if(a.equals("student+staff"))
		{
			String b=request.getParameter("course_staff");
			String b1=request.getParameter("course_stud");
			List<String> someList = new ArrayList<String>();
			List<String> value=s.createQuery("select s.value from Store_Stud_Feedback s where s.staff="+"'"+b+"' and s.username="+"'"+b1+"'  ").list();
			List<String> feedback=s.createQuery("select s.feedback from Store_Stud_Feedback s where s.staff="+"'"+b+"'").list();		
			pageSession.setAttribute("feedback", feedback.get(0));
			pageSession.setAttribute("value", value.get(0));
			pageSession.setAttribute("report", "gathered1");
		}
		if(a.equals("student+course"))
		{
			String b=request.getParameter("course_course");
			String b1=request.getParameter("course_stud");
			List<String> someList = new ArrayList<String>();
			List<String> value=s.createQuery("select s.value from Store_Stud_Feedback s where s.courseid="+"'"+b+"' and s.username="+"'"+b1+"'  ").list();
			List<String> feedback=s.createQuery("select s.feedback from Store_Stud_Feedback s where s.courseid="+"'"+b+"'").list();		
			pageSession.setAttribute("feedback", feedback.get(0));
			pageSession.setAttribute("value", value.get(0));
			pageSession.setAttribute("report", "gathered1");
		}
		
		
		
		
		return "reportgeneration";
	}
	
	
	@RequestMapping("/logout")
	public String returnmain() {
		pageSession.invalidate();
		return "login-signup";
	}
	
	
	
}
