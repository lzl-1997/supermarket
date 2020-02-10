<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>修改商品信息</title>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/jquery-3.3.1.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <script>
        window.onload = function () {
            //给表单绑定onsubmit事件
            document.getElementById("form").onsubmit = function () {
                return checkPrice()&&checkCount();
            };
            //绑定离焦事件(鼠标移出后开始校验)
            document.getElementById("price").onblur = checkPrice;
            document.getElementById("count").onblur = checkCount;
        };
        //校验价格
        function checkPrice() {
            var price = document.getElementById("price").value;
            var reg_price= /(^[1-9]\d*(\.\d{1,2})?$)|(^0(\.\d{1,2})?$)/;
            var flag = reg_price.test(price);
            if (flag) {
                $("#s_price").css("color","green");
                s_price.innerHTML = "√";
            } else {
                $("#s_price").css("color","red");
                s_price.innerHTML = "价格输入不合法";
            }
            return flag;
        }
        //校验库存
        function checkCount() {
            var count = document.getElementById("count").value;
            var reg_count= /^([1-9]\d*|[0]{1,1})$/;
            var flag = reg_count.test(count);
            if (flag) {
                $("#s_count").css("color","green");
                s_count.innerHTML = "√";
            } else {
                $("#s_count").css("color","red");
                s_count.innerHTML = "库存数量不合法";
            }
            return flag;
        }
    </script>
</head>
<body>
<div class="container">
    <h3 align="center">修改商品界面</h3>
    <form action="${pageContext.request.contextPath}/UpdateProductServlet" id="form" method="post">

        <input type="hidden" name="pid" value="${product.pid}">

        <div class="form-group">
            <label for="pname">商品名</label>
            <input type="text" class="form-control" value="${product.pname}" id="pname" name="pname" readonly="readonly">
        </div>

        <div class="form-group">
            <label for="price">价格</label>
            <input type="text" class="form-control" value="${product.price}" id="price" name="price">
                        <span id="s_price"></span>
        </div>

        <div class="form-group">
            <label for="count">库存</label>
            <input type="text" class="form-control" value="${product.count}" id="count" name="count">
                        <span id="s_count"></span>
        </div>

        <div class="form-group">
            <label for="kind">种类</label>
            <select name="kind" id="kind" class="form-control">
                <c:if test="${product.kind=='水果'}">
                    <option value="手机数码">手机数码</option>
		            <option value="电脑办公">电脑办公</option>
		            <option value="水果" selected>水果</option>
		            <option value="男衣">男衣</option>
		            <option value="女衣">女衣</option>
                </c:if>
                <c:if test="${product.kind=='手机数码'}">
                    <option value="手机数码" selected>手机数码</option>
		            <option value="电脑办公">电脑办公</option>
		            <option value="水果">水果</option>
		            <option value="男衣">男衣</option>
		            <option value="女衣">女衣</option>
                </c:if>
                <c:if test="${product.kind=='电脑办公'}">
                    <option value="手机数码">手机数码</option>
		            <option value="电脑办公" selected>电脑办公</option>
		            <option value="水果">水果</option>
		            <option value="男衣">男衣</option>
		            <option value="女衣">女衣</option>
                </c:if>
                <c:if test="${product.kind=='男衣'}">
                    <option value="手机数码">手机数码</option>
		            <option value="电脑办公">电脑办公</option>
		            <option value="水果">水果</option>
		            <option value="男衣" selected>男衣</option>
		            <option value="女衣">女衣</option>
                </c:if>
                <c:if test="${product.kind=='女衣'}">
                    <option value="手机数码">手机数码</option>
		            <option value="电脑办公">电脑办公</option>
		            <option value="水果">水果</option>
		            <option value="男衣">男衣</option>
		            <option value="女衣" selected>女衣</option>
                </c:if>
            </select>
        </div>


        <div align="center">
            <input class="btn btn-primary" type="submit" value="提交">
            <input class="btn btn-primary" type="reset" value="重置">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/FindProductByPageServlet">返回</a>
        </div>
    </form>
</div>
</body>
</html>
