function login(){
	$.ajax({
		url:"login",
		data:$(".layui-form").serialize(),
		type:"post",
		dataType:"JSON",
		contentType:application/x-www-form-urlencoded,
		success:function(){
			window.location.href="goleave";
		}
	});
	
}