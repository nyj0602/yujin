package dto;

public class CategoryDTO {
	private int c_id;
	private int c_superid;
	private int c_level;
	private String c_group;
	public CategoryDTO(int c_id, int c_superid, int c_level, String c_group) {
//		super();
		this.c_id = c_id;
		this.c_superid = c_superid;
		this.c_level = c_level;
		this.c_group = c_group;
	}
	
	public CategoryDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public int getC_superid() {
		return c_superid;
	}
	public void setC_superid(int c_superid) {
		this.c_superid = c_superid;
	}
	public int getC_level() {
		return c_level;
	}
	public void setC_level(int c_level) {
		this.c_level = c_level;
	}
	public String getC_group() {
		return c_group;
	}
	public void setC_group(String c_group) {
		this.c_group = c_group;
	}
	
	
}
