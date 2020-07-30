package admin;

import java.sql.Timestamp;

public class adminVO {
	private String id;
	private int num;
	private String passwd ;
	private String name ;
	private String birth;
	private String email;
	private String phone;
	private String address;
	private String address2;
	private String address3;
	private String address4;
	private String title;
	private String content;
	private int re_ref;
	private int re_lev;
	private int re_seq;
	private Timestamp date;
	
	public adminVO(String id, String title, String content) {
		this.id = id ;
		this.title = title ;
		this.content = content ;
	}
	
	public adminVO(String id, String passwd, String name, String birth, String email, String phone, String address,
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

	public adminVO(String passwd, String name, String birth, String email, String phone, String address) {
		this.passwd = passwd;
		this.name = name;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
		this.address = address;
	}
	
	public adminVO() {
		
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
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRe_ref() {
		return re_ref;
	}
	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}
	public int getRe_lev() {
		return re_lev;
	}
	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}
	public int getRe_seq() {
		return re_seq;
	}
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}

}
