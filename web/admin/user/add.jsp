<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>添加用户</title>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/jquery-3.3.1.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <script>

        window.onload = function () {
            //给表单绑定onsubmit事件
            document.getElementById("form").onsubmit = function () {
                return checkphone()&&checkpasswoord()&&checkusername()&&checkemail();
            };
            //绑定离焦事件(鼠标移出后开始校验)
            document.getElementById("username").onblur = checkusername;
            document.getElementById("phone").onblur = checkphone;
            document.getElementById("passwoord").onblur = checkpasswoord;
            document.getElementById("email").onblur = checkemail;
        };
        //校验用户名
        function checkusername() {
            var username = document.getElementById("username").value;
            var reg_username=/^[a-zA-Z0-9]{2,12}$/;
            var flag = reg_username.test(username);
            if (flag) {
                $("#s_username").css("color","green");
                s_username.innerHTML = "√";
            } else {
                $("#s_username").css("color","red");
                s_username.innerHTML = "用户名为2-12位的字母或者数字";
            }
            return flag;
        }
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
        //校验密码
        function checkpasswoord() {
            var passwoord = document.getElementById("passwoord").value;
            var reg_passwoord= /^[a-zA-Z0-9]{3,16}$/;
            var flag = reg_passwoord.test(passwoord);
            if (flag) {
                $("#s_passwoord").css("color","green");
                s_passwoord.innerHTML = "√";
            } else {
                $("#s_passwoord").css("color","red");
                s_passwoord.innerHTML = "密码为3-16位的数字或者字母";
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
    </script>
</head>
<body>
<div class="container">
    <h3 align="center">添加用户</h3>
    <form action="${pageContext.request.contextPath}/AddUserServlet" id="form" method="post">

        <div class="form-group">
            <label for="username">用户名</label>
            <input type="text" class="form-control" id="username" name="username">
                    <span id="s_username"></span>
        </div>

        <div class="form-group">
            <label for="phone">电话</label>
            <input type="text" class="form-control" id="phone" name="phone">
                    <span id="s_phone"></span>
        </div>
        <div class="form-group">
            <label for="sex">性别</label>
            <select name="sex" id="sex" class="form-control">
                <option value="男">男</option>
	            <option value="女">女</option>
            </select>
        </div>
        <div class="form-group">
            <label for="passwoord">密码</label>
            <input type="password" class="form-control" id="passwoord" name="passwoord">
                    <span id="s_passwoord"></span>
        </div>
        <div class="form-group">
            <label for="email">邮箱</label>
            <input type="text" class="form-control" id="email" name="email">
                    <span id="s_email"></span>
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
