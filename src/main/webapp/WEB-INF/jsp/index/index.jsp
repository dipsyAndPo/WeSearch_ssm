<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="javax.servlet.http.Cookie" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>微搜</title>
		<link rel="shortcut icon" href="img/favicon.ico" type="image/ico">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="css/asidenav.css">
		<link rel="stylesheet" href="css/login.css" type="text/css" />
		<link href="css/style.css" rel="stylesheet" type="text/css" media="all">
		<script src="js/jQuery.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/asidenav.js"></script>
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<style type="text/css">
			* {

				padding: 0;
				margin: 0;
				box-sizing: border-box;
			}
			
			body {
				background-image: url(img/index_bg/4.jpg);
			}
			
			a {
				transition: all 0.5s;
				color: #000000;
			}
			
			.col-md-2 {
				transition: all 0.5s;
			}
			
			.col-md-2:hover {
				transform: scale(1.1, 1.1);
			}
			
			a:hover {
				text-decoration: none;
			}
			
			.logo img {
				display: block;
				width: 20%;
				height: 20%;
				margin: 80px auto;
			}
			
			.logo img:hover {
				opacity: 0.4;
			}
			
			.search {
				margin: 0 auto;
			}
			
			.content {
				margin-top: 80px;
				height: auto;
				background: #F7F7F7;
				border-radius: 5px;
			}
			
			.content ul {
				margin: 10px auto;
			}
			
			.Opacity {
				opacity: 0.8;
			}
			
			.aaa {
				opacity: 1;
			}
			
			.img {
				opacity: 0.8;
			}
			
			.nav-tabs>li {
				width: 90px;
			}
			
			@media (min-width: 1200px) {
				.container {
					width: 970px;
				}
			}
			body{
			padding-top:0px;
			}
			*{margin:0;padding:0;list-style-type:none;}
			a,img{border:0;}
			body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}
			/* container */
			#container{width:100%;height:100%;text-align:center;}
			#hr{
				width: 100%;
				size: 2px;
				color: white;
			}
			
			.clear{
				clear: both;
			}
			
		</style>

		<script type="text/javascript">
			$(function() {
				
			
				
				 $("#toggleLogin").toggle(function(){
						$("#login").parent("div").animate({ height : 105 } , 520 );
						$("#login").animate({marginTop : 0 } , 500 );
						$(this).blur();
				   },function(){
						$("#login").parent("div").animate({ height : 0 } , 500 );
						$("#login").animate({marginTop : -105 } , 520 ); 
						$(this).blur();
				   });
				   $("#closeLogin").click(function(){
						$("#login").parent("div").animate({ height : 0 } , 500 );
						$("#login").animate({marginTop : -105 } , 520 ); 
				   });
				
				   
				
				
				$("#Searchtext").focus(function() {
					$("#urlbody").fadeOut(300);
					$("img").addClass("img");
					$("#divAdd").hide();
					//					$("#logo").addClass("aaa");
					//					$("#logo").removeClass("Opacity");
				});
				$("#Searchtext").blur(function() {
					$("#urlbody").fadeIn(300);
					$("img").removeClass("img");
				});
				
				$("ul li:first").addClass("active");
				
				$(".tab-content div:first").addClass("active");
				
				$("#close").click(function() {
						$("#divAdd").hide();
				});
		
				   
				   
				   $("#submitBtn").click(function() {
					   if($("#categoryPic").val()==""){
						   alert("图片为空");
							return false;
							}else  if($("#name").val()==""){
						   alert("网址名称为空");
							return false;
							}else if($("#webLink").val()==""){
						   alert("网址为空");
							return false;
						}else {
						   return true;
					}
						
				});
				  $("#ii").click(function () {
						$("#logo img:visible").trigger('click');
				});
				   $("#logo img").click(function () {
					 var a=$(this).attr("id");
					if(a=="bd"){
						$("#bd").hide();
						$("#bing").fadeIn();
						$("#sou_flag").val("bing");
					}else if (a=="bing") {
						$("#bing").hide();
						$("#bd").fadeIn();
						$("#sou_flag").val("bd");
					}
				});
				   
				   
				   

			});
			function btnAdd(uid){
				 $("#divAdd").fadeIn(1000);
				 $("#add_uId").attr('value',uid);
			 };
			
			// cooking保存用户  
			//设置cookie
			function setCookie(name,value,iDay){	//三个参数分别为：cookie名称、值、多少天后过期
				var oDate=new Date();
		 
				//这里的设置时间并不是修改系统时间，而是oDate这个日期对象内部的时间。使用这个方法可以算出该日期的几天后的日期时间
				oDate.setDate(oDate.getDate()+iDay);
				document.cookie=name+'='+value+';expires='+oDate;
			};
			
		 
			//读取cookie
			function getCookie(name){
				var arr=document.cookie.split('; ');
				for(var i=0;i<arr.length;i++){
					var arr2=arr[i].split('=');
		 
					//拆分后，arr2[0]就代表cookie的name名称，arr[1]就代表cookie的value值
					if(arr2[0]==name){
						return arr2[1];
					}
				}
				return '';		//当用户是第一次进入网站，根本就还没有cookie的时候，返回一个空的字符串
				
			}
			
			
			window.onload=function(){
				var oForm=document.getElementById('form1');
				var oUser=document.getElementsByName('userAccount')[0];
				var oPwd=document.getElementsByName('userPwd')[0];
				
				//打开网页先读取cookie
				oUser.value=getCookie('userAccount');
				oPwd.value=getCookie('userPwd');
				
				//如果cookie里有值 ，则直接登录
				if(oUser.value=getCookie('userAccount')){
					$("#hello").html("您好"+getCookie('userAccount'));
					$("#toggleLogin").html("注销");
					$("#toggleLogin").attr("onclick","clearAllCookie()");
					$("#toggleLogin").attr("class","exit");
					var a=5${userId};
					if(a==5 || a==4){
					loginAjax($("#log").val(),$("#pwd").val());
					}
				}else{
					$(".btu_jia").addClass("disabled");
					$("#divAdd").remove();
					$(".btu_jia").attr("title","请登录再添加");
					$("#toggleLogin").removeClass();
				}
				
				
				
				
				
				
				$(".exit").click(function() {
					
					clearAllCookie();
					//window.location.reload();
					window.location.href = "index.jsp";
				});
				  

				
				
				
				$("#userLogin").click(function() {
					loginAjax($("#log").val(),$("#pwd").val());
				});
				
				
			};
			
			
			
			//清除所有cookie函数
			function clearAllCookie() {
				var keys = document.cookie.match(/[^ =;]+(?=\=)/g);
				if(keys) {
					for(var i = keys.length; i--;)
						document.cookie = keys[i] + '=0;expires=' + new Date(0).toUTCString()
				}
			}
			
			

			function loginAjax(log,pwd) {
				$.ajax({
					 url:"loginAjax",
		             type:"post",
		             data:{"userAccount":log,"userPwd":pwd},
		             dataType : "text", 
		             success:function(result){
						if(result!='error'){
							var oUser=document.getElementsByName('userAccount')[0];
							var oPwd=document.getElementsByName('userPwd')[0];
							//存cookie
							setCookie('userAccount',oUser.value,1);	//设置1天后过期
							setCookie('userPwd',oPwd.value,1);
							window.location.href = "findByUserId?userId="+result;
						}else{
							alert('---哎呀 ~ 真抱歉呢！账号或密码错误----');
						}
					}
			});
			}

			  
		</script>
		
		
		
	</head>

	<body>
		
	<!-- 登录 -->
	<div style="margin:0px;overflow:hidden;position:relative;height:0px;">
		<div id="login" style="margin:-105px 0px 0px;height:auto;">
			<div class="loginContent">
				<!-- <form action="login?flag=uLogin" method="post" id="form1"> -->
					<input  type="text" name="userId" id="userId" style="display: none" value="${userId}" size="23" />
					<label for="log"><b>用户名: </b></label>
					<input class="field" type="text" name="userAccount" id="log" value="" size="23" />
					<label for="pwd"><b>密码:</b></label>
					<input class="field" type="password" name="userPwd" id="pwd" size="23" />
					<input type="submit" name="submit" value="" class="button_login" id="userLogin" />
					<input type="hidden" name="redirect_to" value=""/>
				<!--</form>-->
				<div class="right">还不是会员? <a href="toPage?url=index/register">注册会员</a> </div>
			</div>
			<div class="loginClose"><a href="#" id="closeLogin">关闭</a></div>
			<div class="clear"></div>
		<HR id="hr" />
		</div>
	</div> 
	
	

    <div id="top">
    <iframe style="margin-left: 1367px" src="http://tianqi.5ikfc.com:90/plugin-code/?style=4&dy=1&fs=18&bg=56515117" allowTransparency="true" frameborder="0" scrolling="no" width="200" height="30" id="weather_frame"></iframe>
		<ul class="login">
			<li class="left">&nbsp;</li>
			<li id="hello">您好！</li>
			<li><a id="toggleLogin" href="#" style="font-size: 15px;">登录</a></li>
		</ul>
	</div>
	
		<div class="container logo" id="logo">
			<a href="#"><img src="img/logo_baidu.png" title="点击切换" id="bd" /></a>
			<a href="#"><img src="img/logo_bing.png" title="点击切换" id="bing" style="display:  none;"/></a>
		</div>

	
 <form action="metaSearch" method="post">
 	<div class="search" id="Search">
	<i id="ii"> </i>
	<div class="s-bar">
	<input type="text" name="sou_flag" value="bd" style="display: none;" id="sou_flag">
		<input type="text" id="Searchtext" autocomplete="off" value="点此进行搜索" name="Searchtext"  onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '点此进行搜索';}">
		<input type="submit" value="Search" id="but_sou" />
	</div>
