package com.cuit.secims.mw.util;

/**
 * 结果描述
 */
public class Result {

	// 是否成功
	private boolean success = false;
	
	// 返回信息描述
	private String msg;
	
	// 返回码
	private int code;

	
	
	
	//构造函数
	public Result(){}
	
	
	public Result(boolean success) {
		super();
		this.success = success;
	}
	
	
	public Result(String msg, int code) {
		super();
		this.msg = msg;
		this.code = code;
	}
	
	
	public Result(boolean success, String msg, int code) {
		super();
		this.success = success;
		this.msg = msg;
		this.code = code;
	}


	// setter and getter


	public boolean isSuccess() {
		return success;
	}

	
	public void setSuccess(boolean success) {
		this.success = success;
	}

	
	public String getMsg() {
		return msg;
	}


	public void setMsg(String msg) {
		this.msg = msg;
	}


	public int getCode() {
		return code;
	}


	public void setCode(int code) {
		this.code = code;
	}



	@Override
	public String toString() {
		return "Result [success=" + success + ", msg=" + msg + ", code=" + code
				+ "]";
	}
	
	
}
