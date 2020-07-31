package org.kh.fin.order.domain;

public class Status {
	private int statusNum;
	private String statusName;
	public Status() {
		// TODO Auto-generated constructor stub
	}
	public Status(int statusNum, String statusName) {
		super();
		this.statusNum = statusNum;
		this.statusName = statusName;
	}
	public int getStatusNum() {
		return statusNum;
	}
	public void setStatusNum(int statusNum) {
		this.statusNum = statusNum;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	@Override
	public String toString() {
		return "Status [statusNum=" + statusNum + ", statusName=" + statusName + "]";
	}
}
