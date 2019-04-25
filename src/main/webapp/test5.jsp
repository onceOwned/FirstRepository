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
   
    <form id="form1" >
    <input type="button" value="获取" onclick="getJson()">
   <input type="button" value="保存数据" onclick="SavePara()" />
    <div>
        <ul id="list"></ul>
        		    	<ul class="layui-nav layui-nav-tree" lay-filter="test">
		    	<!-- 权限 ： 0 -->
					  <li class="layui-nav-item layui-nav-itemed">
					    <a href="javascript:;">申请中</a>
					    <dl class="layui-nav-child">
					      <dd><a href="javascript:;">2019-01-03</a></dd>
					      <dd><a href="javascript:;">2019-01-02</a></dd>
					      <dd><a href="javascript:;">2019-01-01</a></dd>
					    </dl>
					  </li>
					  <li class="layui-nav-item">
					    <a href="javascript:;">申请成功</a>
					    <dl class="layui-nav-child">
					      <dd><a href="">2018-01-03</a></dd>
					      <dd><a href="">2018-01-03</a></dd>
					      <dd><a href="">2018-01-03</a></dd>
					    </dl>
					  </li>
				    <li class="layui-nav-item">
				    <a href="javascript:;">申请失败</a>
				    <dl class="layui-nav-child">
				      <dd><a href="">2017-01-03</a></dd>
				      <dd><a href="">2017-01-03</a></dd>
				      <dd><a href="">2017-01-03</a></dd>
				    </dl>
				  </li>
				  <!-- 权限>0 -->
				  <li class="layui-nav-item" class="morelevel">
				    <a href="javascript:;">审批中</a>
				    <dl class="layui-nav-child">
				      <dd><a href="">2017-01-03</a></dd>
				      <dd><a href="">2017-01-03</a></dd>
				      <dd><a href="">2017-01-03</a></dd>
				    </dl>
				  </li> 
				  <li class="layui-nav-item" class="morelevel">
				    <a href="javascript:;">已批准</a>
				    <dl class="layui-nav-child">
				      <dd><a href="">2017-01-03</a></dd>
				      <dd><a href="">2017-01-03</a></dd>
				      <dd><a href="">2017-01-03</a></dd>
				    </dl>
				  </li> 
				  <li class="layui-nav-item" class="morelevel">
				    <a href="javascript:;">已驳回</a>
				    <dl class="layui-nav-child">
				      <dd><a href="">2017-01-03</a></dd>
				      <dd><a href="">2017-01-03</a></dd>
				      <dd><a href="">2017-01-03</a></dd>
				    </dl>
				  </li> 
				</ul>
    </div>
    </form>
    <input type="button" value="totalTime" onclick="getTime()">
    <label id= "totalTime"><span id="day">3</span>day<span id="hours">5</span>hours</label>
   <script type="text/javascript" src = "<%=basePath %>js/jquery-3.3.1.js"></script>
   <script src="<%=basePath %>layui/layui.js"></script>
   <script type="text/javascript">
       function getTime(){
    	   var time = $("#totalTime").text();
    	   alert(time);
       }
       function getJson() {
           $.ajax({
               url: 'login?empName=严派&pwd=111',
               type: 'post',
               contentType:"application/json;charset=utf-8",
               timeout: 3000,
               cache: false,
               beforeSend: LoadFunction, //加载执行方法    
               error: erryFunction,  //错误执行方法    
               success: function(data){
            	   console.log(data);
            	   window.location
               } //成功执行方法    
           })
           function LoadFunction() {
               $("#list").html('加载中...');
           }
           function erryFunction() {
               alert("error");
           }
           function succFunction(data) {
           	console.log(data);
//                $("#list").html('');
//                var json = eval(tt); //数组
//                $.each(json, function (index, item) {
//                    //循环获取数据    
//                    var Id = json[index].id;
//                    var Name = json[index].name;
//                    $("#list").html($("#list").html() + "<br>" + Name + "<input type='text' id='" + Id + "' /><br/>");
//                });
           }
       }

   </script>  
</body>
</html>