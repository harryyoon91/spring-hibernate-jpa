package me.yonghak.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="USERS")
public class UserVO {
	
	@Id
	@Column(name="user_no")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int user_no;
	private String id;
	private String pwd;
	private String email;
	private String verified = "N";
	private String confirmlink;
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getVerified() {
		return verified;
	}
	public void setVerified(String verified) {
		this.verified = verified;
	}
	public String getConfirmlink() {
		return confirmlink;
	}
	public void setConfirmlink(String confirmlink) {
		this.confirmlink = confirmlink;
	}
	
	@Override
	public String toString() {
		return "UserVO [user_no=" + user_no + ", id=" + id + ", pwd=" + pwd + ", email=" + email + ", verified="
				+ verified + ", confirmlink=" + confirmlink + "]";
	}
}
