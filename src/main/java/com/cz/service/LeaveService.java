package com.cz.service;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cz.pojo.Leave_user;

public interface LeaveService {
	
	void insert(Leave_user leave);
	
	List<Leave_user> applying(String empName);//申请中
	
	List<Leave_user> Unsuccessful(String empName);//申请失败
	
	List<Leave_user> successful(String empName);//申请成功
	
	List<Leave_user> Rejected(String empName,Integer levels);//已驳回
	
	List<Leave_user> Accepted(String empName,Integer levels);//已批准
	
	List<Leave_user> Approval(String empName,Integer levels,String deptName);//审批中
	
	void update_rejected(String levels,Leave_user leave);//驳回
	
	void update_Accepted(String levels,Leave_user leave);//批准
	
	Leave_user findByTime(String empName,String applyTime);


}
