package com.cz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cz.pojo.Leave_user;

public interface LeaveMapper {
	
	void insert(Leave_user leave);
	
	List<Leave_user> applying(@Param("empName") String empName);//申请中
	
	List<Leave_user> Unsuccessful(@Param("empName") String empName);//申请失败
	
	List<Leave_user> successful(@Param("empName") String empName);//申请成功
	
	List<Leave_user> Rejected(@Param("empName") String empName,@Param("levels") Integer levels);//已驳回
	
	List<Leave_user> Accepted(@Param("empName") String empName,@Param("levels") Integer levels);//已批准
	
	List<Leave_user> Approval(@Param("empName") String empName,@Param("levels") Integer levels,@Param("deptName") String deptName);//审批中
	
	void update_rejected(@Param("levels") String levels,@Param("leaveId") Leave_user leave);//驳回
	
	void update_Accepted(@Param("levels") String levels,@Param("leave") Leave_user leave);//批准
	
	Leave_user findByTime(@Param("empName") String empName,@Param("applyTime") String applyTime);

}
