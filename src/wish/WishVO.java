package wish;

import java.sql.Timestamp;

public class WishVO {
	int wish_num; 
	int tour_num;
	String wish_id;
	
	public int getWish_num() {
		return wish_num;
	}
	public void setWish_num(int wish_num) {
		this.wish_num = wish_num;
	}
	public int getTour_num() {
		return tour_num;
	}
	public void setTour_num(int tour_num) {
		this.tour_num = tour_num;
	}
	public String getWish_id() {
		return wish_id;
	}
	public void setWish_id(String wish_id) {
		this.wish_id = wish_id;
	}
	
}


