<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
      String path = request.getContextPath();
      String basePath = request.getScheme() + "://"
                  + request.getServerName() + ":" + request.getServerPort()
                  + path + "/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Insert title here</title>
		<style type="text/css">
/* 			body{height:100%;padding:0;margin:0;background-color: #eeeeee;} */
/* 			.content{width:100%;height:auto;position: absolute;} */
/* 			form{display:none} */
/* 			#block_form1,#block_form2{display: block} */
/* 			/*左 */ */
/* 			.menu_left{width:20%;height:100%;background-color: #e2e2e2;float:left;position:fixed;} */
/* 			#come{width:90%;height:150px;background-color: #d0c9a9;line-height:150px;text-align: center; */
/* 				  color:#fff;font-size:30px;margin-left:17px;margin-top:10px;margin-bottom: 10px;} */
/* 			.form{height:100%} */
/* 			/*右 */ */
/* 			.menu_right{width:80%;float:right;} */
/* 			.right_title{width:80%;height:100px;line-height: 100px;text-align: center;font-size:40px;color:#000} */
/* 			.right_content{width:80%;height:100%;} */
/* 			.right_content #toptime{margin-top:15px;float: right;margin-right:143px} */
/* 			.table{width:920px;height:100%;} */
/* 			.table table{width:920px;height:100%;margin:10px 156px;} */
/* 			.table table tr{height:45px;width:920px;border:1px solid #89676780} */
/* 			.table table td{border:1px solid #89676780;border-collapse: collapse;width:400px;height:45px;line-height: 45px} */
/* 			.table table .four .lab{width:150px;text-align:center} */
/* 			.table table #desc{padding-left: 80px} */
/* 			.table table #apply{float:right;margin-right:30px} */
/* 			.table table #apply .layui-btn{background-coloR:#c0b47d} */
/* 			.table table tr #lab1{margin-top: 8px} */
/* 			.table table label{width:100px} */
/* 			.table table #reason{width:132px} */
/* 			.table table .layui-form-item{margin-bottom: 0px} */
/* 			.table table .sign{border-bottom: 1px solid #89676780;} */
/* 			#desc{text-align:left} */
/* 			#day,#hours{margin-left:4px;margin-right:4px;color:#9e1386} */
/* 			.lab_right{margin-right:40px;width:145px !important;} */
/* 			.sign_div{float:right;margin-right:30px} */
/*  			.table table .apply_btn{background-coloR:#c0b47d}  */
/* 			.lab_right span{margin-left:5px} */
/* 			.table table #apply1,#apply2,#apply3{display:none} */
/* 			/*进度条样式*/ */
/* 			.right_content .bar{width:920px;height:200px;margin:100px auto;} */
/* 		    .bar .layui-progress{width:255px} */
/* 		    .bar{width:750px;height:100px} */
/* 		    .bar .layui-progress,.bar i{float:left} */
/* 		    .bar i{margin:-14px 10px 0 10px;} */
/* 		    .tablebar{margin:50px auto} */
/* 		    .table .status{float:left;line-height: 30px;display: block} */
		</style>
		<link rel="icon" href="data:image/ico;base64,aWNv">
		<link rel="stylesheet" href="<%=basePath %>layui/css/layui.css" media="all">
		<link rel="stylesheet" href="<%=basePath %>css/leave.css" media="all">
		
	</head>
	<body class="body">
	
		<div class="content">
		<!-- 导航栏开始 -->
			<div class="menu_left">
				<div id="come">WELCOME BACK</div>
				<div class="form">
					<form class="layui-form" action="" id="block_form1" method="post">
					   <input type="hidden" value="${emp.levels}" name="levels" id="emp_level">
					   <div class="layui-form-item">
		   				  <label class="layui-form-label">ID:</label>
						  <div class="layui-input-inline">
						      <input type="text" name="empNo"class="layui-input" value="${sessionScope.emp.empNo}">
						  </div>
		               </div>
					   <div class="layui-form-item">
					     <label class="layui-form-label">NAME:</label>
					     <div class="layui-input-inline">
					       <input type="text" name="empName" class="layui-input" value="${sessionScope.emp.empName}">
					     </div>
					   </div>
					   <div class="layui-form-item">
					     <label class="layui-form-label">SEX:</label>
					     <div class="layui-input-inline">
					       <input type="text" name="sex" class="layui-input" value="${sessionScope.emp.sex}">
					     </div>
					   </div>
					   <div class="layui-form-item">
					     <label class="layui-form-label">DEPARTMENT:</label>
					     <div class="layui-input-inline">
					       <input type="text" name="deptName" class="layui-input" value="${sessionScope.emp.deptName}">
					     </div>
					   </div>
					   <div class="layui-form-item">
					     <label class="layui-form-label">JOB:</label>
					     <div class="layui-input-inline">
					       <input type="text" name="jobName" class="layui-input" value="${sessionScope.emp.jobName}">
					     </div>
					   </div>
					</form>
				</div>
				<div class="out"><input type="button" value="Sign out" id="reset" onClick="out()"></div>
				<div class="add"><input type="button" value="Add leave slip" id="add" onClick="clear(block_form2)"></div>
			</div>
		<!-- 结束导航栏 -->
		<!-- 中间 -->
			<div class="menu_centent">
				<div class="right_title"><span>Leave slip</span></div>
			<!-- 正文 -->
				<div class="right_content">
					<form action="" class="layui-form" id="block_form2" method="post">
					<div class="layui-form-item" id="toptime">
						<label class="layui-form-label">Apply Time:</label>
						<div class="layui-inline"> 
						  <input type="text" class="layui-input" id="applyTime" name="applyTime" >
