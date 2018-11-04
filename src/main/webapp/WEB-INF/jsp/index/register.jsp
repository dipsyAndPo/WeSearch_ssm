<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录界面</title>
<link rel="shortcut icon" href="img/favicon.ico" type="image/ico">
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/common.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />

<script type="text/javascript" src="js/jQuery.js"></script>
</head>
<style>
	
</style>
<body style="background-image: url('img/admin_background.jpg' )">
<div class="login_form">
						<div class="login_title">
							注册
						</div>
						<form action="#" method="post">
							
							<div class="form_text_ipt">
								<input name="username" type="text" placeholder="手机号/邮箱">
							</div>
							<div class="ececk_warning"><span>手机号/邮箱不能为空</span></div>
							<div class="form_text_ipt">
								<input name="password" type="password" placeholder="密码">
							</div>
							<div class="ececk_warning"><span>密码不能为空</span></div>
							<div class="form_text_ipt">
								<input name="repassword" type="password" placeholder="重复密码">
							</div>
							<div class="ececk_warning"><span>密码不能为空</span></div>
							<div class="form_text_ipt">
								<input name="code" type="text" placeholder="验证码">
							</div>
							<div class="ececk_warning"><span>验证码不能为空</span></div>
							
							<div class="form_btn">
								<button type="button" onclick="javascript:window.location.href='#'">注册</button>
							</div>
							<div class="form_reg_btn">
								<span>已有帐号？</span><a href="index.html">马上登录</a>
							</div>
						</form>
						
					</div>
<script type="text/javascript">
$("#btn").click(function() {
	var username = $("#username").val();
	var password = $("#password").val();
	 if(username=="" & password ==""){
		 $("#statuss").html("用户名不能为空");
		 $("#status").html("密码不能为空");
			return false;
	 }else if(username==""){
				$("#statuss").html("用户名不能为空");
				$("#status").html("");
				return false;
				}else  if(password ==""){
					$("#statuss").html("");
			$("#status").html("密码不能为空");
				return false;
			} else {
			   return true;
		}
			
	
});

</script>
</body>
</html>