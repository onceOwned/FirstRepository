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
		    	<!-- 权限 ： 0 -->
					  <li class="layui-nav-item layui-nav-itemed">
					    <a href="javascript:;">申请中</a>
					    <dl class="layui-nav-child">
					      <dd><a href="javascript:;">2019-01-03</a></dd>
					      <dd><a href="javascript:;">2019-01-02</a></dd>
					      <dd><a href="">2019-01-01</a></dd>
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
	
<script src="<%=basePath %>layui/layui.js"></script>

<script>
jQuery(function($) {
/**********
获取未处理报警信息总数
**************/
var result;
$.ajax({
async:false,
cache:false,
url: "login?empName=严派&pwd=111",//访问后台接口取数据
// dataType : "json",
type: 'POST',
success: function(data){
result = eval('('+ data +')');
}
});
var alarmCount;
alarmCount = result.total;
 
/**********
 
静态代码形式
 
**********/
/* 
<li>
<a href="#" rel="external nofollow" class="dropdown-toggle">
<i class="icon-desktop"></i>
<span class="menu-text"> 设备管理 </span>
<b class="arrow icon-angle-down"></b>
</a>
 
 
<ul class="submenu">
<li>
<a href="smartTerminal.html" rel="external nofollow" >
<i class="icon-double-angle-right"></i>
智能终端管理
</a>
</li>
<li>
<a href="labelPrinter.html" rel="external nofollow" >
<i class="icon-double-angle-right"></i>
标签打印机管理
</a>
</li>
</ul>
</li>
*/
 
/*****从后台取出导航栏数据******/
$.ajax({
async:true,
cache:false,
url: "user_getMenuBuf.do",
// dataType : "json",
type: 'POST',
success: function(result){

var result = eval('('+ result +')');
if(result != undefined && result.length > 0){
var firstMenu = [];
var firstHref = [];
var firstIcon = [];
var subMenu = [];
 
/******一级导航栏数据*******/
for (var i = 0; i < result.length; i++){
firstMenu[i] = result[i].name;
firstHref[i] = result[i].url;
firstIcon[i] = result[i].iconCls;
 
/*******添加li标签********/
var menuInfo = document.getElementById("menuInfo");
var firstLi = document.createElement("li");//创建新的 li元素
menuInfo.appendChild(firstLi);//将此li元素添加至页面的ul下一级中
firstLi.style.borderBottom = "0px solid #CCEBF8";//设置li下边框样式
 
/******设置选中li、离开li时li的样式********/
firstLi.onmouseover = function(){
this.style.background = "#23ACFA";
};
/* firstLi.onmouseover = function(){
this.style.background = "#23ACFA";
}; */
firstLi.onmouseout=function(){
this.style.background = "#0477C0";
};
 
/******添加a标签**********/
var firstALabel = document.createElement("a");
firstALabel.setAttribute("href", firstHref[i]);//js为新添加的a元素动态设置href属性
firstALabel.setAttribute("class", "dropdown-toggle");
//firstALabel.className = "dropdown-toggle";//兼容性好
firstALabel.setAttribute("target", "content");
//firstALabel.style.backgroundImage="url(./img/17.jpg)"
firstALabel.style.background = "#0477C0";//js为新添加的a元素动态设置背景颜色
// background:url(./img/17.jpg);
firstALabel.style.marginLeft = "20px";//js为新添加的a元素动态设置左外边距
firstLi.appendChild(firstALabel);
firstALabel.onmouseover = function(){
this.style.background = "#23ACFA";
};
/* firstALabel.onmouseover = function(){
this.style.background = "#23ACFA";
}; */
firstALabel.onmouseout=function(){
this.style.background = "#0477C0";
};
 
 
/*******添加i标签*******/
var firstILavel = document.createElement("i");
firstILavel.setAttribute("class", firstIcon[i]);
firstILavel.style.color = "#F4F8FF";//动态设置i元素的颜色
firstALabel.appendChild(firstILavel);
 
/*********添加span标签**********/
var firstSpan = document.createElement("span");
firstSpan.className = "menu-text";
firstSpan.innerHTML = firstMenu[i];//js为新添加的span元素动态设置显示内容
firstSpan.style.fontSize = "14.5px";//js为新添加的span元素动态设置显示内容的字体大小
firstSpan.style.color = "#66D2F1";//js为新添加的span元素动态设置显示内容的字体颜色
firstSpan.style.marginLeft = "15px";
firstALabel.appendChild(firstSpan);
 
if (firstMenu[i] == "报警信息管理"){
var alarmIcon = document.createElement("span");
alarmIcon.className = "badge badge-important";
alarmIcon.innerHTML = alarmCount; //alarmCount为全局变量，且是通过ajax从后台获取到的
firstSpan.appendChild(alarmIcon);
}
 
if (result[i].children.length > 0){
var secondHref = [];
var secondMenu = [];
var secondIcon = [];
 
/*******添加b标签********/
var firstBLabel = document.createElement("b");
firstBLabel.className = "arrow icon-angle-down";
firstBLabel.style.color = "white";
firstALabel.appendChild(firstBLabel);
 
/********添加ul标签************/
var secondUl = document.createElement("ul");
secondUl.setAttribute("class", "submenu");
firstLi.appendChild(secondUl);
 
for (var j = 0; j < result[i].children.length; j++){
secondHref[j] = result[i].children[j].url;
secondMenu[j] = result[i].children[j].name;
secondIcon[j] = result[i].children[j].iconCls;
 
/******添加li标签*******/
var secondLi = document.createElement("li");
secondLi.style.background = "#CCEBF8";
secondUl.appendChild(secondLi);
 
/*******添加a标签*******/
var secondALabel = document.createElement("a");
secondALabel.setAttribute("href", secondHref[j]);
secondALabel.setAttribute("target", "content");
//secondALabel.style.background = "#CCEBF8";
secondLi.appendChild(secondALabel);
 
/*******添加i标签**********/
var secondILabel = document.createElement("i");
secondILabel.setAttribute("class", "icon-double-angle-right");
secondALabel.appendChild(secondILabel);
 
/******添加二级导航信息********/
secondALabel.innerHTML = secondMenu[j];
secondALabel.style.fontSize = "15px";
//secondALabel.style.marginLeft = "60px";
}
}
}
   }
  }, 
 error: function() { 
 alert("加载菜单失败"); 
 } 
});
})
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