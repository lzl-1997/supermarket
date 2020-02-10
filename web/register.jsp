<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册账号</title>
    <link rel="stylesheet" href="css/register.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <%--离焦事件，正则表达式--%>
    <script>

        window.onload = function () {

            //给表单绑定onsubmit事件
            document.getElementById("form").onsubmit = function () {

                return checkUsername()&&checkPassword()&&checkPhone()&&checkEmail();
            };

            //绑定离焦事件(鼠标移出后开始校验)
            document.getElementById("username").onblur = checkUsername;
            document.getElementById("password").onblur = checkPassword;
            document.getElementById("phone").onblur = checkPhone;
            document.getElementById("email").onblur = checkEmail;
        };

        //校验用户名
        function checkUsername() {
            var username = document.getElementById("username").value;
            var reg_username= /^[a-zA-Z0-9]{2,12}$/;
            var flag = reg_username.test(username);
            if (flag) {
                $("#s_username").css("color","green");
                s_username.innerHTML = "√";
            } else {
                $("#s_username").css("color","red");
                s_username.innerHTML = "用户名为2-12位的字母或数字";
            }
            return flag;
        }

        //校验密码
        function checkPassword() {
            var password = document.getElementById("password").value;
            var reg_password = /^[a-zA-Z0-9]{3,16}$/;
            var flag = reg_password.test(password);
            if (flag) {
                s_password.innerHTML = "√";
                $("#s_password").css("color","green");
            } else {
                $("#s_password").css("color","red");
                s_password.innerHTML = "密码长度为3-16位";
            }
            return flag;
        }
        //校验电话号码
        function checkPhone() {
            var phone = document.getElementById("phone").value;
            // var reg_phone = /^[0-9]{5，10}$/;
            var reg_phone = /^[1][3,4,5,7,8,9][0-9]{9}$/;
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
        function checkEmail() {
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
<div class="rg_layout" style="padding-top: 50px">
    <div class="rg_left">
        <p>注册账号</p>
        <p>User register</p>
    </div>
    <div class="rg_center" style="padding-left: 80px">
        <div class="rg_form">

            <form action="${pageContext.request.contextPath}/RegisterServlet" id="form" method="post">
                <table style="padding-top: 20px;padding-bottom:5px">


                    <tr style="padding-top: 200px;">
                        <td class="rg_left"><label for="username">用户名</label></td>
                        <td class="td_right">
                            <input type="text" name="username" id="username" placeholder="请输入用户名">
                            <span id="s_username" class="error"></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="rg_left"><label for="password">密&nbsp;&nbsp;&nbsp;码</label></td>
                        <td class="td_right">
                            <input type="password" name="password" id="password" placeholder="请输入密码">
                            <span id="s_password" class="error"></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="rg_left"><label for="email">邮&nbsp;&nbsp;&nbsp;箱</label></td>
                        <td class="td_right">
                            <input type="email" name="email" id="email" placeholder="请输入邮箱">
                            <span id="s_email" class="error"></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="rg_left"><label for="phone">电&nbsp;&nbsp;&nbsp;话</label></td>
                        <td class="td_right">
                            <input type="text" name="phone" id="phone" placeholder="请输入电话号码">
                            <span id="s_phone" class="error"></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="rg_left"><label>性&nbsp;&nbsp;&nbsp;别</label></td>
                        <td class="td_right">
                            <input type="radio" id="male" name="sex" value="男" checked>男
                            <input type="radio" id="female" name="sex" value="女">女
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" id="td_sub"><input type="submit" id="btn_sub" value="注册"></td>

                        <div class="error">
                            <%=request.getAttribute("register_msg")==null?"":request.getAttribute("register_msg")%></div>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<br>
<p align="center">已有账号？<a href="login.jsp">立即登录</a></p>
</body>
</html>