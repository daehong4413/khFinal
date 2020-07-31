package org.kh.fin.member.domain;

import java.sql.Date;

public class Member {
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String nickName;
	private String gender;
	private String email;
	private String birthDay;
	private String phone;
	private String post;
	private String address;
	private String addressDetail; 
	private String status;
	private int gradeNum;
	private Date cdt;
	private Date mdt;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String memberId, String memberPwd, String memberName, String nickName, String gender, String email,
			String birthDay, String phone, String post, String address, String addressDetail, String status,
			int gradeNum, Date cdt, Date mdt) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.nickName = nickName;
		this.gender = gender;
		this.email = email;
		this.birthDay = birthDay;
		this.phone = phone;
		this.post = post;
		this.address = address;
		this.addressDetail = addressDetail;
		this.status = status;
		this.gradeNum = gradeNum;
		this.cdt = cdt;
		this.mdt = mdt;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getGradeNum() {
		return gradeNum;
	}

	public void setGradeNum(int gradeNum) {
		this.gradeNum = gradeNum;
	}

	public Date getCdt() {
		return cdt;
	}

	public void setCdt(Date cdt) {
		this.cdt = cdt;
	}

	public Date getMdt() {
		return mdt;
	}

	public void setMdt(Date mdt) {
		this.mdt = mdt;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName=" + memberName
				+ ", nickName=" + nickName + ", gender=" + gender + ", email=" + email + ", birthDay=" + birthDay
				+ ", phone=" + phone + ", post=" + post + ", address=" + address + ", addressDetail=" + addressDetail
				+ ", status=" + status + ", gradeNum=" + gradeNum + ", cdt=" + cdt + ", mdt=" + mdt + "]";
	}

	
}