</div>

  </form>
  		<div class="container content" id="urlbody">
				<ul class="nav nav-pills nav-justified" role="tablist">
			<c:forEach items="${urlSortInfos}" var="um">
					<li role="presentation">
					<a href="#${um.urlSortId}" aria-controls="${um.urlSortId}" role="tab" data-toggle="tab">${um.urlSortName}</a>
					</li>
			</c:forEach>
				</ul>

			<div class="tab-content col-md-12 col-xs-12">
			<c:forEach items="${urlSortInfos}" var="um">
					<div role="tabpanel" class="tab-pane" class="asd"  id="${um.urlSortId}">
					<c:forEach items="${um.urlInfos}" var="uu">
							<div class="col-md-2 col-xs-2" style="text-align: left; height: 55px">
								<a href="${uu.urlWeblink}"><img  src="img/ico/${uu.uId}.jpg" width="32px" height="32px" class="img-rounded" />${uu.urlName}</a>
							</div>
						</c:forEach>
						<div class="col-md-2 col-xs-2" style="text-align: left; height: 55px">
						<button type="button" uId="${um.urlSortId}" class="btu_jia btn btn-default" value="${um.urlSortId }" onclick="btnAdd(${um.urlSortId })">点击添加</button>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
  	
		

<div class="panel panel-warning addDiv" id="divAdd" style="display: none;width: 20%;margin: 0 auto;" align="center">
	  <div class="panel-heading">新增分类<span style="float:right;color:red;" id="close">X</span></div>
	  <div class="panel-body">
	    	<form method="post" id="addForm" action="url_Insert?flag=index" enctype="multipart/form-data" > 
	    	<input type="text" id="add_uId" name="urlSortId" value="" style="display: none;">
	    	<input type="text" id="add_userId" name="userId" value="${userId}" style="display: none;">
	    		<table  class="addTable">
	    			<tr>
						<td>网站LOGO</td>
						<td>
							<input type="file" name="img" id="categoryPic">
						</td>
					</tr>
					<tr>
						<td>网页名称</td>
						<td>
							<input type="text" name="urlName" class="form-control" id="name">
						</td>
					</tr>
					<tr>
						<td>网页链接</td>
						<td>
							<input type="text" name="urlWeblink" class="form-control" placeholder="请不要加http://或者https://" id="webLink">
						</td>
					</tr>
				
					<tr class="submitTR">
						<td colspan="2" align="center">
							<button type="submit" id="submitBtn" class="btn btn-success">提  交</button>
						</td>
					</tr>
				</table>
	    	</form> 
	  </div>
	</div>
   
	</body>

</html>