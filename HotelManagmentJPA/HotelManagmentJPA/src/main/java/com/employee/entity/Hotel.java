package com.employee.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Version;
import jakarta.validation.constraints.*;
@Entity
public class Hotel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotBlank(message ="Name Required")
    private String name;

    private String hotelType;
    @Size(min = 2, max = 50, message = "Name must be between 2 and 50 characters")
    private String quality;
    
    @Email(message="Invalid Email")
    private String hotelEmail;
    
    @NotBlank(message = "Password cannot be empty")
    @Pattern(
        regexp = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,20}$",
        message = "Password must be 8-20 characters long, include at least one uppercase letter, one lowercase letter, one number, and one special character."
    )
    private Long num;
    
    
    

    @Version
    private int version = 0; // Initialize version to 0

    // Parameterized constructor
    public Hotel(Long id, String name, String hotelType, String quality, String hotelEmail,Long num) {
        this.id = id;
        this.name = name;
        this.hotelType = hotelType;
        this.quality = quality;
        this.hotelEmail=hotelEmail;
        this.num=num;
        
    }

    // Default constructor
    public Hotel() {
    }

    // Getters and setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHotelType() {
        return hotelType;
    }

    public void setHotelType(String hotelType) {
        this.hotelType = hotelType;
    }

    public String getQuality() {
        return quality;
    }

    public void setQuality(String quality) {
        this.quality = quality;
    }
    
    public String getHotelEmail() {
		return hotelEmail;
	}

	public void setHotelEmail(String hotelEmail) {
		this.hotelEmail = hotelEmail;
	}
	
	 public void setNum(Long num) {
	        this.num = num;
	}
	 
	 public Long getNum() {
			return num;
	}

	   
	
    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }

	@Override
	public String toString() {
		return "Hotel [id=" + id + ", name=" + name + ", hotelType=" + hotelType + ", quality=" + quality
				+ ", hotelEmail=" + hotelEmail + ", version=" + version + "]";
	}

   

	
}