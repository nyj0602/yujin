package service;

import java.util.Date;

public class sellerInfo {
	private String m_email;
	private String m_profile;
	private int p_price;
	private int p_term;
	private String req_list;
	private Date deadline;
	private String p_state;
	private Date c_date;
	private int op_price;
	private int t_seq;
	private String t_name;
	private int order_num;
	
	public sellerInfo() {
		
	}
	
	public sellerInfo(String m_email, String m_profile, int p_price, int p_term, String req_list, Date deadline,
			String p_state, Date c_date, int op_price, int t_seq, String t_name, int order_num) {
		this.m_email = m_email;
		this.m_profile = m_profile;
		this.p_price = p_price;
		this.p_term = p_term;
		this.req_list = req_list;
		this.deadline = deadline;
		this.p_state = p_state;
		this.c_date = c_date;
		this.op_price = op_price;
		this.t_seq = t_seq;
		this.t_name = t_name;
		this.order_num = order_num;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_profile() {
		return m_profile;
	}
	public void setM_profile(String m_profile) {
		this.m_profile = m_profile;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_term() {
		return p_term;
	}
	public void setP_term(int p_term) {
		this.p_term = p_term;
	}
	public String getReq_list() {
		return req_list;
	}
	public void setReq_list(String req_list) {
		this.req_list = req_list;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	public String getP_state() {
		return p_state;
	}
	public void setP_state(String p_state) {
		this.p_state = p_state;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	public int getOp_price() {
		return op_price;
	}
	public void setOp_price(int op_price) {
		this.op_price = op_price;
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
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	
	

	
	
	
	
	
}
