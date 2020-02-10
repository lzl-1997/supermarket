<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>产品详情</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/product_info.css" type="text/css" />
</head>
<script>
	function goshopping(){
		var pid = $("#pid").text();
		var pname = $("#pname").text();
		window.location.href="ShoppingCarServlet?pid="+pid;
	}
</script>
<body>
	<!-- 顶部栏 -->
	<div class="container-fluid">
		<div class="col-md-4">
			<img src="img/superhall.png" height="40px" width="140px" />
		</div>

		<div class="col-md-3" style="padding-top: 20px; float: right;">
			<ol class="list-inline">
				<li><a href="shoppingCar.jsp">购物车</a></li>
				<li><a href="#">我的订单</a></li>
			</ol>
		</div>
	</div>

	<!-- 导航条 -->
	<div class="container-fluid">
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.jsp">首页</a>
				</div>

				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
				</div>
			</div>
		</nav>
	</div>

	<!-- 商品详情展示 -->
	<div class="container">
		<div class="row">

			<div style="margin: 0 auto; width: 950px;">
				<div class="col-md-6">
					<img style="opacity: 1; width: 400px; height: 350px;" title=""
						class="medium" src="${product.pimg }">
				</div>

				<div class="col-md-6">
					<div>
						<strong id="pname">${product.pname }</strong>
					</div>
					<div style="border-bottom: 1px dotted #dddddd; width: 350px; margin: 10px 0 10px 0;">
						商品编号：<div style="display: inline-block;color: black;" id="pid" >${product.pid }</div>
					</div>

					<div style="margin: 10px 0 10px 0;">
						价格: <strong style="color: #ef0101;">￥ ${product.price }</strong>
					</div>

					<div style="margin: 10px 0 10px 0;">
						促销: <a target="_blank" title="限时抢购"
							style="background-color: yellow;">限时抢购</a>
					</div>
					<div style="margin: 10px 0 10px 0;">
						库存: <strong style="color: #ef0101;">${product.count }</strong>
					</div>

					<div style="padding: 10px; border: 1px solid #e7dbb1; width: 330px; margin: 15px 0 10px 0;; background-color: #fffee6;">

						<div style="margin: 20px 0 10px 0;; text-align: center;">
							<a href="#"> <input type="button" value="加入购物车" onclick="goshopping()"></a> &nbsp;
							<a>收藏商品</a>
						</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>

			<%--商品咨询评论--%>
			<div style="background-color: #d3d3d3; width: 900px;">
				<table class="table table-bordered">
					<tbody>
						<tr class="active">
							<th><strong>商品评论</strong></th>
						</tr>
						<tr class="warning">
							<th>暂无商品评论信息 <a>[发表商品评论]</a></th>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="background-color: #d3d3d3; width: 900px;">
				<table class="table table-bordered">
					<tbody>
						<tr class="active">
							<th><strong>商品咨询</strong></th>
						</tr>
						<tr class="warning">
							<th>暂无商品咨询信息 <a>[发表商品咨询]</a></th>
						</tr>
					</tbody>
				</table>
			</div>

		</div>
	</div>

	<jsp:include page="/footer.jsp"></jsp:include>

</body>

</html>