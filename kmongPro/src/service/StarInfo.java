package service;

public class StarInfo {
	private double e_star;
	private int t_seq;
	private int count;
	
	public StarInfo() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public StarInfo(double e_star, int t_seq, int count) {
		this.e_star = e_star;
		this.t_seq = t_seq;
		this.count = count;
	}



	public double getE_star() {
		return e_star;
	}
	public void setE_star(double e_star) {
		this.e_star = e_star;
	}
	public int getT_seq() {
		return t_seq;
	}
	public void setT_seq(int t_seq) {
		this.t_seq = t_seq;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	

	
}
