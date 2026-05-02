package model.entity;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "quiz_results")
public class QuizResult {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
	
	@Column(name = "student_id")
    private int studentId;
	
	private String subject;
    private int marks; 
    
    @Column(name = "total_marks")
    private int totalMarks; 
    
    @Temporal(TemporalType.TIMESTAMP) // Stores Date AND Time
    @Column(name = "test_date")
    private Date testDate;
    
    public QuizResult() {
    	
    }

	public QuizResult(int id, int studentId, String subject, int marks, int totalMarks, Date testDate) {
		super();
		this.id = id;
		this.studentId = studentId;
		this.subject = subject;
		this.marks = marks;
		this.totalMarks = totalMarks;
		this.testDate = testDate;
	}

	public QuizResult(int studentId, String subject, int marks, int totalMarks, Date testDate) {
		super();
		this.studentId = studentId;
		this.subject = subject;
		this.marks = marks;
		this.totalMarks = totalMarks;
		this.testDate = testDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public int getMarks() {
		return marks;
	}

	public void setMarks(int marks) {
		this.marks = marks;
	}

	public int getTotalMarks() {
		return totalMarks;
	}

	public void setTotalMarks(int totalMarks) {
		this.totalMarks = totalMarks;
	}

	public Date getTestDate() {
		return testDate;
	}

	public void setTestDate(Date testDate) {
		this.testDate = testDate;
	}
    
    
}

