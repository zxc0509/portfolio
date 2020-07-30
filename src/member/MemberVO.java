package member;

import java.sql.Date;

public class MemberVO {
	private String id;
	private String passwd;
	private String name;
	private String birth;
	private String email;
	private String phone;
	private String address;
	private String address2;
	private String address3;
	private String address4;
	
	
	public MemberVO(String passwd, String name, String birth, String email, String phone, String address,
			String address2, String address3, String address4) {
		super();
		this.passwd = passwd;
		this.name = name;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.address2 = address2;
		this.address3 = address3;
		this.address4 = address4;
	}
	public MemberVO() {
		
	}
	public MemberVO(String id, String passwd, String name, String birth, String email, String phone, String address,
			String address2, String address3, String address4) {
		super();
		this.id = id;
		this.passwd = passwd;
		this.name = name;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.address2 = address2;
		this.address3 = address3;
		this.address4 = address4;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPasswd() {
		return passwd;
	}


	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getBirth() {
		return birth;
	}


	public void setBirth(String birth) {
		this.birth = birth;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getAddress2() {
		return address2;
	}


	public void setAddress2(String address2) {
		this.address2 = address2;
	}


	public String getAddress3() {
		return address3;
	}


	public void setAddress3(String address3) {
		this.address3 = address3;
	}


	public String getAddress4() {
		return address4;
	}


	public void setAddress4(String address4) {
		this.address4 = address4;
	}
	
}
 