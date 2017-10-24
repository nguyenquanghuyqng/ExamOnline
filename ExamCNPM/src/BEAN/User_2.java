package BEAN;

public class User_2 {
	private String username;
	private String password;
	private String fullname;
	private String birthday;
	private String gender;
	private String country;
	private String phone;
	private String email;
	private String image;
	private int roleid;

	
	public User_2() {}
	
	public User_2(String username, String password) {
		this.username = username;
		this.password = password;
	}
	
	public User_2(String fullname, String birthday,String gender, String country, String phone,String email) {
		this.fullname = fullname;
		this.birthday = birthday;
		this.gender = gender;
		this.country = country;
		this.phone = phone;
		this.email = email;
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

	public int getRoleid() {
		return roleid;
	}

	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
