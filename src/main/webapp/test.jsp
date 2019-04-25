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
		<link rel="stylesheet" href="<%=basePath %>layui/css/layui.css">
		<style type="text/css">
			*{margin:0px;padding:0px}
			#testView{width:200px;height:40px;line-height:40px;border:1px solid #000;}
/* 			#test2{width:width:200px;height:200px;border:1px solid #000} */
		</style>
<%-- 		<script src="<%=basePath %>layui/layui.js"></script> --%>
<%-- 			<script src="<%=basePath %>layui/layui.all.js"></script> --%>
		<script src="laydate/laydate.js"></script>
	</head>
<body>
<span id="testView">日期范围</span>
<div id="test2"></div>
	 <script type="text/javascript">
		//嵌套在指定容器中
// 		layui.use('laydate', function(){
// 			var laydate = layui.laydate;
// 			//执行一个laydate实例
// 			laydate.render({
// 				elem: '#test2' //指定元素
// 			});
// 		});
		//执行一个laydate实例
		laydate.render({
		  elem: '#test2'
		  ,format: 'yyyy年MM月dd日'
		});
	</script>
</body>
</html>