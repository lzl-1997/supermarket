<%@ taglib prefix="if" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/index.css">
<title>网上购物商城首页</title>
	</head>
	<!-- //页面展示ajax跳转 -->
	<script type="text/javascript">
		//进入首页展示所有商品
		$(function () {
			$.ajax({
				type:"post",
				url:"ShowProductList",
				data:{
				},
				dataType:"json",
				success:function(data){
					var productArray = eval(data);
					var tbObject = $("#showProduct");
					tbObject.empty();
					//遍历每个种类的商品
					$(productArray).each(function(i,m){
						tbObject.append(
								"<div class='col-lg-2 col-md-3 col-sm-4 col-xs-4 style' style='height:250px;'>"+
								"<a href='${pageContext.request.contextPath}/ProductInfoServlet?pid="+m.pid+"'>"+
								"<img src='"+m.pimg+"' width='170' height='170' style='display: inline-block;'>"+
								"</a>"+
								"<p><a href='ProductInfoServlet?pid="+m.pid+"' style='color:green'>"+m.pname+"</a></p>"+
								"<p><font color='#FF0000'>商城价：&yen;"+m.price+"</font></p>"+
								"</div>"
						)
					})
				},
				error:function(){
					alert("商品页面加载失败，请重试")
				}
			})
		})
		//分类展示商品
		function searchProduct(object) {
			var kind = object.value;
			$.ajax({
			type:"post",
			url:"ShowProductListByKind",
			data:{
				kind:kind
			},
			dataType:"json",
			success:function(data){
				var productArray = eval(data);
				var tbObject = $("#showProduct");
				tbObject.empty();
				//遍历每个种类的商品
				$(productArray).each(function(i,m){
					tbObject.append(
							"<div class='col-lg-2 col-md-3 col-sm-4 col-xs-4 style' style='height:250px;'>"+
							"<a href='${pageContext.request.contextPath}/ProductInfoServlet?pid="+m.pid+"'>"+
								"<img src='"+m.pimg+"' width='170' height='170' style='display: inline-block;'>"+
							"</a>"+
							"<p><a href='${pageContext.request.contextPath}/ProductInfoServlet?pid="+m.pid+"' style='color:green'>"+m.pname+"</a></p>"+
							"<p><font color='#FF0000'>商城价：&yen;"+m.price+"</font></p>"+
							"</div>"
								
							)
				})
			
			},
			error:function(){
				alert("商品页面加载失败，请重试")
			}
			})
		}

		//搜索商品名展示
		function ShowProductByName(object) {
			var pname = $("#pname").val();
			$.ajax({
				type:"post",
				url:"ShowProductListByNameServlet",
				data:{
					pname:pname
				},
				dataType:"json",
				success:function(data){

					if(data.msg=="NULL"){
						alert("搜索框不能为空,请重试！")
					}else if(data.msg=="WRONG"){
						alert("不存在此商品,请重新搜索！")
					}else{
					var productArray = eval(data);
					var tbObject = $("#showProduct");
					tbObject.empty();
					//遍历每个种类的商品
					$(productArray).each(function(i,m){
						tbObject.append(
								"<div class='col-lg-2 col-md-3 col-sm-4 col-xs-4 style' style='height:250px;'>"+
								"<a href='${pageContext.request.contextPath}/ProductInfoServlet?pid="+m.pid+"'>"+
								"<img src='"+m.pimg+"' width='170' height='170' style='display: inline-block;'>"+
								"</a>"+
								"<p><a href='${pageContext.request.contextPath}/ProductInfoServlet?pid="+m.pid+"' style='color:green'>"+m.pname+"</a></p>"+
								"<p><font color='#FF0000'>商城价：&yen;"+m.price+"</font></p>"+
								"</div>"
						)
					})

					}
				},
				error:function(){
					alert("商品页面加载失败，请重试")
				}
			})

		}
	</script>

	<body>
		<%--顶部栏--%>
		<div class="container-fluid">
			<div class="col-md-4">
				<img src="img/superhall.png" height="40px" width="140px" />
			</div>

			<div class="col-md-3" style="padding-top: 20px; float: right;">
				<ol class="list-inline">
					<c:if test="${user!=null and user!=''}">
						<li>${user.username}，欢迎您！</li>
					</c:if>
					<c:if test="${user=null and user==''}">
							<li><a href="login.jsp">登录</a></li>
							<li><a href="register.jsp">注册</a></li>
					</c:if>

					<li><a href="shoppingCar.jsp">购物车</a></li>
					<li><a href="LogoutServlet">退出</a></li>
				</ol>
			</div>
		</div>
		<%--两条分割线--%>
		<hr><hr>
		<%--分类按钮和搜索框--%>
		<div class="alert-info">
			<table width="80%" bgcolor="#1C3F09" align="center">
		<%-- 分类展示和搜索 --%>
				<tr id="kindList">
					<td><button class='alert-danger' id='手机数码' onclick='searchProduct(this)' value='手机数码'>手机数码</button></td>
					<td><button class='alert-danger' id='电脑办公' onclick='searchProduct(this)' value='电脑办公'>电脑办公</button></td>
					<td><button class='alert-danger' id='水果' onclick='searchProduct(this)' value='水果'>蔬菜水果</button></td>
						<td style='float: right;'><input type='text'id="pname" name='pname'>
							<input type='button' value='搜索' onclick="ShowProductByName(this)"></td>
				</tr>
			</table>
<%--</form>--%>
		</div>
		<%--两条分割线--%>
			<hr><hr>

		<%--商品展示模块，调用ajax--%>
		<div class="row"  id="showProduct" style="width:100%;margin:0 auto; display: inline-block; padding-left: 60px; padding-right: 60px; text-align: center;"></div>
<%--		引入底部信息--%>
	<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>