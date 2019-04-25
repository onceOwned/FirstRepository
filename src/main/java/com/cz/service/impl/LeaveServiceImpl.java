package com.cz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cz.dao.LeaveMapper;
import com.cz.pojo.Leave_user;
import com.cz.service.LeaveService;

@Service
public class LeaveServiceImpl implements LeaveService{
	
	@Autowired
	private LeaveMapper leaveMapper;

	@Override
	public void insert(Leave_user leave) {
		// TODO Auto-generated method stub
		leaveMapper.insert(leave);
	}

	@Override
	public List<Leave_user> applying(String empName) {
		// TODO Auto-generated method stub
		return leaveMapper.applying(empName);
	}

	@Override
	public List<Leave_user> Unsuccessful(String empName) {
		// TODO Auto-generated method stub
		return leaveMapper.Unsuccessful(empName);
	}

	@Override
	public List<Leave_user> successful(String empName) {
		// TODO Auto-generated method stub
		return leaveMapper.successful(empName);
	}

	@Override
	public List<Leave_user> Rejected(String empName, Integer levels) {
		// TODO Auto-generated method stub
		return leaveMapper.Rejected(empName, levels);
	}

	@Override
	public List<Leave_user> Accepted(String empName, Integer levels) {
		// TODO Auto-generated method stub
		return leaveMapper.Accepted(empName, levels);
	}

	@Override
	public List<Leave_user> Approval(String empName, Integer levels,String deptName) {
		// TODO Auto-generated method stub
		return leaveMapper.Approval(empName, levels,deptName);
	}

	@Override
	public void update_rejected(String levels, Leave_user leave) {
		// TODO Auto-generated method stub
		leaveMapper.update_rejected(levels, leave);
	}

	@Override
	public void update_Accepted(String levels, Leave_user leave) {
		// TODO Auto-generated method stub
		leaveMapper.update_Accepted(levels, leave);
	}

	@Override
	public Leave_user findByTime(String empName, String applyTime) {
		// TODO Auto-generated method stub
		return leaveMapper.findByTime(empName, applyTime);
	}
}
