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
		<link rel="stylesheet" href="<%=basePath %>layui/css/layui.css" media="all">
	</head>
	<body>
<!-- 	<input type="text" id="load" value="9999"> -->
	<div class="layui-inline"> 
	  <input type="text" class="layui-input" id="start" name="startTime">
	</div>
	<label>TO:</label>
	<div class="layui-inline"> 
	  <input type="text" class="layui-input" id="end" name="endTime">
	</div>
	<input type="button" id="load" value="get">
	<script type="text/javascript" src = "<%=basePath %>js/jquery-3.3.1.js"></script>
		<script src="<%=basePath %>layui/layui.js"></script>
	<script type="text/javascript">
// 		window.onload = function(){
// 			var load = $("#load").val();
// 			console.log(load);
// 		    var op = [{"leaveId":2,"empName":"严派","jobName":"员工","deptName":"研发部","type":"事假","reson":"感冒","applyTime":"2019-04-10","startTime":"2019-04-12","endTime":"2019-04-17","totalTime":null,"viewOne":"","viewTwo":"","viewThree":"","manager":null,"dept_manager":null,"general":null,"applyStatus":"1","state":0},{"leaveId":1,"empName":"严派","jobName":"员工","deptName":"研发部","type":"病假","reson":"感冒","applyTime":"2019-02-02","startTime":"2019-04-04","endTime":"2019-04-06","totalTime":null,"viewOne":"","viewTwo":"","viewThree":"","manager":null,"dept_manager":null,"general":null,"applyStatus":"1","state":0}];
// 		    console.log(op);
// 		    console.log(op.length);
// 		    for(var i = 0 ; i< op.length ; i++){
// 		    	console.log(op[i]);
// 		    }
// 		}
//String 转  date 
function stringToDate(str){
    var tempStrs = str.split(" ");
    var dateStrs = tempStrs[0].split("-");
    var year = parseInt(dateStrs[0], 10);
    var month = parseInt(dateStrs[1], 10) - 1;
    var day = parseInt(dateStrs[2], 10);
    var timeStrs = tempStrs[1].split(":");
    var hour = parseInt(timeStrs [0], 10);
    var minute = parseInt(timeStrs[1], 10);
    var second = parseInt(timeStrs[2], 10);
    var date = new Date(year, month, day, hour, minute, second);
    return date;
}
function convertDateFromString(dateString) { 
	if (dateString) { 
	var arr1 = dateString.split(" "); 
	var sdate = arr1[0].split('-'); 
	var date = new Date(sdate[0], sdate[1]-1, sdate[2]); 
	return date;
	} 
	}

		$(function(){
			
			var one = $("#end").val();
			var end = convertDateFromString(one);
			var two = $("#start").val();
			var start = convertDateFromString(two);

			$("#one").click(function(){
				$("#load").val("red");
			})
			$("#load").click(function(){
				alert(typeof date);
				var totalTime = end.getTime()-start.getTime();  //时间差的毫秒数
				//计算出相差天数
				var days=Math.floor(totalTime/(24*3600*1000));
				//计算出小时数
				var leave1=totalTime%(24*3600*1000) ;   //计算天数后剩余的毫秒数
				var hours=Math.floor(leave1/(3600*1000));
				//计算相差分钟数
				var leave2=leave1%(3600*1000);        //计算小时数后剩余的毫秒数
				var minutes=Math.floor(leave2/(60*1000));
				//计算相差秒数
				var leave3=leave2%(60*1000) ;     //计算分钟数后剩余的毫秒数
				var seconds=Math.round(leave3/1000);
				alert(" 相差 "+days+"天 "+hours+"小时 "+minutes+" 分钟"+seconds+" 秒");
			})
		})
		layui.use('laydate', function(){
			  var laydate = layui.laydate;
//			  laydate.render({
//			    elem: '#applyTime' 
//			  });
			//日期时间选择器
			  laydate.render({
			    elem: '#start'
			    ,type: 'datetime'
			  });
			//日期时间选择器
			  laydate.render({
			    elem: '#end'
			    ,type: 'datetime'
			  });
			});
    

	</script>
	</body>
</html>

