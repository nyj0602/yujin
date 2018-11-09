package dto;

public class EvaluationDTO {
	public EvaluationDTO() {}
	
	String order_num;
	String e_star;
	String e_content;
	String m_email;
	String t_seq;
	String t_date;
	public String gett_date() {
		return t_date;
	}
	public void sett_date(String t_date) {
		this.t_date = t_date;
	}
	public String getorder_num() {
		return order_num;
	}
	public void setorder_num(String order_num) {
		this.order_num = order_num;
	}
	public String gete_star() {
		return e_star;
	}
	public void sete_star(String e_star) {
		this.e_star = e_star;
	}
	public String gete_content() {
		return e_content;
	}
	public void sete_content(String e_content) {
		this.e_content = e_content;
	}
	public String getm_email() {
		return m_email;
	}
	public void setm_email(String m_email) {
		this.m_email = m_email;
	}
	public String gett_seq() {
		return t_seq;
	}
	public void sett_seq(String t_seq) {
		this.t_seq = t_seq;
	}
	
	
}
