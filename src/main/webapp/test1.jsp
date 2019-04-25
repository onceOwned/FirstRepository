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
</head>
<body>
 
<form class="layui-form" action="">
  <div class="layui-form-item">
    <label class="layui-form-label">输入框</label>
    <div class="layui-input-block">
      <input type="text" name="title" required placeholder="请输入标题" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">密码框</label>
    <div class="layui-input-inline">
      <input type="password" name="password" required  placeholder="请输入密码" autocomplete="off" class="layui-input">
    </div>
    <div class="layui-form-mid layui-word-aux">辅助文字</div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">选择框</label>
    <div class="layui-input-block">
      <select name="city" required>
        <option value=""></option>
        <option value="0">北京</option>
        <option value="1">上海</option>
        <option value="2">广州</option>
        <option value="3">深圳</option>
        <option value="4">杭州</option>
      </select>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">复选框</label>
    <div class="layui-input-block">
      <input type="checkbox" name="like[write]" title="写作">
      <input type="checkbox" name="like[read]" title="阅读" checked>
      <input type="checkbox" name="like[dai]" title="发呆">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">开关</label>
    <div class="layui-input-block">
      <input type="checkbox" name="switch" lay-skin="switch">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">单选框</label>
    <div class="layui-input-block">
<!--       <input type="radio" name="sex" value="男" title="男"> -->
<!--       <input type="radio" name="sex" value="女" title="女" checked> -->
      <input type="radio" name="type" value="事假" title="事假">
      <input type="radio" name="type" value="病假" title="病假" >
      <input type="radio" name="type" value="婚假" title="婚假">
      <input type="radio" name="type" value="丧假" title="丧假" >
      <input type="radio" name="type" value="公假" title="公假">
      <input type="radio" name="type" value="工伤" title="工伤" >
      <input type="radio" name="type" value="产假" title="产假">
      <input type="radio" name="type" value="护理假" title="护理假" >
      <input type="radio" name="type" value="其他" title="其他" >
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">文本域</label>
    <div class="layui-input-block">
      <textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
 
<script>
//Demo

</script>
 
<script src="<%=basePath %>layui/layui.js"></script>
<script>
layui.use('laydate', function(){
  var laydate = layui.laydate;
  laydate.render({
    elem: '#test1' 
  });
});

layui.use('form', function(){
	  var form = layui.form;
	  //监听提交
	  form.on('submit(formDemo)', function(data){
	    layer.msg(JSON.stringify(data.field));
	    return false;
	  });
	});
</script>
</body>
</html>