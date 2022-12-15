package user.model;

import java.util.Date;

public class UserVO {
	private String username;
	private String password;
	private String name;
	private String mobilePhone;
	private String gender;
	private String birthDate;
	
	public UserVO() {
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobilePhone() {
		return mobilePhone;
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	@Override
	public String toString() {
		return "UserVO [username=" + username + ", password=" + password + ", name=" + name + ", mobilePhone="
				+ mobilePhone + ", gender=" + gender + ", birthDate=" + birthDate + "]";
	}
	
}
