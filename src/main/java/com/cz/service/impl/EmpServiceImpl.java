package com.cz.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cz.dao.EmpMapper;
import com.cz.pojo.Emp;
import com.cz.service.EmpService;

@Service
public class EmpServiceImpl implements EmpService{
	
	@Autowired
	private EmpMapper empmapper;

	@Override
	public Emp login(String empName) {
		// TODO Auto-generated method stub
		return empmapper.login(empName);
	}
	

}
