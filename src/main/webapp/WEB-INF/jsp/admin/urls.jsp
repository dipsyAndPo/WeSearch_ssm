<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台管理</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="shortcut icon" href="img/favicon.ico" type="image/ico">
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<script src="js/jQuery.js" type="text/javascript" charset="utf-8"></script>
<script src="js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		
	<script type="text/javascript">
	$(function() {
		
		
	   $("input.urlName").keyup(function(){
	        var urlName = $(this).val();
	        var page = "url_update";
	        var uId = $(this).attr("uId");
	        var parentSpan = $(this);
	        parentSpan.css("border","1px solid green");
	        
	        $.post(
	                page,
	                {"urlName":urlName,"uId":uId},
	                function(result){
	                    if("success"==result)
	                        parentSpan.css("border","1px solid green");
	                    else
	                        parentSpan.css("border","1px solid red");
	                });
	        
	        
	        
	   });
	   
	   $("input.urlWeblink").keyup(function(){
	        var urlWeblink = $(this).val();
	        var page = "url_update";
	        var uId = $(this).attr("uId");
	        var parentSpan = $(this);
	        parentSpan.css("border","1px solid green");
	        
	        
	        $.post(
	                page,
	                {"urlWeblink":urlWeblink,"uId":uId},
	                function(result){
	                    if("success"==result)
	                        parentSpan.css("border","1px solid green");
	                    else
	                        parentSpan.css("border","1px solid red");
	                });
	        
	        
	        
	   });
	   

	   
	   
	   $("#submitBtn").click(function() {
		   if($("#webImg").val()==""){
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
	   
	   
	   

	   
	});
	</script>
</head>
<body>

<h1 id="msg"></h1>
<%@include file="admin_head.jsp"%>
<div style="width: 60%;margin: 0 auto;" align="center">
	<div class="listDataTableDiv">
		<table
			class="table table-striped table-bordered table-hover ">
			<thead>
				<tr class="success">
					<th>ID</th>
					<th>用户ID</th>
					<th>图片</th>
					<th>网址名称</th>
					<th>网址链接</th>
					<th>删除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${urlinfos}" var="url">
					<tr>
						<td>${url.uId}</td>
						<td>${url.userId}</td>
						<td> <img  src="img/ico/${url.uId}.jpg" width="32px" height="32px" class="img-rounded" /> </td>
						<td><input class="urlName" uId="${url.uId}" type="text" name="urlName" value="${url.urlName}"></td>
						<td><input class="urlWeblink" type="text" uId="${url.uId}" name="urlWeblink" value="${url.urlWeblink}"></td>
						<td><a deleteLink="true" href="url_delete?uId=${url.uId}&urlSortId=${url.urlSortId}"> <span
								class="glyphicon glyphicon-trash"></span></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="panel panel-warning addDiv">
	  <div class="panel-heading">新增分类</div>
	  <div class="panel-body">
	    	<form method="post" id="addForm" action="url_Insert?flag=admin" enctype="multipart/form-data" >
	    	<input type="text" name="urlSortId" value="${param.urlSortId}" style="display: none;">
	    		<table  class="addTable">
	    			<tr>
						<td>网站LOGO</td>
						<td>
							<input type="file" name="img" id="webImg">
						</td>
					</tr>
					<tr>
						<td>用户ID</td>
						<td>
							<input type="text" name="userId" class="form-control" id="userId">
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
							<input type="text" name="urlWeblink" class="form-control" id="webLink">
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
	
	</div>
</body>
</html>