package service;

public class SpecialTalentInfo {

	private String m_name;
	private String m_email;
	private String m_profile;
	private int t_seq;
	private String t_name;
	private String image;
	private int op_price;
	
	public SpecialTalentInfo() {
		// TODO Auto-generated constructor stub
	}

	public SpecialTalentInfo(String m_name, String m_email, String m_profile, int t_seq, String t_name, String image,
			int op_price) {
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_profile = m_profile;
		this.t_seq = t_seq;
		this.t_name = t_name;
		this.image = image;
		this.op_price = op_price;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getOp_price() {
		return op_price;
	}

	public void setOp_price(int op_price) {
		this.op_price = op_price;
	}
	
	
	
	
}
