package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.AppliedJobs;
import com.klef.jfsd.springboot.model.Documents;
import com.klef.jfsd.springboot.model.Education;
import com.klef.jfsd.springboot.model.Jobs;
import com.klef.jfsd.springboot.model.Student;

public interface StudentService 
{
	public String studentregistration(Student student);
	public Student checkstudentlogin(Long id, String password);
	public String addeducationdetails(Education edu);
	public String updatestudentprofile(Student s);
	public String updatestudenteducationdetails(Education edu);
	public List<Jobs> viewalljobsposted();
	public Jobs findjobbyid(int jid);
	public String addappliedjob(AppliedJobs job);
	public long findifapplied(long sid, int jid);
	public List<AppliedJobs> findalljobsapplied(long sid);
	public String addstudentdocuments(Documents documents);
	public Student findstudentbyid(long id);
	public Education findstudenteducationdetails(long id);
	public Documents getdocumentsbyid(long id);
	public List<AppliedJobs> getapplicationsbystatus(long sid,String status);
	public String updatestudentappliedjobstatus(String status, int jid);
	public String deletejobfromwatchlist(int jid);
	public AppliedJobs findappliedjobbyid(int jid);
	
	
	public boolean updatestudentpwd(String pwd,long sid);
	//Jobs
	public String updatejobcount(Jobs jobs);
	public String updatejobstatus(Jobs jobs);
	
	//dashboard
	public long getallactivejobscount();
	public long getstudentapplicationcount(long sid);
	public long getstudentinterviewscount(long sid);
	public long getstudentselectedcount(long sid);
	public long recruitingcompanies();
	public long getstudentshortlistedcount(long sid);
	
}
