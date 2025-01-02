package devonboot.sample.office.common.practice.model;

		
/**
 * @Class Name : MiniUser.java
 * @Description : MiniUser VO class
 * @Modification Information
 *
 * @author author
 * @since 2024-03-13
 * @version 1.0
 * @see
 *  
 *  Copyright (C) LG CNS All rights reserved.
 */
public class MiniUser {
	
	/** CUST_NO */
	private String custNo;
	
	/** CUST_NM */
	private String custNm;
	
	/** BRTH_DY */
	private String brthDy;
	
	/** EMAIL_ID */
	private String emailId;
	
	/** MOBILE_NO */
	private String mobileNo;
	
	public String getCustNo() {
		return this.custNo;
	}
	
	public void setCustNo(String custNo) {
		this.custNo = custNo;
	}
	
	public String getCustNm() {
		return this.custNm;
	}
	
	public void setCustNm(String custNm) {
		this.custNm = custNm;
	}
	
	public String getBrthDy() {
		return this.brthDy;
	}
	
	public void setBrthDy(String brthDy) {
		this.brthDy = brthDy;
	}
	
	public String getEmailId() {
		return this.emailId;
	}
	
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	
	public String getMobileNo() {
		return this.mobileNo;
	}
	
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	
}
