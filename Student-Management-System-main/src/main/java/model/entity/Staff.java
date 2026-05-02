package model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "staff")
public class Staff {
	
	@Id // Primary Key
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
    private String name;
    
    @Column(unique = true)
    private String email;
    private String password;
    private String designation;
    private String department;
    
    @Column(name = "profile_pic")
    private String profilePic; // To store the image filename
	
	public Staff() {
		//No-arg constructor
	}

	public Staff(int id, String name, String email, String password, String designation, String department,
			String profilePic) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.designation = designation;
		this.department = department;
		this.profilePic = profilePic;
	}

	public Staff(String name, String email, String password, String designation, String department, String profilePic) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.designation = designation;
		this.department = department;
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

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}
	
	
}
