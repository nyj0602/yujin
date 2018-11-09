package service;

public class AdvertiseInfo {
	private int t_seq;
	private String t_name;
	
	public AdvertiseInfo() {
		
	}
	
	
	
	public AdvertiseInfo(int t_seq, String t_name) {
		this.t_seq = t_seq;
		this.t_name = t_name;
	}



	public int getT_seq() {
		return t_seq;
	}
	public void setT_seq(int t_seq) {
		this.t_seq = t_seq;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	
	
}
