package com.cz.util;

import java.io.Serializable;

import org.springframework.util.StringUtils;

public class Result<T> implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer code;
	private ErrorCode errorCode;
	private String cnMessage;
	private String message;
	private T data;

	public Result(ErrorCode errorCode, T data) {
        super();//调用的是父类默认的构造方法，这样可以对父类进行初始化
        this.errorCode = errorCode;
        this.data = data;
    }

    public Result(ErrorCode errorCode) {
        super();
        this.errorCode = errorCode;
    }

    public Result() {
        super();
    }

    public ErrorCode getErrorCode() {
		return errorCode;
	}

	public static <T> Result successfy(T data) {
        Result<T> result = new Result<T>(ErrorCode.SUCCESS, data);
        return result;
    }

    public static <T> Result successResult(T data) {
        return successfy(data);
    }

    public static Result failResult(ErrorCode errorCode, String cnMessage) {
        Result result = new Result(errorCode);
        result.setCnMessage(cnMessage);
        return result;
    }

    public static Result failResult(ErrorCode errorCode) {
        Result result = new Result(errorCode);
        result.setMessage(errorCode.getMessage());
        return result;
    }

    public Boolean isSuccess() {
        if (this.errorCode == null && this.getCode() == null) {
            return null;
        }
        return ErrorCode.SUCCESS.getCode() == this.getCode();
    }

    public void setErrorCode(ErrorCode errorCode) {
        this.errorCode = errorCode;
        this.code = errorCode.getCode();
        this.message = errorCode.getMessage();
        this.cnMessage = errorCode.getCnMessage();
    }

    public T getData() {
        return data;
    }


    public void setData(T data) {
        this.data = data;
    }

    public Integer getCode() {
        if (errorCode != null && code == null) {
            code = errorCode.getCode();
        }
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        if (errorCode != null && StringUtils.isEmpty(message)) {
            message = errorCode.getMessage();
        }

        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getCnMessage() {
        if (errorCode != null && StringUtils.isEmpty(cnMessage)) {
            cnMessage = errorCode.getCnMessage();
        }
        return cnMessage;
    }

    public void setCnMessage(String cnMessage) {
        this.cnMessage = cnMessage;
    }
}
