package com.klef.jfsd.springboot.controller;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.klef.jfsd.springboot.model.AppliedJobs;
import com.klef.jfsd.springboot.model.Documents;
import com.klef.jfsd.springboot.model.Education;
import com.klef.jfsd.springboot.model.Jobs;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("student")
public class StudentController 
{
	@Autowired
	private StudentService studentService;
	
	@Autowired 
	private JavaMailSender javaMailSender;
	
	private String generatedOtp;
	
	
	@GetMapping("/")
	public ModelAndView home()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	
	
	@GetMapping("forgotpwd")
	public ModelAndView forgotpwd(@RequestParam("id")String sid)
	{
		long id = Long.parseLong(sid);
		ModelAndView mv = new ModelAndView("forgotpwd");
		mv.addObject("id",id);
		return mv;
	}
	
	

	@GetMapping("studentdashboard")
	public ModelAndView studentdashboard(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		Student s = (Student) session.getAttribute("student");
		if(s==null)
		{
			mv.setViewName("redirect:/student/sessionexpiry");
			return mv;
		}
		long acnt = studentService.getallactivejobscount();
		long appcount = studentService.getstudentapplicationcount(s.getId());
		long intcnt = studentService.getstudentinterviewscount(s.getId());
		long scnt = studentService.getstudentselectedcount(s.getId());
		long companies = studentService.recruitingcompanies();
		long shortcnt = studentService.getstudentshortlistedcount(s.getId());
		
		mv.setViewName("studentdashboard");
		mv.addObject("acnt", acnt);
		mv.addObject("appcnt", appcount);
		mv.addObject("intcnt", intcnt);
		mv.addObject("scnt", scnt);
		mv.addObject("companies", companies);
		mv.addObject("shortcnt", shortcnt);
		return mv;
	}
	
