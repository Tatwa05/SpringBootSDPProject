package com.klef.jfsd.springboot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.AppliedJobs;
import com.klef.jfsd.springboot.model.Documents;
import com.klef.jfsd.springboot.model.Education;
import com.klef.jfsd.springboot.model.Jobs;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.AppliedJobsRepository;
import com.klef.jfsd.springboot.repository.DocumentsRepository;
import com.klef.jfsd.springboot.repository.EducationRepository;
import com.klef.jfsd.springboot.repository.JobsRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class StudentServiceImpl implements StudentService
{

	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private EducationRepository educationRepository;
	
	@Autowired
	private JobsRepository jobsRepository;
	
	@Autowired
	private AppliedJobsRepository appliedJobsRepository;
	
	@Autowired
	private DocumentsRepository documentsRepository;

	@Override
	public String studentregistration(Student student) 
	{
		studentRepository.save(student);
		return "Student Registered Successfully";
	}

	@Override
	public Student checkstudentlogin(Long id, String password) 
	{
		return studentRepository.studentlogin(id, password);
	}

	@Override
	public String addeducationdetails(Education edu) 
	{
		educationRepository.save(edu);
		return "Education Details Added Successfully";
	}

	@Override
	public Education findstudenteducationdetails(long id) 
	{
		
		return educationRepository.findEducationByStudentid(id);
	}

	@Override
	public String updatestudenteducationdetails(Education edu) 
	{
		Optional<Education> existingEducationOpt = educationRepository.findById(edu.getStudentid());

	    if (existingEducationOpt.isEmpty()) {
	        return addeducationdetails(edu); 
	    }

	    Education e = existingEducationOpt.get();
		
		e.setStudentid(edu.getStudentid());
		e.setDegree(edu.getDegree());
		e.setMajor(edu.getMajor());
		e.setSpecialization(edu.getSpecialization());
		e.setCgpa(edu.getCgpa());
		e.setStartdate(edu.getStartdate());
		e.setEnddate(edu.getEnddate());
		
		educationRepository.save(e);
		
		return "Education Details Updated Successfully";
	}

	@Override
	public String updatestudentprofile(Student s) 
	{
		Student std = studentRepository.getstudentbyid(s.getId());
		
		std.setId(s.getId());
		std.setName(s.getName());
		std.setGender(s.getGender());
		std.setDob(s.getDob());
		std.setAddress(s.getAddress());
		std.setEmail(s.getEmail());
		std.setPassword(s.getPassword());
		std.setContact(s.getContact());
		
		studentRepository.save(std);
		
		return "Profile Updated Successfully";
	}

	@Override
	public Student findstudentbyid(long id) 
	{
		return studentRepository.getstudentbyid(id);
	}

	@Override
	public List<Jobs> viewalljobsposted() 
	{
		return jobsRepository.findAll();
	}

	@Override
	public Jobs findjobbyid(int jid) 
	{
		Jobs job = jobsRepository.findById(jid).get();
		
		return job;
	}

	@Override
	public String addappliedjob(AppliedJobs job) 
	{
		appliedJobsRepository.save(job);
		return "Job Applied Successfully";
	}

	@Override
	public long findifapplied(long sid, int jid) 
	{
		return appliedJobsRepository.findifapplied(sid, jid);
	}

	@Override
	public List<AppliedJobs> findalljobsapplied(long sid) {
		return appliedJobsRepository.findallappliedjobs(sid);
	}

	@Override
	public String addstudentdocuments(Documents documents) 
	{
		documentsRepository.save(documents);
		return "Documents uploaded Successfully";
	}

	@Override
	public Documents getdocumentsbyid(long id) 
	{
		return documentsRepository.finddocumentbystudentid(id);
	}

	@Override
	public List<AppliedJobs> getapplicationsbystatus(long sid, String status) 
	{
		return appliedJobsRepository.getapplicationsbystatus(sid, status);
	}

	@Override
	public String updatejobcount(Jobs jobs) 
	{
		Jobs job = jobsRepository.findById(jobs.getId()).get();
		
		job.setApplicationsrecieved(jobs.getApplicationsrecieved());

	    jobsRepository.save(job);

	    return "Job count updated successfully";
		
	}

	@Override
	public String updatejobstatus(Jobs jobs) 
	{
		Jobs job = jobsRepository.findById(jobs.getId()).get();
		job.setStatus(jobs.getStatus());
		
		jobsRepository.save(job);
		
		return "job status updated successfully";
	}

	@Override
	public String updatestudentappliedjobstatus(String status, int jid) 
	{
		appliedJobsRepository.updatestudentappliedjobstatus(status, jid);
		return "Job Applied Successfully";
	}

	@Override
	public String deletejobfromwatchlist(int jid) 
	{
		appliedJobsRepository.delete(appliedJobsRepository.findById(jid).get());
		return "Job has been removed from watchlist";
	}

	@Override
	public AppliedJobs findappliedjobbyid(int jid) 
	{
		return appliedJobsRepository.findById(jid).get();
	}

	@Override
	public long getallactivejobscount() 
	{
		
		return jobsRepository.activejobscount();
	}

	@Override
	public long getstudentapplicationcount(long sid) 
	{
		return appliedJobsRepository.getstudentapplicationcount(sid);
	}

	@Override
	public long getstudentinterviewscount(long sid) 
	{
		
		return appliedJobsRepository.getstudentinterviewscount(sid);
	}

	@Override
	public long getstudentselectedcount(long sid) 
	{
		
		return appliedJobsRepository.getstudentselectedcount(sid);
	}

	@Override
	public long recruitingcompanies() 
	{
		
		return jobsRepository.recruitingcompanies();
	}

	@Override
	public long getstudentshortlistedcount(long sid) 
	{
		return appliedJobsRepository.getstudentshortlistedcount(sid);
	}

	@Override
	public boolean updatestudentpwd(String pwd, long sid) 
	{
		return studentRepository.changepassword(pwd, sid)>0;
	}
	
	
		

}
