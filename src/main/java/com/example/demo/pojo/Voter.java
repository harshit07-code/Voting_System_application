package com.example.demo.pojo;


import java.util.Date;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;


import java.util.UUID;



import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
@Table(name = "voter")
public class Voter {

	public Voter(UUID voterId, Long aadharNo, String imagePath, String address, Date dob, String email, String name,
			String password, String phoneNO) {
		super();
		this.voterId = voterId;
		this.aadharNo = aadharNo;
		this.imagePath = imagePath;
		this.address = address;
		this.dob = dob;
		this.email = email;
		this.name = name;
		this.password = password;
		this.phoneNO = phoneNO;
	}
	public Voter() {
		super();
		
	}
	@Id
	@GeneratedValue(strategy=GenerationType.UUID)
	@Column(nullable = false, updatable = false, name = "voter_id",columnDefinition ="BINARY(16)")
	 private UUID voterId;
	
	@Column(nullable=false, unique=true)
	private Long aadharNo;
	@Column(unique=true)
	private String imagePath;
	private String address;
	@NotNull(message = "Date of birth is required")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dob;
	
	@Column(unique= true)
	private String email;
	
	
	
	private String name;
	private String password;
	 @Pattern(regexp = "\\d{10}", message = "Phone number must be exactly 10 digits")
	 @Column(name = "phone_no", length = 10)
	private String phoneNO;
	
	public UUID getVoterId() {
		return voterId;
	}
	public void setVoterId(UUID voterId) {
		this.voterId = voterId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhoneNO() {
		return phoneNO;
	}
	public void setPhoneNO(String phoneNO) {
		this.phoneNO = phoneNO;
	}
	
	public Long  getAadharNo() {
		return aadharNo;
	}
	public void setAadharNo(Long  aadharNo) {
		this.aadharNo = aadharNo;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	@Override
	public String toString() {
		return "Voter [voterId=" + voterId + ", aadharNo=" + aadharNo + ", imagePath=" + imagePath + ", address="
				+ address + ", dob=" + dob + ", email=" + email + ", name=" + name + ", password=" + password
				+ ", phoneNO=" + phoneNO + "]";
	}
	
	
	
	
	
}
