<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<style type="text/css">
		#big{

			width: 800px;
			margin: 0 auto;
		}
		#header{
			width: 800px;
			margin: 0 auto;
			margin-top: 50px;
		}
		table {
			width: 600px;
			padding-top: 50px;
			font-size: large;
		}
		table tr td {
			border: 2px solid black;
			text-align: center;

		}
		#th input{
			background-color: red;
		}
		table tr td img{
			width: 120px;
			height: 80px;
		}
	</style>
	<script type="text/javascript">

        //获取支付总金额
        $(function(){
            var sumprice = 0; //订单金额默认设置为0
            $("#sumprice").html(sumprice);
            var sumcount = 0; //默认选择的商品总数量为0
            $("#sumcount").html(sumcount);

            $.ajax({
                type:"post",
                url:"getProductCookie",
                data:{
                },
                dataType:"json",
                success:function(data){
                    var ProductList = eval(data);//加载数据到集合
                    var table = $("#goods"); 	 //获取表格
                    $(ProductList).each(function(i,m){ //i为index，m为element
                        var count = 1;
                        var price =(m.price)*1;
                        var totalPrice=count*price;
                        var maxcount=(m.count)*1;
                        table.append(
                            "<tr>"+

                            "<td><input type='checkbox' class='checkbox' name='checkbox' onclick='checkedSingle(this)'/></td>"+
                            "<td>"+m.pname+"</td>"+
                            "<td><img src='"+m.pimg+"'></td>"+
                            "<td><span class='price'>"+price+"</span></td>"+

                            "<td>" +
                            "<button onclick='reduce(this)'>-</button>" +
                            "<span class='count'>"+count+"</span>" +
                            "<button onclick='add(this)'>+</button>" +
                            "</td>"+
                            "<td><span class='totalPrice'>"+totalPrice+"</span></td>"+
                            "<td hidden><span class='maxcount'>"+maxcount+"</span></td>"+

                            "</tr>"
                        )
                    })
                },
                error:function(){
                    alert("取Cookie失败！");
                }

            })


        });


		//全选与全不选
        function checkedAll() {
            var flag = $("#checkedAll").prop("checked");
            $(".checkbox").prop("checked", flag);
            if(flag){
                var totalPrice=0;
                var totalPrices = document.getElementsByClassName("totalPrice");
                for (var i = 0; i < totalPrices.length; i++) {
                    var price = totalPrices[i].innerHTML *1;
                    totalPrice=totalPrice+price;
                }
                $("#sumprice").html(totalPrice);
                var totalcount=0;
                var counts = document.getElementsByClassName("count");
                for (var i = 0; i < counts.length; i++) {
                    var count = counts[i].innerHTML *1;
                    totalcount=totalcount+count;
                }
                $("#sumcount").html(totalcount);
            }else {
                $("#sumprice").html(0);
                $("#sumcount").html(0);
            }
        }

        //下方的任何一个按钮没有选中，则全选按钮处于为未选中状态
		function checkedSingle(obj) {
			var list = document.getElementsByName('checkbox');// 获得某class的所有对象(返回的是数组)

			var flag=true;//设置一个flag，true为下方全选中
			for (var i = 0; i < list.length; i++) {
                var checked = list[i].checked;
                    var totalPrice=0;
                    var totalCount=0;
                    var price = $($(obj).parent().parent()).children("td").children(".totalPrice").html() * 1;
                    var count = $($(obj).parent().parent()).children("td").children(".count").html() * 1;
                if (checked) {
                    totalPrice = totalPrice + price;
                    $("#sumprice").html(totalPrice);
                    totalCount = totalCount + count;
                    $("#sumcount").html(totalCount);

                } else { //下面的单选框有一个没有选中，则全选框则取消
                    $("#checkedAll").prop("checked", false);
                    flag = false; //只要存在一个没有选中，则全选按钮不选中
                    // break;
                    totalPrice = totalPrice - price;
                    $("#sumprice").html(totalPrice);
                    totalCount = totalCount - count;
                    $("#sumcount").html(totalCount);
                }
            }
				if(flag){// 遍历完成后判断flag的值,为true时设置全选框为选中状态
                    $("#checkedAll").prop("checked", true);
                }
		}

        //减少商品数量
        function reduce(obj){

            var parent1 = $(obj).parent();  //获取当前对象的父元素标签button
            var children1 = $(parent1).children(".count"); //在通过span的class属性获取span标签
            var count = children1.html() *1;   //通过span的class属性获取商品数量值，然后string转int

            var parent2 =parent1.parent();  //获取parent1的父元素父元素标签td
            var children2 = $(parent2).children("td").children(".price");
            var price = children2.html() *1;   //通过span的class属性获取商品的单价，然后string转int
            var children3 = $(parent2).children("td").children(".totalPrice");
            var totalPrice = children3.html() *1;   //通过span的class属性获取商品的小计，然后string转int

            if(count>1){ //count至少为1
                count=count-1;//数量减一
                children1.html(count);//点击按钮后设置数量
                totalPrice=totalPrice-price;
                children3.html(totalPrice);//点击按钮后设置小计
            }
        }

        //增加商品数量
        function add(obj){

            var parent1 = $(obj).parent();  //获取当前对象的父元素标签button
            var children1 = $(parent1).children(".count"); //在通过span的class属性获取span标签
            var count = children1.html() *1;   //通过span的class属性获取商品数量值，然后string转int

            var parent2 =parent1.parent();  //获取parent1的父元素父元素标签td
            var children2 = $(parent2).children("td").children(".price");
            var price = children2.html() *1;   //通过span的class属性获取商品的单价，然后string转int
            var children3 = $(parent2).children("td").children(".totalPrice");
            var totalPrice = children3.html() *1;   //通过span的class属性获取商品的小计，然后string转int
            var children4 = $(parent2).children("td").children(".maxcount");
            var maxcount = children4.html() *1;   //通过span的class属性获取商品的小计，然后string转int
            if(count<maxcount){ //count不能大于库存
                count=count+1;//数量加一
                children1.html(count);//点击按钮后设置数量
                totalPrice=totalPrice+price;
                children3.html(totalPrice);//点击按钮后设置小计
            }
        }


	</script>
<title>购物车</title>
</head>
<body>
<div id="big">
<div id='header'><center>
<h3 ><img src="img/shoppingcar.gif"/>&nbsp;我的购物车</h3>
			<%--购物车中的商品信息--%>
			<table id="goods" border="1" class="table table-bordered table-hover">
				<tr class="success">
				<td ><input id='checkedAll' type='checkbox' onclick="checkedAll()"></td>
				<td>名称</td>
				<td>图片</td>
				<td>单价</td>
				<td>数量</td>
				<td>小计</td>
				</tr>
			</table>
</center>
</div>
		<%--结算金额和商品数量--%>
		<div id="account">
			<font style='display: inline-block;margin-left: 110px;'>选中<span id='sumcount' style="color: red"></span>件商品</font>
			<font style='margin-left: 200px ;'>总计￥<span id='sumprice'style='color: red;'></span></font>
			<button class='btn btn-primary' type='submit' onclick='sumprice()' style='font-weight: bold; float: right;margin-right: 110px;margin-top: 10px;'>去结算</button>
		</div>
</div>
</body>
</html>
