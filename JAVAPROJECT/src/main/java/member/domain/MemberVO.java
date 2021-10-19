package member.domain;

import java.sql.Date;

public class MemberVO {
	private int memberNum;
	private String id;
	private String password;
	private String name;
	private String email;
	private Date createAccount;
	
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getCreateAccount() {
		return createAccount;
	}
	public void setCreateAccount(Date createAccount) {
		this.createAccount = createAccount;
	}
	
	@Override
	public String toString() {
		return "MemberVO [memberNum=" + memberNum + ", id=" + id + ", password=" + password + ", name=" + name
				+ ", email=" + email + ", createAccount=" + createAccount + "]";
	}
}
