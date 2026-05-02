package model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "students")
public class Student {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
    private String name;
    
    @Column(unique = true)
    private String email;
    private String password;
    private String branch;
    private int semester;
    
    @Column(name = "profile_pic")
    private String profilePic; // To store the image filename
	
	public Student() {
		//No-arg Constructor
	}

	public Student(int id, String name, String email, String password, String branch, int semester, String profilePic) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.branch = branch;
		this.semester = semester;
		this.profilePic = profilePic;
	}

	public Student(String name, String email, String password, String branch, int semester, String profilePic) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.branch = branch;
		this.semester = semester;
		this.profilePic = profilePic;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

	public String getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}
	
	
}
