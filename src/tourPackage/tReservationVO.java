package tourPackage;

import java.sql.Timestamp;

public class tReservationVO {
	int num;
	int tour_num;
	String tour_name;
	Timestamp start_date;
	Timestamp end_date;
	String transport;
	String stay;
	int price;
	int reserv_member;
	String reserv_email;
	String reserv_id;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getTour_num() {
		return tour_num;
	}
	public void setTour_num(int tour_num) {
		this.tour_num = tour_num;
	}
	public String getTour_name() {
		return tour_name;
	}
	public void setTour_name(String tour_name) {
		this.tour_name = tour_name;
	}
	public Timestamp getStart_date() {
		return start_date;
	}
	public void setStart_date(Timestamp start_date) {
		this.start_date = start_date;
	}
	public Timestamp getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Timestamp end_date) {
		this.end_date = end_date;
	}
	public String getTransport() {
		return transport;
	}
	public void setTransport(String transport) {
		this.transport = transport;
	}
	public String getStay() {
		return stay;
	}
	public void setStay(String stay) {
		this.stay = stay;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getReserv_member() {
		return reserv_member;
	}
	public void setReserv_member(int reserv_member) {
		this.reserv_member = reserv_member;
	}
	public String getReserv_email() {
		return reserv_email;
	}
	public void setReserv_email(String reserv_email) {
		this.reserv_email = reserv_email;
	}
	public String getReserv_id() {
		return reserv_id;
	}
	public void setReserv_id(String reserv_id) {
		this.reserv_id = reserv_id;
	}
	
	
}