	@GetMapping("studentprofile")
	public ModelAndView studentprofile()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("studentprofile");
		return mv;
	}
	
	@GetMapping("studentlogin")
	public ModelAndView studentlogin()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("studentlogin");
		return mv;
	}
	
	@GetMapping("loginfail")
	public ModelAndView loginfail()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("loginfail");
		return mv;
	}
	
	
	
	@PostMapping("checkstudentlogin")
	public ModelAndView checkstudentlogin(HttpServletRequest request, RedirectAttributes redirectAttributes)
	{
		long sid = Long.parseLong(request.getParameter("sid"));
		String spwd = request.getParameter("spwd");
		
		Student s = studentService.checkstudentlogin(sid, spwd);
		
		ModelAndView mv  = new ModelAndView();
		
		if(s!=null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("student", s);
			
			mv.setViewName("redirect:/student/studentdashboard");
		}
		else
		{
			mv.setViewName("redirect:/student/studentlogin");
			redirectAttributes.addFlashAttribute("msg","Invalid Credentials");
		}
		
		return mv;
		
		
	}
	
	@GetMapping("sessionexpiry")
	public ModelAndView sessionexpiry()
	{
		ModelAndView mv = new ModelAndView("sessionexpiry");
		return mv;
	}
	
	@GetMapping("studentlogout")
	public ModelAndView studentlogout(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		session.removeAttribute("student");
		
		ModelAndView mv =  new ModelAndView("studentlogin");
		return mv;
	}
	
	@GetMapping("addeducationdetails")
	public ModelAndView addeducationdetails()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("studentaddcourse");
		return mv;
	}
	
	@GetMapping("educationdetails")
	public ModelAndView educationdetails(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		Student s = (Student)session.getAttribute("student");
		if(s==null)
		{
			mv.setViewName("redirect:/student/sessionexpiry");
			return mv;
		}
		
		Education edu =   studentService.findstudenteducationdetails(s.getId());	
		if(edu!=null)
		{
			mv.setViewName("studentcoursedetails");
			mv.addObject("edu", edu);
		}
		else
		{
			mv.setViewName("studentaddcourse");
		}
		return mv;
	}
	
	@GetMapping("viewstudenteducationdetails")

	public ModelAndView vieweducationdetails()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("studentcoursedetails");
		return mv;
	}
	
	@PostMapping("updateeducationdetails")
	public ModelAndView updateeducationdetails(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		Student s = (Student) session.getAttribute("student");
		ModelAndView mv=  new ModelAndView();
		if(s==null)
		{
			mv.setViewName("redirect:/student/sessionexpiry");
			return mv;
		}
		
		
		
		Long sid = Long.parseLong(request.getParameter("sid"));
		String sdegree = request.getParameter("sdegree");
		String smajor = request.getParameter("smajor");
		String sspec = request.getParameter("sspec");
		Double scgpa = Double.parseDouble(request.getParameter("scgpa"));
		String sstart = request.getParameter("sstart");
		String send = request.getParameter("send");
		
		Education edu = new Education();
		edu.setStudentid(sid);
		edu.setDegree(sdegree);
		edu.setMajor(smajor);
		edu.setSpecialization(sspec);
		edu.setCgpa(scgpa);
		edu.setStartdate(sstart);
		edu.setEnddate(send);
		
		String msg = studentService.updatestudenteducationdetails(edu);
		
		return educationdetails(request);
		
		
	}
	
	
	
	
	
	
	@GetMapping("studentprofileupdate")
	public ModelAndView studentprofileupdate()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("studentprofileupdate");
		return mv;
	}
	
	
	@PostMapping("updatestudentprofile")
	public ModelAndView updatestudentprofile(HttpServletRequest request)
	{
		Long sid = Long.parseLong(request.getParameter("sid"));
		String sname = request.getParameter("sname");
		String sgender = request.getParameter("sgender");
		String sdob = request.getParameter("sdob");
		String saddress = request.getParameter("saddress");
		String semail = request.getParameter("semail");
		String spwd = request.getParameter("spwd");
		String scontact = request.getParameter("scontact");
		
		Student s = new Student();
		s.setId(sid);
		s.setName(sname);
		s.setGender(sgender);
		s.setDob(sdob);
		s.setAddress(saddress);
		s.setEmail(semail);
		s.setPassword(spwd);
		s.setContact(scontact);
		
		String msg = studentService.updatestudentprofile(s);
		
		Student st = studentService.findstudentbyid(sid);
		HttpSession session = request.getSession();
		session.setAttribute("student", st);
		ModelAndView mv = new ModelAndView("studentprofile");
		
		return mv;
		
		
	}
	
	@GetMapping("applyjobs")
	public ModelAndView applyjobs()
	{
		ModelAndView mv = new ModelAndView("applyjobs");
		List<Jobs> jobslist = studentService.viewalljobsposted();
		mv.addObject("jobslist", jobslist);
		return mv;
	}
	
	@GetMapping("applyforjob")
	public ModelAndView applyforjob(HttpServletRequest request,  @RequestParam("id") int jobid,RedirectAttributes redirectAttributes)
	{
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		Student s = (Student) session.getAttribute("student");
		
		if(s==null)
		{
			mv.setViewName("redirect:/student/sessionexpiry");
			return mv;
		}
		
		Jobs job = studentService.findjobbyid(jobid);
		
		 LocalDate today = LocalDate.now();
		 System.out.println(today);
		    if (job.getDeadline().equals(today.toString())) {
		        job.setStatus("Inactive");
		        studentService.updatejobstatus(job);
		        mv.setViewName("redirect:/student/applyjobs");
		        redirectAttributes.addFlashAttribute("nomsg", "The job application deadline has passed.");
		        return mv;
		    }
		
		
		
		if(studentService.findifapplied(s.getId(), jobid)>0 || job.getMaxapplications()==0)
		{
			mv.setViewName("redirect:/student/applyjobs");
			redirectAttributes.addFlashAttribute("msg", "You Had Already Applied for this Job");
			
		}
		else
		{
		
			if (job.getApplicationsrecieved() < job.getMaxapplications() && job.getStatus().equals("Active")) {
	           
	            job.setApplicationsrecieved(job.getApplicationsrecieved() + 1);                                         
	            studentService.updatejobcount(job); 
	            if(job.getApplicationsrecieved() == job.getMaxapplications())
		        {
		        	job.setStatus("Inactive");
			        studentService.updatejobstatus(job);
		        }
	            
	            
	            AppliedJobs app = new AppliedJobs();
	            app.setStudent(s);
	            app.setJobs(job);
	            app.setStatus("APPLIED");
	            String msg = studentService.addappliedjob(app);    
	            mv.setViewName("redirect:/student/applyjobs");
	            redirectAttributes.addFlashAttribute("msg", msg);
	        } else {
	            mv.setViewName("redirect:/student/applyjobs");
	            Jobs j = studentService.findjobbyid(jobid);
	            j.setStatus("Inactive");
	            String msg = studentService.updatejobstatus(job);
	            redirectAttributes.addFlashAttribute("nomsg", "Maximum application limit reached for this job.");
	        }
		
		}
		
		return mv;
	}
	
	
	
	@GetMapping("savejob")
	public ModelAndView savejob(@RequestParam("id") int jobid, HttpServletRequest request,RedirectAttributes redirectAttributes)
	{
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		Student s = (Student) session.getAttribute("student");
		
		if(s==null)
		{
			mv.setViewName("redirect:/student/sessionexpiry");
			return mv;
		}
		
		Jobs job = studentService.findjobbyid(jobid);
		AppliedJobs app = new AppliedJobs();
        app.setStudent(s);
        app.setJobs(job);
        app.setStatus("Watchlist");
        String msg = studentService.addappliedjob(app);
        mv.setViewName("redirect:/student/applyjobs");
        msg = "Job has been saved to watchlist";
        redirectAttributes.addFlashAttribute("msg", msg);
        
        return mv;
		
		
	}
	
	
	
	@GetMapping("viewappliedjobs")
	public ModelAndView findallappliedjobs(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		Student s = (Student) session.getAttribute("student");
		ModelAndView mv = new ModelAndView();
		if(s==null)
		{
			mv.setViewName("redirect:/student/sessionexpiry");
			return mv;
		}
		List<AppliedJobs>  alljobs = studentService.findalljobsapplied(s.getId());
		
		mv.setViewName("viewappliedjobs");
		mv.addObject("jobslist", alljobs);
		
		return mv;
	}
	
	
	@GetMapping("getjobsinwatchlist")
	public ModelAndView getjobsinwatchlist(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		Student s = (Student) session.getAttribute("student");
		if(s==null)
		{
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/student/sessionexpiry");
			return mv;
		}
		
		
		List<AppliedJobs>  alljobs = studentService.findalljobsapplied(s.getId());
		ModelAndView mv = new ModelAndView("jobsinwatchlist");
		mv.addObject("jobslist", alljobs);
		
		return mv;
	}
	
	@GetMapping("applysavedjob")
	public ModelAndView applysavedjob(@RequestParam("id") int jid, HttpServletRequest request, RedirectAttributes redirectAttributes) {
	    HttpSession session = request.getSession();
	    Student s = (Student) session.getAttribute("student");
	    if(s==null)
		{
	    	ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/student/sessionexpiry");
			return mv;
		}
	    ModelAndView mv = new ModelAndView("redirect:/student/getjobsinwatchlist");
	    AppliedJobs job = studentService.findappliedjobbyid(jid);

	    
	    if (studentService.findifapplied(s.getId(), job.getJobs().getId()) > 0 || job.getJobs().getMaxapplications() == 0) {
	    	if(job.getJobs().getStatus().equalsIgnoreCase("APPLIED")) {
	        redirectAttributes.addFlashAttribute("msg", "You have already applied for this job or it has reached its maximum application limit.");
	        return mv;
	    	}
	    }

	    
	    if (job.getJobs().getApplicationsrecieved() < job.getJobs().getMaxapplications()) {
	        job.getJobs().setApplicationsrecieved(job.getJobs().getApplicationsrecieved() + 1);
	        studentService.updatejobcount(job.getJobs());
	        
	        if(job.getJobs().getApplicationsrecieved() == job.getJobs().getMaxapplications())
	        {
	        	job.getJobs().setStatus("Inactive");
		        studentService.updatejobstatus(job.getJobs());
	        }

	        String msg = studentService.updatestudentappliedjobstatus("APPLIED", jid);
	        redirectAttributes.addFlashAttribute("msg", msg);
	    } else {
	        
	        job.getJobs().setStatus("Inactive");
	        studentService.updatejobstatus(job.getJobs());
	        redirectAttributes.addFlashAttribute("nomsg", "Maximum application limit reached for this job.");
	    }

	    return mv;
	}

	
	@GetMapping("removejobinwatchlist")
	public ModelAndView removefromwatchlist(@RequestParam("id")int jid, HttpServletRequest request)
	{
		String msg = studentService.deletejobfromwatchlist(jid);
		HttpSession session = request.getSession();
		Student s = (Student) session.getAttribute("student");
		ModelAndView mv = new ModelAndView("jobsinwatchlist");
		
		if(s==null)
		{
			mv.setViewName("redirect:/student/sessionexpiry");
			return mv;
		}
		List<AppliedJobs>  alljobs = studentService.findalljobsapplied(s.getId());
		
		mv.addObject("jobslist", alljobs);
		
		
		return mv;
	}
	
	@GetMapping("adddocuments")
	public ModelAndView studentadddocuments()
	{
		ModelAndView mv = new ModelAndView("studentadddocuments");
		return mv;
	}
	
	@PostMapping("uploaddocuments")
	public ModelAndView uploadDocuments(
	        HttpServletRequest request,
	        @RequestParam("sresume") MultipartFile resumeFile,
	        @RequestParam("smarksheet") MultipartFile marksheetFile) {
	    ModelAndView mv = new ModelAndView();
	    String msg;

	    try {
	        
	        long studentId = Long.parseLong(request.getParameter("sid"));
	        String githubLink = request.getParameter("sgitlink");
	        String summary = request.getParameter("ssummary");

	        
	        Blob resumeBlob = new javax.sql.rowset.serial.SerialBlob(resumeFile.getBytes());
	        Blob marksheetBlob = new javax.sql.rowset.serial.SerialBlob(marksheetFile.getBytes());

	        // Create Documents object and set values
	        Documents documents = new Documents();
	        documents.setStudentid(studentId);
	        documents.setGithublink(githubLink);
	        documents.setResume(resumeBlob);
	        documents.setMarksheet(marksheetBlob);
	        documents.setSummary(summary);

	        // Call the service layer to save the data
	        msg = studentService.addstudentdocuments(documents);
	        
	        Documents d = studentService.getdocumentsbyid(studentId);
	        // Success response
	        if( d!= null)
	        {
	        	mv.setViewName("studentdocuments");
		        mv.addObject("message", msg);
		        mv.addObject("doc", d);
	        }
	        
	    } catch (Exception e) {
	        // Handle errors
	        msg = e.getMessage();
	        mv.setViewName("error");
	        mv.addObject("message", msg);
	        e.printStackTrace();
	    }

	    return mv;
	}
	
	
	@GetMapping("studentdocuments")
	public ModelAndView studentdocuments(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		Student s = (Student)session.getAttribute("student");
		ModelAndView mv = new ModelAndView();
		if(s==null)
		{
			mv.setViewName("redirect:/student/sessionexpiry");
			return mv;
		}
		Documents doc =   studentService.getdocumentsbyid(s.getId());
		if(doc!=null)
		{
			mv.setViewName("studentdocuments");
			request.setAttribute("doc", doc);
		}
		else
		{
			mv.setViewName("studentadddocuments");
		}
		return mv;
	}
	
	@GetMapping("/getMarksheets/{studentId}")
	public ResponseEntity<byte[]> getMarksheets(@PathVariable long studentId) throws SQLException {
	    Documents doc = studentService.getdocumentsbyid(studentId);
	    if (doc != null && doc.getMarksheet() != null) {
	        byte[] marksheetBytes = doc.getMarksheet().getBytes(1, (int) doc.getMarksheet().length());
	        return ResponseEntity.ok()
	                .contentType(MediaType.APPLICATION_PDF)
	                .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename="+studentId+"_marksheet.pdf")
	                .body(marksheetBytes);
	    }
	    return ResponseEntity.notFound().build();
	}

	@GetMapping("/getResume/{studentId}")
	public ResponseEntity<byte[]> getResume(@PathVariable long studentId) throws SQLException {
	    Documents doc = studentService.getdocumentsbyid(studentId);
	    if (doc != null && doc.getResume() != null) {
	        byte[] resumeBytes = doc.getResume().getBytes(1, (int) doc.getResume().length());
	        return ResponseEntity.ok()
	                .contentType(MediaType.APPLICATION_PDF)
	                .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename="+studentId+"_resume.pdf")
	                .body(resumeBytes);
	    }
	    return ResponseEntity.notFound().build();
	}
	
	
	@GetMapping("getstudentdetails")
	public ModelAndView getstudentdetails(HttpServletRequest request, @RequestParam("id") long id)
	{
		Student s = studentService.findstudentbyid(id);
		Education e = studentService.findstudenteducationdetails(id);
		Documents d = studentService.getdocumentsbyid(id);
		
		ModelAndView mv  = new  ModelAndView("studenttotaldetails");
		mv.addObject("student", s);
		mv.addObject("edu", e);
		mv.addObject("doc", d);
		
		return mv;
	}
	
	
	@GetMapping("getstatus/{id}/{status}")
	public ModelAndView getstatus(@PathVariable("id")long id, @PathVariable("status") String status)
	{
		List<AppliedJobs> jobs = studentService.getapplicationsbystatus(id, status);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewappliedjobs");
		mv.addObject("jobslist", jobs);
		return mv;
	}
	
	
	@GetMapping("getjob")
	@ResponseBody
	public Jobs getjob(@RequestParam("id")int jid)
	{
		return studentService.findjobbyid(jid);
	}
	
	@GetMapping("jobdetails")
	public ModelAndView jobdetails(@RequestParam("id")int jid)
	{
		Jobs job =  studentService.findjobbyid(jid);
		ModelAndView mv = new ModelAndView("jobdetails");
		mv.addObject("job", job);
		return mv;
	}
	
	
	@GetMapping("sblocked")
	public ModelAndView sblocked()
	{
		ModelAndView mv = new ModelAndView("sblocked");
		return mv;
	}
	
	@PostMapping("/sendOtp")
	  @ResponseBody
	  public ResponseEntity<String> sendOtp(@RequestParam String username) 
	  {
	      if (username == null || username.trim().isEmpty()) {
	          return ResponseEntity.badRequest().body("Invalid username");
	      }
	      
	      long sid = Long.parseLong(username);

	      Student student = studentService.findstudentbyid(sid);
	      

	      if (student == null) {
	          return ResponseEntity.status(HttpStatus.NOT_FOUND).body("User not found");
	      }

	      try {
	          generatedOtp = String.format("%06d", new Random().nextInt(999999));
	          
	          String email = null;

	          if(student!=null)
	          {
	        	  email = student.getEmail();
	          }

	          MimeMessage message = javaMailSender.createMimeMessage();
	          MimeMessageHelper helper = new MimeMessageHelper(message, true);

	          String subject = "CareerStream - OTP Verification";
	          String htmlContent = """
	          <div style="font-family: Arial, sans-serif; border: 1px solid #ccc; border-radius: 8px; padding: 20px; max-width: 500px; margin: auto; background-color: #f9f9f9;">
	          <h2 style="color: #2c3e50; text-align: center;">Password Reset Request</h2>
	          <p style="font-size: 16px; color: #34495e;">Dear User,</p>
	          <p style="font-size: 16px; color: #34495e;">
	          We received a request to reset your password for your <b>Career Stream</b> account. To proceed with resetting your password, please use the following OTP:
	          </p>
	          <div style="text-align: center; margin: 20px 0;">
	          <span style="font-size: 24px; color: #e74c3c; font-weight: bold;">%s</span>
	          </div>
	          <p style="font-size: 16px; color: #34495e;">This OTP is valid for 10 minutes. If you did not request a password reset, please ignore this email or contact support.</p>
	          <hr style="margin: 20px 0; border: 0; border-top: 1px solid #ccc;">
	          <p style="font-size: 14px; color: #7f8c8d; text-align: center;">
	          If you have any questions, contact us at <a href="mailto:support@careerstream.edu" style="color: #2980b9;">support@careerstream.edu</a>.
	          </p>
	          </div>
	          """.formatted(generatedOtp);

	          helper.setFrom("ktatwadarsan@gmail.com");
	          helper.setTo(email);
	          helper.setSubject(subject);
	          helper.setText(htmlContent, true);

	          javaMailSender.send(message);

	          return ResponseEntity.ok("OTP sent successfully!");
	      } catch (Exception e) {
	          
	          return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                               .body("Error sending OTP. Please try again later.");
	      }
	  }

	
	  @PostMapping("/verifyOtp")
    @ResponseBody
    public String verifyOtp(@RequestParam String otp) 
	  {
		  System.out.println("otp verifying ......");
        if (generatedOtp != null && generatedOtp.equals(otp)) {
            return "OTP Verified Successfully";
        }
        return "Invalid OTP!";
    }
	  
	  @PostMapping("changepwd")
	  public ModelAndView changepwd(HttpServletRequest request)
	  {
		  ModelAndView mv = new ModelAndView();
		  long sid = Long.parseLong(request.getParameter("sid"));
		  String npwd = request.getParameter("npwd");
		  String cpwd = request.getParameter("cpwd");
		  
		  if(!npwd.equals(cpwd))
		  {
			  String msg = "recheck your password";
			  mv.setViewName("forgotpwd");
			  mv.addObject("msg", msg);
		  }
		  else
		  {
			  boolean isupdated = studentService.updatestudentpwd(npwd, sid);
			  if(isupdated)
			  {
				  mv.setViewName("studentlogin");
				  return mv; 
			  }
			  
			  String msg = "recheck your password";
			  mv.setViewName("forgotpwd");
			  mv.addObject("msg", msg);
			  
		  }
		  
		  return mv;
	  }

	  
}

	
	
	

