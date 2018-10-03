<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<!-- 响应式设计 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>登录</title>

<link href="resources/bower_components/bootstrap/dist/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link
	href="resources/bower_components/jeasyui/themes/bootstrap/easyui.css"
	rel="stylesheet" type="text/css" />
<!-- 背景图片 -->
<style type="text/css">

body {                                

        overflow: hidden;

        position: fixed;

        width:100%;

        height:100%;

        background:url(resources/image/backgr1.jpg) no-repeat;

        background-size:cover;

}    

</style>
</head>
<body style="background-color: threedlightshadow;">
	<div style="padding-left: 40%;" >
		<div class="container-fluid auto-center">
			<div class="row">
				<div class="col-md-12" style="">
					<div style="margin-bottom: 10%;"></div>
					<div class="easyui-layout"
						style="width: 45%; height: 500px; border: solid, black, 1px; ">

						<!-- 注册栏 -->
						<div id="p" data-options="region:'center'" title="注册"
							style="width: 50%; padding: 10px; border: solid, black, 1px;  background-color:#FFDAB9;background-size: 100%; ">
							<c:if test="${requestScope.regmsg!=null }">
								<div class="alert alert-success" role="alert">
									${requestScope.regmsg }</div>
							</c:if>
							<form action="front/reg" method="post">
								<div class="form-group">
									<label for="exampleInputName">用户名</label> <input type="text"
										class="form-control" id="exampleInputName"
										value="${requestScope.name }" aria-describedby="emailHelp"
										placeholder="用户名" name="name">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword">密码</label> <input
										type="password" class="form-control" id="exampleInputPassword"
										name="pwd" placeholder="密码">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword">确认密码</label> <input
										type="password" class="form-control" id="exampleInputPassword"
										name="secondpwd" placeholder="密码">
								</div>
								<div class="form-group">
									
									<div>
									<label for="vcode">验证码</label> </div>
									<input type="text"
										name="vcode" class="form-control" id="exampleInputVcode" 
										maxlength="4" style="width: 180px; display: inline;">
										
									<img alt="" src="vcode.png" class="validateVcode" title="点击换图" style="margin-top: -7px;margin-left: 10px;">
									
								</div>
								<button type="submit" class="btn btn-primary">注册</button>

							</form>
						</div>

						<!-- 登录栏 -->
						<div id="lo" data-options="region:'east'" title="账户登录"
							style="border: solid, black, 1px; padding: 20px; background-color:#FFDAB9;background-size: contain;bac">
							<form action="front/login" method="post">
								<c:if test="${requestScope.msg!=null }">
									<div class="alert alert-success" role="alert">
										${requestScope.msg }</div>
								</c:if>
								<div class="form-group">
									<label for="exampleInputName">用户名</label> <input type="text"
										name="name" class="form-control" id="exampleInputName"
										value="${requestScope.name }" aria-describedby="emailHelp"
										placeholder="用户名">
								</div>
								<div class="form-group ">
									<label for="exampleInputPassword">密码</label> <input
										type="password" class="form-control" id="exampleInputPassword"
										name="pwd" placeholder="密码">
								</div>
								<div class="form-group ">
									<div>
									<label for="vcode">验证码</label> </div>
									<input type="text"
										class="form-control " id="vcode" maxlength="4"
										name="vcode" style="width: 180px; display: inline;">
									
										<img alt="" src="vcode.png" class="validateVcode" title="点击换图" style="margin-top: -7px;margin-left: 10px;">
									</div>

								<button type="submit" class="btn btn-primary">登录</button>

							</form>

						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="resources/bower_components/jquery/dist/jquery.js"></script>
	<script type="text/javascript"
		src="resources/bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="resources/bower_components/jeasyui/jquery.easyui.min.js"></script>

	<script type="text/javascript">
	$(function(){
		$(".validateVcode").click(function(){
			$(".validateVcode").attr("src","vcode.png?t=" + Math.random());
		});
	});
	</script>
</body>
</html>