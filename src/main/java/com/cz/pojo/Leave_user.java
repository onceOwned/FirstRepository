package com.cz.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class Leave_user {
	private int leaveId;
	private String empName;
	private String jobName;
	private String deptName;
	private String type;
	private String reson;
	private Date applyTime;
	private Date startTime;
	private Date endTime;
	private Date totalTime;
	private String viewOne;
	private String viewTwo;
	private String viewThree;
	private Date manager;
	private String dept_manager;
	private String general;
	private String applyStatus;//申请状态
	private int state;//审批状态

}
