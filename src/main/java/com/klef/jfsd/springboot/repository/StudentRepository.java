package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Student;

import jakarta.transaction.Transactional;

@Repository
public interface StudentRepository extends JpaRepository<Student, Integer>
{

	@Query("select s from Student s where s.id=?1")
	public Student getstudentbyid(long id);
	
	
	@Query("SELECT s.gender, COUNT(s) FROM Student s GROUP BY s.gender")
    public List<Object[]> countStudentsByGender();

    @Query("SELECT s.address, COUNT(s) FROM Student s GROUP BY s.address")
    public List<Object[]> countStudentsByAddress();

    @Query("select s from Student s where s.id=?1 and s.password=?2")
	public Student studentlogin(Long id, String password);
    
    @Modifying
	@Transactional
	@Query("update Student s set s.password=?1 where s.id=?2")
	public int changepassword(String pwd,long sid);
}
