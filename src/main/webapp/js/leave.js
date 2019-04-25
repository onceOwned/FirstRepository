			var open = true;
			
			//只读
			function read(){
				if(open){
					$('#block_form2').find('input,textarea').attr('readonly',true); 
				}
			}
			
			//二次遍历
			function show(empName,applyTime){
				$.ajax({
					url:"findByTime",
					dataType:"json",
					type:"post",
					data:"empName="+empName+"&applyTime="+applyTime,
					success:function(msg){
						console.log(msg.data);
						$("#applyTime").val(msg.data.applyTime);
						$("#deptName").val(msg.data.deptName);
						$("#jobName").val(msg.data.jobName);
						$("input[value='msg.data.type']").checked=true;
						$("#desc").val(msg.data.reson);	
						$("#start").val(msg.data.startTime);	
						$("#end").val(msg.data.endTime);	
						$("#totalTime").val(msg.data.reson);	
						}
					})
				
				
			}
			window.onload = function(){
				$('#block_form1').find('input').attr('readonly',true); 
//				$("#toptime").hide();//申请时间
//				$("#applyTime").hide();//当前系统时间
//				$("#applyTimed").hide();//遍历的申请时间
				$(".morelevel").hide();//权限大于0的导航栏
				//右边导航栏显示
				var levels = $("#emp_level").val();
				$.ajax({
					url:"leave_main",
					dataType:"json",
					type:"post",
					success:function(msg){
						var applying = msg.data.applying;
						var unsuccess = msg.data.unsuccess;
						var success = msg.data.success;
						var Accepted = msg.data.Accepted;
						var Rejected = msg.data.Rejected;
						var Approval = msg.data.Approval;
						var dl_applying = $("#applying");
						var dl_unsuccess = $("#unsuccess");
						var dl_success = $("#success");
						var dl_Accepted = $("#Accepted");
						var dl_Rejected = $("#Rejected");
						var dl_Approval = $("#Approval");
						content(applying,dl_applying);
						content(unsuccess,dl_unsuccess);
						content(success,dl_success);
						if(levels==0){
							$(".morelevel").hide();
						}else if(levels>0){
							$(".morelevel").show();
							content(Accepted,dl_Accepted);
							content(Rejected,dl_Rejected);
							content(Approval,dl_Approval);
						}
						
					}
				});
			}
			function content(obj,element){
				var dd = "";
				for(var i = 0 ; i < obj.length; i++){
					 dd += "<dd><span onclick='show(obj[i].empName,obj[i].applyTime)'>"+obj[i].empName+":"+obj[i].applyTime+"</span></dd>"
				}
				element.append(dd);
			}
			
			//申请时间  动态获取当前系统时间
			function getNowTime(){
				var today = new Date();
				 //分别取出年、月、日、时、分、秒
				 var year = today.getFullYear();
				 var month = today.getMonth()+1;
				 var day = today.getDate();
				 var hours = today.getHours();
				 var minutes = today.getMinutes();
				 var seconds = today.getSeconds();
				 //如果是单个数，则前面补0
				 month  = month<10  ? "0"+month : month;
				 day  = day <10  ? "0"+day : day;
				 hours  = hours<10  ? "0"+hours : hours;
				 minutes = minutes<10 ? "0"+minutes : minutes;
				 seconds = seconds<10 ? "0"+seconds : seconds;
				 //构建要输出的字符串
				 var str = year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds;
				 $("#applyTime").val(str);
				 //延时器
				 if(open){
					 window.setTimeout("getNowTime()",1000);
				 }
			}
			
			//清空表单
			function clear(formId){
				$('#formId')[0].reset();
			}
			//提交申请
			function apply(){
				getNowTime();
				console.log(typeof $("#applyTime").val());
				$.ajax({
					url:"apply",
					dataType:"json",
					type:"POST",
					data:$('#block_form2').serialize(),
					contentType:application/x-www-form-urlencoded,
					success:function(msg){
						//提交完使表单不可编辑
						read(); 
						open = false;//关掉计时器
						clear(block_form2);
//						$('#block_form2').find('input,textarea').val(" ");//清空表单
					},
					error:function(){
						console.log("数据异常");
					}
					})
					
			}
			
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
			layui.use('form', function(){
				  var form = layui.form;
//				  form.render();
//				  //监听提交
//				  form.on('submit(formDemo)', function(data){
//				    layer.msg(JSON.stringify(data.field));
//				    return false;
//				  });
				});
			//注意进度条依赖 element 模块，否则无法进行正常渲染和功能性操作
			//通过 ：#4cd6f7    驳回：#bbaf7a
			layui.use('element', function(){
			var element = layui.element;
			});
			//退出 
  			function out(){
  				window.location.href="outLogin";
  			}