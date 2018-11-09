package talent;

import java.util.Date;

public class TalentDTO {
	private int t_seq;
	private String t_name;
	private Date t_upload;
	private String t_as;
	private String t_request;
	private String t_service;
	private Date t_date;
	private String m_email;
	public TalentDTO(int t_seq, String t_name, Date t_upload, String t_as, String t_request, String t_service,
			Date t_date, String m_email) {
		super();
		this.t_seq = t_seq;
		this.t_name = t_name;
		this.t_upload = t_upload;
		this.t_as = t_as;
		this.t_request = t_request;
		this.t_service = t_service;
		this.t_date = t_date;
		this.m_email = m_email;
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
	public Date getT_upload() {
		return t_upload;
	}
	public void setT_upload(Date t_upload) {
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
	public Date getT_date() {
		return t_date;
	}
	public void setT_date(Date t_date) {
		this.t_date = t_date;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	
	
	
}
