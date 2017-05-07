package com.cuit.secims.xp.enums;


public enum ProjectStateEnum {
	
	WAIT(1,"项目等待接收"),
	PROCESSING(2,"项目进行中"),
	END(3,"项目结束");
	
	private int state;
	private String stateInfo;
	
	private ProjectStateEnum(int state, String stateInfo) {
		this.state = state;
		this.stateInfo = stateInfo;
	}
	
	public int getState() {
		return state;
	}
	public String getStateInfo() {
		return stateInfo;
	}
	
	
}
