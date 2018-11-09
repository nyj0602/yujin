package dto;

public class MemberDTO {
	private String m_email;
	private String m_name;
	private String m_pwd;
	private String m_sep;
	private String m_profile;

	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String m_email, String m_name, String m_pwd, String m_sep, String m_profile) {
		super();
		this.m_email = m_email;
		this.m_name = m_name;
		this.m_pwd = m_pwd;
		this.m_sep = m_sep;
		this.m_profile = m_profile;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_pwd() {
		return m_pwd;
	}

	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}

	public String getM_sep() {
		return m_sep;
	}

	public void setM_sep(String m_sep) {
		this.m_sep = m_sep;
	}

	public String getM_profile() {
		return m_profile;
	}

	public void setM_profile(String m_profile) {
		this.m_profile = m_profile;
	}

	public boolean matchPassword(String pwd) {
		return m_pwd.equals(pwd);
	}

}
