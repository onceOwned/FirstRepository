package com.cz.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.cz.pojo.Emp;
import com.cz.pojo.Leave_user;
import com.cz.service.EmpService;
import com.cz.service.LeaveService;
import com.cz.util.ErrorCode;
import com.cz.util.Result;

@Controller
public class TestController {
	@Autowired
	private EmpService empService;
	@Autowired
	private LeaveService leaveService;
	
	@RequestMapping("lay")
	public String lay() {
		return "lay";
	}
	
	@RequestMapping("test1")
	public String test1() {
		return "test1";
	}
	@RequestMapping("test2")
	public String test2() {
		return "test2";
	}
	@RequestMapping("test3")
	public String test3() {
		return "test3";
	}
	@RequestMapping("test4")
	public String test4() {
		return "test4";
	}
	@RequestMapping("test5")
	public String test5() {
		return "test5";
	}
	@RequestMapping("test6")
	public String test6() {
		return "test6";
	}
	@PostMapping("logins")
	@ResponseBody
	private Result Logins(Emp loginemp,HttpSession session) {
		JSONObject jsonObject = new JSONObject();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Emp emp = empService.login(loginemp.getEmpName());
		int levels = emp.getLevels();//权限级别
		if(emp != null && loginemp.getPwd().equals(emp.getPwd())) {
			resultMap.put("emp", emp);
			List<Leave_user> Accepted = null;
			List<Leave_user> Rejected = null;
			List<Leave_user> Approval = null;
			//根据权限级别绑定展示数据
			if(levels > 0) {
				Accepted = leaveService.Accepted(emp.getEmpName(), levels);
				Rejected = leaveService.Rejected(emp.getEmpName(), levels);
				Approval = leaveService.Approval(emp.getEmpName(), levels,emp.getDeptName());
			}
			List<Leave_user> applying = leaveService.applying(emp.getEmpName());
			List<Leave_user> unsuccess = leaveService.Unsuccessful(emp.getEmpName());
			List<Leave_user> success = leaveService.successful(emp.getEmpName());
			resultMap.put("Accepted", Accepted);//已批准
			resultMap.put("Rejected", Rejected);//已驳回
			resultMap.put("Approval", Approval);//审批中
			resultMap.put("applying", applying);//申请中 
			resultMap.put("unsuccess", unsuccess);//申请失败
			resultMap.put("success", success);//申请成功
		}else {
			return Result.failResult(ErrorCode.LOGINFAIL, "账号登录失败");
		}
		return Result.successfy(resultMap);
	}

}
