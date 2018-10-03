<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-expand-lg navbar-light static-top">

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#bs-example-navbar-collapse-1">
		<span class="navbar-toggler-icon"></span>
	</button>
	<a class="navbar-brand" href="#">Brand</a>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="navbar-nav">
			<li class="nav-item active"><a class="nav-link"
				href="front/toMain" style="color: white;">首页</a></li>
			<li class="nav-item"><a class="nav-link"
				href="front/productInfoList" style="color: white;">美食等你来</a></li>
			<li class="nav-item"><a class="nav-link"
				href="front/shopingCart" style="color: white;">我的购物车</a></li>
			<li class="nav-item"><a class="nav-link" href="front/order" style="color: white;">我的订单</a></li>
			<li class="nav-item"><a class="nav-link" href="front/orderpay" style="color: white;">订单结算</a></li>
		
		</ul>



		<form class="form-inline">
			<input class="form-control mr-sm-2" type="text" />
			<button class="btn btn-primary my-2 my-sm-0" type="submit">
				Search</button>
		</form>
		<ul class="navbar-nav ml-md-auto">
			<li class="nav-item active">
			<c:choose>
			<c:when test="${empty buyer.buyerName }">
			   <a href="front/toLogin" style="text-decoration: none"><span style="color: white">亲爱的用户，请登录</span></a>
			</c:when>
			<c:otherwise>
			<span style="color: white;">欢迎&ensp;
					[${buyer.buyerName }]&ensp;登录 </span> <a href="front/exit"
				style="text-decoration: none; color: white"><span>&nbsp;&nbsp;退出</span></a>
			</c:otherwise>
			</c:choose>
			</li>
			<li class="nav-item dropdown"></li>
		</ul>
	</div>
</nav>