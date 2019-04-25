<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
      String path = request.getContextPath();
      String basePath = request.getScheme() + "://"
                  + request.getServerName() + ":" + request.getServerPort()
                  + path + "/";
%>
<html>
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="<%=basePath %>layui/css/layui.css" media="all">
  <style type="text/css">
   .layui-progress{width:200px}
   .bar{width:750px;height:30px}
   .bar .layui-progress,i{float:left}
   i{margin:-14px 10px 0 10px;}
  </style>
</head>
<body>
 
<div class="layui-inline"> 
  <input type="text" class="layui-input" id="test1">
</div>

    <div class="layui-inline">
      <label class="layui-form-label">日期时间选择器</label>
      <div class="layui-input-inline">
        <input type="text" class="layui-input" id="test5" placeholder="yyyy-MM-dd HH:mm:ss">
      </div>
    </div>
    
    <div class="sign">
	    <div class="layui-progress">
		  <div class="layui-progress-bar" lay-percent="10%"></div>
		</div>
		<i class="layui-icon layui-icon-face-smile" style="font-size: 30px; color: #1E9FFF;"></i>
		<div class="layui-progress">
		  <div class="layui-progress-bar" lay-percent="10%"></div>
		</div>
		<i class="layui-icon layui-icon-face-cry" style="font-size: 30px; color: #1E9FFF;"></i>
		<div class="layui-progress">
		  <div class="layui-progress-bar" lay-percent="10%"></div>
		</div>
	</div>
	
	<ul class="layui-nav layui-nav-tree" lay-filter="test">
		<li class="layui-nav-item layui-nav-itemed"><span class="ul_menu">My Application</span></li>
		<!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> rgba(76, 71, 71, 0.3)!important-->
		  <li class="layui-nav-item layui-nav-itemed">
		    <a href="javascript:;">申请中</a>
		    <dl class="layui-nav-child">
		      <dd><a href="javascript:;">2019-01-03</a></dd>
		      <dd><a href="javascript:;">2019-01-02</a></dd>
		      <dd><a href="">2019-01-01</a></dd>
		    </dl>
		  </li>
		  <li class="layui-nav-item">
		    <a href="javascript:;">已通过</a>
		    <dl class="layui-nav-child">
		      <dd><a href="">2018-01-03</a></dd>
		      <dd><a href="">2018-01-03</a></dd>
		      <dd><a href="">2018-01-03</a></dd>
		    </dl>
		  </li>
	    <li class="layui-nav-item">
	    <a href="javascript:;">未通过</a>
	    <dl class="layui-nav-child">
	      <dd><a href="">2017-01-03</a></dd>
	      <dd><a href="">2017-01-03</a></dd>
	      <dd><a href="">2017-01-03</a></dd>
	    </dl>
	  </li>
	</ul>
	
<script src="<%=basePath %>layui/layui.js"></script>

<script>
	layui.use('laydate', function(){
	  var laydate = layui.laydate;
	  laydate.render({
	    elem: '#test1' 
	  });
	  
	//日期时间选择器
	  laydate.render({
	    elem: '#test5'
	    ,type: 'datetime'
	  });
	});
	
	//注意进度条依赖 element 模块，否则无法进行正常渲染和功能性操作
	layui.use('element', function(){
	var element = layui.element;
	});
</script>
</body>
</html>