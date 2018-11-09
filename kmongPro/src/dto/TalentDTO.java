package dto;

import java.util.Date;

public class TalentDTO {
	private String t_seq;
	private String t_name;
	private String t_upload;
	private String t_as;
	private String t_request;
	private String t_service;
	private String t_date;
	private String m_email;
	private String m_sep;
	private String m_name;
	private String c_id;
	private String image;
	
	private String t_heartseq;

	private String op_price;
	
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getm_sep() {
		return m_sep;
	}

	public void setm_sep(String m_sep) {
		this.m_sep = m_sep;
	}
	

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public TalentDTO() {
		
	}

	public String gett_heartseq() {
		return t_heartseq;
	}

	public void sett_heartseq(String t_heartseq) {
		this.t_heartseq = t_heartseq;
	}

	public String getOp_price() {
		return op_price;
	}

	public void setOp_price(String op_price) {
		this.op_price = op_price;
	}

	public String gett_seq() {
		return t_seq;
	}

	public void sett_seq(String t_seq) {
		this.t_seq = t_seq;
	}

	public String gett_name() {
		return t_name;
	}

	public void sett_name(String t_name) {
		this.t_name = t_name;
	}

	public String gett_upload() {
		return t_upload;
	}

	public void setT_upload(String t_upload) {
		this.t_upload = t_upload;
	}

	public String getT_as() {
		return t_as;
	}

	public void setT_as(String t_as) {
		this.t_as = t_as;
	}

	public String getT_request() {
		return t_request;
	}

	public void setT_request(String t_request) {
		this.t_request = t_request;
	}

	public String getT_service() {
		return t_service;
	}

	public void setT_service(String t_service) {
		this.t_service = t_service;
	}

	public String getT_date() {
		return t_date;
	}

	public void setT_date(String t_date) {
		this.t_date = t_date;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	

	
	
	
}
