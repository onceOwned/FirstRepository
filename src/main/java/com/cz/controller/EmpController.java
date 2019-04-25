package com.cz.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import com.cz.util.TimeResult;

@Controller
public class EmpController {
	
	@Autowired
	private EmpService empService;
	@Autowired
	private LeaveService leaveService;
	
	@RequestMapping("gologin")
	public String gologin() {
		return "login";
	}
	@RequestMapping("goleave")
	public String  goleave() {
		return "leave";
	}
	
//	登录时携带了数据
//	@PostMapping("login")
//	@ResponseBody
//	private Result Login(Emp loginemp,HttpSession session) {
//		JSONObject jsonObject = new JSONObject();
//		Emp emp = empService.login(loginemp.getEmpName());
//		int levels = emp.getLevels();
//		if(emp != null && loginemp.getPwd().equals(emp.getPwd())) {
//			jsonObject.put("emp", emp);
////			session.setAttribute("emp", emp);
//			List<Leave_user> Accepted = null;
//			List<Leave_user> Rejected = null;
//			List<Leave_user> Approval = null;
//			//根据权限级别绑定展示数据
//			if(levels > 0) {
//				Accepted = leaveService.Accepted(emp.getEmpName(), levels);
//				Rejected = leaveService.Rejected(emp.getEmpName(), levels);
//				Approval = leaveService.Approval(emp.getEmpName(), levels);
//				jsonObject.put("Accepted", Accepted);//已批准
//				jsonObject.put("Rejected", Rejected);//已驳回
//				jsonObject.put("Approval", Approval);//审批中
//			}
//			List<Leave_user> applying = leaveService.applying(emp.getEmpName());
//			List<Leave_user> unsuccess = leaveService.Unsuccessful(emp.getEmpName());
//			List<Leave_user> success = leaveService.successful(emp.getEmpName());
//			jsonObject.put("applying", applying);//申请中
//			jsonObject.put("unsuccess", unsuccess);//申请失败
//			jsonObject.put("success", success);//申请成功
//		}else {
//			return Result.failResult(ErrorCode.LOGINFAIL, "账号登录失败");
//		}
//		return Result.successfy(jsonObject);
//	}
	
	//登录未携带数据
	
	@PostMapping("login")
	@ResponseBody
	private Result Login(Emp loginemp,HttpSession session) {
		JSONObject jsonObject = new JSONObject();
		Emp emp = empService.login(loginemp.getEmpName());
		if(emp != null && loginemp.getPwd().equals(emp.getPwd())) {
			jsonObject.put("emp", emp);
			session.setAttribute("emp", emp);
		}else {
			return Result.failResult(ErrorCode.LOGINFAIL, "账号登录失败");
		}
		return Result.successfy(jsonObject);
	}
	@ResponseBody
	@RequestMapping("leave_main")	
	public Result  leave(HttpSession session) {
		JSONObject jsonObject = new JSONObject();
		Emp emp = (Emp) session.getAttribute("emp");
		int levels = emp.getLevels();//权限级别
		List<Leave_user> Accepted = null;
		List<Leave_user> Rejected = null;
		List<Leave_user> Approval = null;
		//根据权限级别绑定展示数据
		if(levels > 0) {
			Accepted = leaveService.Accepted(emp.getEmpName(), levels);
			Rejected = leaveService.Rejected(emp.getEmpName(), levels);
			Approval = leaveService.Approval(emp.getEmpName(), levels,emp.getDeptName());
			jsonObject.put("Accepted", Accepted);//已批准
			jsonObject.put("Rejected", Rejected);//已驳回
			jsonObject.put("Approval", Approval);//审批中
		}
		List<Leave_user> applying = leaveService.applying(emp.getEmpName());
		List<Leave_user> unsuccess = leaveService.Unsuccessful(emp.getEmpName());
		List<Leave_user> success = leaveService.successful(emp.getEmpName());
		jsonObject.put("applying", applying);//申请中
		jsonObject.put("unsuccess", unsuccess);//申请失败
		jsonObject.put("success", success);//申请成功
		return Result.successfy(jsonObject);
	}
	
	//提交申请
	@RequestMapping("apply")
	public Result Insert(Leave_user leave) { 
		Date startTime = leave.getStartTime();
		Date endTime = leave.getEndTime();
		leaveService.insert(leave);
		return Result.successfy(ErrorCode.SUCCESS);
	}
	
	//二次遍历
	@RequestMapping("findByTime")
	public Result findByTime(String applyTime,String empName) {
		Leave_user user = leaveService.findByTime(empName, applyTime);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("user", user);
		return Result.successfy(jsonObject);
	}
	
	//审批
	@RequestMapping("accepted")
	public String accepted(Leave_user user,HttpSession session,String state) {
		leaveService.update_Accepted(state, user);
		return "leave";
	}
	
	//注销
	@RequestMapping("/outLogin")
	public String out(HttpSession session) {
		session.invalidate();
		return "login";
	}
	
	


}
