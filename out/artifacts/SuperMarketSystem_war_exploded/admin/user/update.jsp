
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>修改用户信息</title>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/jquery-3.3.1.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <script>
        window.onload = function () {
            //给表单绑定onsubmit事件
            document.getElementById("form").onsubmit = function () {
                return checkphone()&&checkpassword()&&checkemail();
            };
            //绑定离焦事件(鼠标移出后开始校验)
            document.getElementById("phone").onblur = checkphone;
            document.getElementById("password").onblur = checkpassword;
            document.getElementById("email").onblur = checkemail;
        };
        //校验手机号
        function checkphone() {
            var phone = document.getElementById("phone").value;
            var reg_phone= /^[1][3,4,5,7,8,9][0-9]{9}$/;
            var flag = reg_phone.test(phone);
            if (flag) {
                $("#s_phone").css("color","green");
                s_phone.innerHTML = "√";
            } else {
                $("#s_phone").css("color","red");
                s_phone.innerHTML = "电话号码格式错误";
            }
            return flag;
        }
        //校验邮箱
        function checkemail() {
            var email = document.getElementById("email").value;
            var reg_email = /^([a-zA-Z0-9]{1,18})@([a-zA-Z0-9]{1,}).([a-zA-Z0-9]{2,3})$/;
            var flag = reg_email.test(email);
            if (flag) {
                $("#s_email").css("color","green");
                s_email.innerHTML = "√";

            } else {
                $("#s_email").css("color","red");
                s_email.innerHTML = "邮箱格式有误";
            }
            return flag;
        }
        //校验密码
        function checkpassword() {
            var password = document.getElementById("password").value;
            var reg_password= /^[a-zA-Z0-9]{3,16}$/;
            var flag = reg_password.test(password);
            if (flag) {
                $("#s_password").css("color","green");
                s_password.innerHTML = "√";
            } else {
                $("#s_password").css("color","red");
                s_password.innerHTML = "密码为3-16位的数字或者字母";
            }
            return flag;
        }
    </script>
</head>
<body>
<div class="container">
    <h3 align="center">修改用户界面</h3>
    <form action="${pageContext.request.contextPath}/UpdateUserServlet" id="form" method="post">

        <input type="hidden" name="id" value="${user.id}">

        <div class="form-group">
            <label for="username">用户名</label>
            <input type="text" class="form-control" value="${user.username}" id="username" name="username" readonly="readonly">
        </div>

        <div class="form-group">
            <label for="phone">电话</label>
            <input type="text" class="form-control" value="${user.phone}" id="phone" name="phone">
                        <span id="s_phone"></span>
        </div>

        <div class="form-group">
            <label for="email">邮箱</label>
            <input type="text" class="form-control" value="${user.email}" id="email" name="email">
                        <span id="s_email"></span>
        </div>

        <div class="form-group">
            <label for="sex">性别</label>
            <select name="sex" id="sex" class="form-control">
                <c:if test="${user.sex=='男'}">
		            <option value="男" selected>男</option>
		            <option value="女">女</option>
                </c:if>
                <c:if test="${user.sex=='女'}">
		            <option value="男">男</option>
		            <option value="女" selected>女</option>
                </c:if>
            </select>
        </div>
        <div class="form-group">
            <label for="password">密码</label>
            <input type="password" class="form-control" value="${user.password}" id="password" name="password">
            <span id="s_password"></span>
        </div>
        <div align="center">
            <input class="btn btn-primary" type="submit" value="提交">
            <input class="btn btn-primary" type="reset" value="重置">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/FindUserByPageServlet">返回</a>
        </div>
    </form>
</div>
</body>
</html>
