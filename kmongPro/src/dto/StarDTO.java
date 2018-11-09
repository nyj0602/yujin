package dto;

public class StarDTO {
	public StarDTO() {
		
	}
	
	private String t_seq;
	private String avg;
	private String num;
	public String gett_seq() {
		return t_seq;
	}
	public void sett_seq(String t_seq) {
		this.t_seq = t_seq;
	}
	public String getavg() {
		return avg;
	}
	public void setavg(String avg) {
		this.avg = avg;
	}
	public String getnum() {
		return num;
	}
	public void setnum(String num) {
		this.num = num;
	}
	
	
}