<%-- 						  <input type="text" class="layui-input" id="applyTimed" value="${sessionScope.emp.applyTime}"> --%>
						</div>
					</div>
					<div class="table">
						<table>
							<tr class="four">
								<td class="lab">NAME：</td>
								<td><input type="text" name="empName" id="empName" readonly="readonly" class="layui-input" value="${sessionScope.emp.empName}"></td>
								<td class="lab">DEPT：</td>
								<td><input type="text" name="deptName" id="deptName" readonly="readonly" class="layui-input" value="${sessionScope.emp.deptName}"></td>
								<td class="lab">JOB：</td>
								<td><input type="text" name="jobName" id="jobName" readonly="readonly" class="layui-input" value="${sessionScope.emp.jobName}"></td>
							</tr>
							<tr>
								<td colspan="6" id="type">
									<div class="layui-form-item">
										<label class="layui-form-label" id="lab1">Leave Type：</label>
										<div class="layui-input-block">
									      <input type="radio" name="type" value="事假" title="事假" checked>
									      <input type="radio" name="type" value="病假" title="病假">
									      <input type="radio" name="type" value="婚假" title="婚假">
									      <input type="radio" name="type" value="丧假" title="丧假">
									      <input type="radio" name="type" value="公假" title="公假">
									      <input type="radio" name="type" value="工伤" title="工伤">
									      <input type="radio" name="type" value="产假" title="产假">
									      <input type="radio" name="type" value="护理假" title="护理假">
									      <input type="radio" name="type" value="其他" title="其他">
									    </div>
									</div>
								</td>
							</tr>
							<tr >
								<td colspan="6">
								<div class="layui-form-item">
									<label class="layui-form-label" id="reason">Excuse for leave：</label>	
									<textarea name="reson" class="layui-textarea" id="desc">
									</textarea>
									</div>
								</td>
							</tr>	
							<tr>
								<td colspan="6" >
									<div class="layui-form-item">
										<label class="layui-form-label">Leave Time：</label>
										<div class="layui-inline"> 
										  <input type="text" class="layui-input" id="start" name="startTime">
										</div>
										<label>TO:</label>
										<div class="layui-inline"> 
										  <input type="text" class="layui-input" id="end" name="endTime">
										</div>
										<label id= "totalTime"></label>
										<div class="layui-input-block" id="apply">
											<input type="reset" class="layui-btn"onclick="clear(block_form2)" value="CLEAR">
									        <button class="layui-btn" onclick="apply()">APPLY</button>
									    </div>
									</div>
								</td>
							</tr>
						</table>
					</div>
					</form>
					<!-- 审批开始 -->
					<form action="" class="layui-form" id="apply1" method="post">
						<div class="table">
							<table>	
								<tr>
									<td>
									<div class="layui-form-item">
									    <label class="layui-form-label">经理审批：</label>
									    <div class="layui-input-inline">
									 		<select id="edit_exam_school">
								      	   		<option value="">请选择</option>
								      			<option value="1">同意</option>
								      			<option value="2">驳回</option>
								            </select>
									    </div>
								     </div>
									</td>
								</tr>
								<tr>
									<td>
									<div class="layui-form-item">
										<label class="layui-form-label">经理意见：</label>	
										<textarea name="desc" class="layui-textarea" id="desc">祝早日康复！
										</textarea>
										<div class="sign_div">
											<label class="lab_right">经理签字：<span class="sign">某某某</span></label>	
											<button class="layui-btn apply_btn" lay-submit lay-filter="formDemo" >提交</button>
										</div>
									</div>
									</td>
								</tr>
							</table>
						</div>
					</form>
					<form action="" class="layui-form" id="apply2" method="post">
						<div class="table">
							<table>
								<tr>
									<td>
									<div class="layui-form-item">
									    <label class="layui-form-label">部门经理审批：</label>
									    <div class="layui-input-inline">
									 		<select id="edit_exam_school">
								      	   		<option value="">请选择</option>
								      			<option value="1">同意</option>
								      			<option value="2">驳回</option>
								            </select>
									    </div>
								     </div>
									</td>
								</tr>
								<tr>
									<td>
									<div class="layui-form-item">
										<label class="layui-form-label">部门经理意见：</label>	
										<textarea name="desc" class="layui-textarea" id="desc">祝早日康复！
										</textarea>
										<div class="sign_div">
											<label class="lab_right" id="dept_btn">部门经理签字：<span class="sign">某某某</span></label>	
											<button class="layui-btn apply_btn" lay-submit lay-filter="formDemo" >提交</button>
										</div>
									</div>
									</td>
								</tr>
							</table>						
						</div>
					</form>
					<form action="" class="layui-form" id="apply3" method="post">
						<div class="table">
							<table>
								<tr>
									<td>
									<div class="layui-form-item">
									    <label class="layui-form-label">总经理审批：</label>
									    <div class="layui-input-inline">
									 		<select id="edit_exam_school">
								      	   		<option value="">请选择</option>
								      			<option value="1">同意</option>
								      			<option value="2">驳回</option>
								            </select>
									    </div>
								     </div>
									</td>
								</tr>
								<tr>
									<td>
									<div class="layui-form-item">
										<label class="layui-form-label">总经理意见：</label>	
										<textarea name="desc" class="layui-textarea" id="desc">祝早日康复！
										</textarea>
										<div class="sign_div">
											<label class="lab_right">总经理签字：<span class="sign">某某某</span></label>	
											<button class="layui-btn apply_btn" lay-submit lay-filter="formDemo" >提交</button>
										</div>
									</div>
									</td>
								</tr>
							</table>
						</div>
					</form>
					<!-- 审批结束 -->
					
					<!-- 进度条 -->
					<div class="table tablebar">
						<div class="bar_div">
							<span class="status">Application Status:</span>
							<div class="bar">
							    <div class="layui-progress" lay-showPercent="true">
								  <div class="layui-progress-bar" lay-percent="10%"></div>
								</div>
								<i class="layui-icon layui-icon-face-smile" style="font-size: 30px; color: #1E9FFF;"></i>
								<div class="layui-progress" lay-showPercent="true">
								  <div class="layui-progress-bar" lay-percent="50%"></div>
								</div>
								<i class="layui-icon layui-icon-face-cry" style="font-size: 30px; color: #1E9FFF;"></i>
								<div class="layui-progress" lay-showPercent="true">
								  <div class="layui-progress-bar" lay-percent="10%"></div>
								</div>
								<i class="layui-icon layui-icon-face-cry" style="font-size: 30px; color: #1E9FFF;"></i>
							</div>
						</div>
					</div>
					<!-- 进度条 -->
				</div>
				<!-- 正文结束 -->
		    </div>
		    <!-- 中间结束 -->
		    <!-- 右边 -->
		    <div class="menu_right">
		  		<div class="application">My Application</div>
		    	<ul class="layui-nav layui-nav-tree" lay-filter="test">
		    	<!-- 权限 ： 0 -->
					  <li class="layui-nav-item layui-nav-itemed">
					    <a href="javascript:;">申请中</a>
					    <dl class="layui-nav-child"  id="applying">

					    </dl>
					  </li>
					  <li class="layui-nav-item">
					    <a href="javascript:;">申请成功</a>
					    <dl class="layui-nav-child" id="success">
					    
					    </dl>
					  </li>
				    <li class="layui-nav-item">
				    <a href="javascript:;">申请失败</a>
				    <dl class="layui-nav-child" id="unsuccess">

				    </dl>
				  </li>
				  <!-- 权限>0 -->
				  <li class="layui-nav-item morelevel">
				    <a href="javascript:;">审批中</a>
				    <dl class="layui-nav-child" id="Approval">
				      
				    </dl>
				  </li> 
				  <li class="layui-nav-item morelevel">
				    <a href="javascript:;">已批准</a>
				    <dl class="layui-nav-child" id="Accepted">
				      
				    </dl>
				  </li> 
				  <li class="layui-nav-item morelevel">
				    <a href="javascript:;">已驳回</a>
				    <dl class="layui-nav-child" id="Rejected">
				     	
				    </dl>
				  </li> 
				</ul>
		    </div>
		    <!-- 右边结束 -->
		    
		</div>
		<script type="text/javascript" src = "<%=basePath %>js/jquery-3.3.1.js"></script>
		<script src="<%=basePath %>layui/layui.js"></script>
		<script src="<%=basePath %>js/leave.js"></script>
		<script>
			var jsonObject={};
// 			jsonObject[Accepted]=
			//限制文本域字数
// 			onpropertychange="if(this.value.length>10){this.value=this.value.slice(0,10)}"
		</script>
	</body>
</html>