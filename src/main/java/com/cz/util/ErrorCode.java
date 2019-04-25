package com.cz.util;

public enum ErrorCode {
	SUCCESS(1, "success", "成功"), 
	APPLY_FAIL(0,"applyfail","申请失败"),
	APPLYING(2,"applying","申请中"),
	APPLY_SUCCESS(3,"applysuccess","申请成功"),
	ACCEPTED(4,"ACCEPTED","已批准申请"),
	Rejected(5,"applysuccess","已驳回申请"),
	LOGINFAIL(6,"loginexception","登录账号异常");
	
	private int code;
	private String cnMessage;
	private String message;
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getCnMessage() {
		return cnMessage;
	}
	public void setCnMessage(String cnMessage) {
		this.cnMessage = cnMessage;
	}

	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	private ErrorCode(int code,String cnMessage) {
		this.cnMessage = cnMessage;
		this.code = code;
	}
	private ErrorCode(int code, String message, String cnMessage) {
		this.cnMessage = cnMessage;
		this.message = message;
		this.code = code;
	}
}
