package com.cz.dao;

import org.apache.ibatis.annotations.Param;

import com.cz.pojo.Emp;

public interface EmpMapper {
	
	Emp login(@Param("empName") String empName);
	

}
