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
		<title>login</title>
		<!--正确路径： http://localhost:8080/Leave_Project/layui/css/layui.css -->
		<%-- 第一种：文件位置： Leave_Project\src\main\resources\layui --%>
		<link rel="stylesheet" href="<%=basePath %>layui/css/layui.css"> 
		
        <!-- 第二种：文件位置：Leave_Project\src\main\webapp\layui  -->
		<%-- <link href="<c:url value="layui/css/layui.css"/>" rel="stylesheet"> --%>
		<style type="text/css">
			*{margin:0px;padding:0px}
			.content{width:100%;height:100%;background-color: #eeeeee;position: absolute;}
			.title{width:250px ; height:100px;border:1px solid #000;position: absolute;top:35px;left:856px;text-align: center;}
			.form{width: 400px;border: 5px solid #dddddd;margin: 200px auto;padding-top:15px}
        	.login #lofin_title{width: 540px;height: 0;border-right: 250px solid #dddddd;
			border-top: 200px solid transparent;border-bottom: 200px solid transparent;position:absolute;top:100px}
			#lofin_title span{font-size:20px;position: absolute;left:600px;top:-10px;width:inherit;}
			#title{line-height: 100px;font-family: "Arial","Microsoft YaHei","黑体","宋体",sans-serif;font-size:27px;}
		</style>
		<script src="<%=basePath %>layui/layui.js"></script>
		<script type="text/javascript" src = "<%=basePath %>js/jquery-3.3.1.js"></script>
		<script type="text/javascript" src = "<%=basePath %>js/login.js"></script>
<!-- <script src="layui/layui.js"></script> -->

	</head>
<body>
	<div class="content">
		 <div class="title">
		 	<span id="title">LEAVE SYSTEM</span>
		 </div>
			<div class="login">
				<div id="lofin_title"><span>PLEASE LOGIN</span></div>
				<div class="form">
					<form class="layui-form" method="post">
					   <div class="layui-form-item">
		   				  <label class="layui-form-label">账号</label>
						  <div class="layui-input-inline">
						      <input type="text" name="empName" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
						  </div>
		               </div>
					  <div class="layui-form-item">
					    <label class="layui-form-label">密码</label>
					    <div class="layui-input-inline">
					      <input type="password" name="pwd" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
					    </div>
<!-- 					    <div class="layui-form-mid layui-word-aux">辅助文字</div> -->
					  </div>
					  <div class="layui-form-item">
						  <div class="layui-input-block">
						    <button class="layui-btn" lay-submit lay-filter="formDemo" onclick="login()">LOGIN</button>
						    <button type="reset" class="layui-btn layui-btn-primary">RESET</button>
						  </div>
					  </div>
					</form>
				</div>
			</div>
	</div>
</body>
</html>