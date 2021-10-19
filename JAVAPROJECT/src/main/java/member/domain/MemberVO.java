package member.domain;

import java.sql.Timestamp;

public class MemberVO {
	private int memberNum;
	private String userId;
	private String userPw;
	private String userName;
	private String userEmail;
	private Timestamp createAccount;
	
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public Timestamp getCreateAccount() {
		return createAccount;
	}
	public void setCreateAccount(Timestamp createAccount) {
		this.createAccount = createAccount;
	}
	@Override
	public String toString() {
		return "MemberVO [memberNum=" + memberNum + ", userId=" + userId + ", userPw=" + userPw + ", userName="
				+ userName + ", userEmail=" + userEmail + ", createAccount=" + createAccount + "]";
	}
	
	
}
	