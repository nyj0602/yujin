package dto;

import java.util.Date;

public class LicenseDTO {
	int ml_seq;
	String ml_content;
	String ml_date;
	String ml_org;
	String m_email;
	
	public LicenseDTO() {
	}

	public LicenseDTO(String ename, double sal) {
	}

	public int getMl_seq() {
		return ml_seq;
	}

	public void setMl_seq(int ml_seq) {
		this.ml_seq = ml_seq;
	}

	public String getMl_content() {
		return ml_content;
	}

	public void setMl_content(String ml_content) {
		this.ml_content = ml_content;
	}

	public String getMl_date() {
		return ml_date;
	}

	public void setMl_date(String ml_date) {
		this.ml_date = ml_date;
	}

	public String getMl_org() {
		return ml_org;
	}

	public void setMl_org(String ml_org) {
		this.ml_org = ml_org;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	
	
}
