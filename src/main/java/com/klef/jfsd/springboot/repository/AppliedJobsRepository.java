package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.AppliedJobs;

import jakarta.transaction.Transactional;

@Repository
public interface AppliedJobsRepository extends JpaRepository<AppliedJobs, Integer>
{
	@Query("select ap from AppliedJobs ap where ap.jobs.id=?1")
	public List<AppliedJobs> getapplicantsbyjobid(int jid);
	
	@Query("select ap from AppliedJobs ap where ap.student.id=?1")
	public  List<AppliedJobs> findallappliedjobs(long sid);
	
	@Modifying
    @Transactional
    @Query("update AppliedJobs ap set ap.status=?1 where ap.id=?2")
    public int updatestudentapplicationstatus(String status, int id);
	
	@Query("select count(ap) from AppliedJobs ap where ap.jobs.recruiterid=?1 and ap.status!=?2")
	public long studentcount(int rid,String status);
	
	@Query("select count(ap) from AppliedJobs ap where ap.jobs.recruiterid=?1 and ap.status=?2")
	public long interviewscount(int rid,String status);
	

	    @Query("SELECT a.status, COUNT(a) FROM AppliedJobs a GROUP BY a.status")
	    List<Object[]> countApplicationsByStatus();

	    @Query("SELECT a.jobs.id,a.jobs.name, a.jobs.applicationsrecieved FROM AppliedJobs a GROUP BY a.jobs.id,a.jobs.name")
	    List<Object[]> countApplicationsPerJob();
	
	    
		@Query("select COUNT(ap) from AppliedJobs ap where ap.student.id=?1 and ap.jobs.id=?2")
		public  long findifapplied(long sid, int jobid);
		
		
		
		@Query("select ap from AppliedJobs ap where ap.student.id=?1 and ap.status=?2")
		public  List<AppliedJobs> getapplicationsbystatus(long sid,String status);
		
		@Modifying
	    @Transactional
	    @Query("update AppliedJobs ap set ap.status=?1 where ap.id=?2")
	    public int updatestudentappliedjobstatus(String status, int id);
		
		@Query("select count(ap) from AppliedJobs ap where ap.student.id=?1 and ap.status!='Watchlist'")
		public long getstudentapplicationcount(long sid);
		
		@Query("select count(ap) from AppliedJobs ap where ap.student.id=?1 and ap.status='Interview'")
		public long getstudentinterviewscount(long sid);
		
		@Query("select count(ap) from AppliedJobs ap where ap.student.id=?1 and ap.status='Selected'")
		public long getstudentselectedcount(long sid);
		
		@Query("select count(ap) from AppliedJobs ap where ap.student.id=?1 and ap.status='Shortlisted'")
		public long getstudentshortlistedcount(long sid);
		
		
		
		
		
	
	
}
