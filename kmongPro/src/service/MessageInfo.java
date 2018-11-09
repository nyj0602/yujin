package service;

import java.util.Date;

public class MessageInfo {
	private int t_seq;
	private String buy_email;
	private int msg_seq;
	private String msg_content;
	private Date msg_send;
	private String msg_sender;
	private String t_name;
	private String image;
	private String seller_name;
	private String seller_profile;
	private int order_num;
	private String p_state;
	
	
	
	public MessageInfo(int t_seq, String buy_email, int msg_seq, String msg_content, Date msg_send, String msg_sender,
			String t_name, String image, String seller_name, String seller_profile, int order_num, String p_state) {

		this.t_seq = t_seq;
		this.buy_email = buy_email;
		this.msg_seq = msg_seq;
		this.msg_content = msg_content;
		this.msg_send = msg_send;
		this.msg_sender = msg_sender;
		this.t_name = t_name;
		this.image = image;
		this.seller_name = seller_name;
		this.seller_profile = seller_profile;
		this.order_num = order_num;
		this.p_state = p_state;
	}
	public int getT_seq() {
		return t_seq;
	}
	public void setT_seq(int t_seq) {
		this.t_seq = t_seq;
	}
	public String getBuy_email() {
		return buy_email;
	}
	public void setBuy_email(String buy_email) {
		this.buy_email = buy_email;
	}
	public int getMsg_seq() {
		return msg_seq;
	}
	public void setMsg_seq(int msg_seq) {
		this.msg_seq = msg_seq;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	public Date getMsg_send() {
		return msg_send;
	}
	public void setMsg_send(Date msg_send) {
		this.msg_send = msg_send;
	}
	public String getMsg_sender() {
		return msg_sender;
	}
	public void setMsg_sender(String msg_sender) {
		this.msg_sender = msg_sender;
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
	public String getSeller_name() {
		return seller_name;
	}
	public void setSeller_name(String seller_name) {
		this.seller_name = seller_name;
	}
	public String getSeller_profile() {
		return seller_profile;
	}
	public void setSeller_profile(String seller_profile) {
		this.seller_profile = seller_profile;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getP_state() {
		return p_state;
	}
	public void setP_state(String p_state) {
		this.p_state = p_state;
	}
	
	
	
	
	
	
}
