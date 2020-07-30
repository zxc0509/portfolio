package question;


import java.sql.Timestamp;

public class questionVO {
	private String id; 
	private int num; 
	private String title; 
	private String content; 
	private int re_ref;
	private int re_lev;
	private int re_seq;
	private Timestamp date; 
	private int count; 
	private int status;
	public questionVO() {
		
	}
	
	
  
	public questionVO(String id,  String title, String content, int re_ref, int re_lev, int re_seq) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.re_ref = re_ref;
		this.re_lev = re_lev;
		this.re_seq = re_seq;
	}



	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
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


	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
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



	public int getStatus() {
		return status;
	}



	public void setStatus(int status) {
		this.status = status;
	}


	

	
}

