package service;

public class HeartInfo {
	private String m_email;
	private int t_seq;
	
	
	public HeartInfo() {
		// TODO Auto-generated constructor stub
	}
	
	public HeartInfo(String m_email, int t_seq) {
		this.m_email = m_email;
		this.t_seq = t_seq;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public int getT_seq() {
		return t_seq;
	}
	public void setT_seq(int t_seq) {
		this.t_seq = t_seq;
	}
	
	
}
