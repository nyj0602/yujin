package service;

public class MystarAVGInfo {
	private String satisfaction;
	private int a;
	private int b;
	private int c;
	private int d;
	
	public MystarAVGInfo() {
		
	}
	
	public MystarAVGInfo(String satisfaction, int a, int b, int c, int d) {
		this.satisfaction = satisfaction;
		this.a = a;
		this.b = b;
		this.c = c;
		this.d = d;
	}
	
	
	
	public MystarAVGInfo(int a, int b, int c, int d) {
		super();
		this.a = a;
		this.b = b;
		this.c = c;
		this.d = d;
	}

	public String getSatisfaction() {
		return satisfaction;
	}
	public void setSatisfaction(String satisfaction) {
		this.satisfaction = satisfaction;
	}
	public int getA() {
		return a;
	}
	public void setA(int a) {
		this.a = a;
	}
	public int getB() {
		return b;
	}
	public void setB(int b) {
		this.b = b;
	}
	public int getC() {
		return c;
	}
	public void setC(int c) {
		this.c = c;
	}
	public int getD() {
		return d;
	}
	public void setD(int d) {
		this.d = d;
	}
	
	
}
