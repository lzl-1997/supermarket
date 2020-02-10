<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <head>
        <title>购物商城</title>
        <link rel="stylesheet" href="css/login.css">
        <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
        <style type="text/css">
            body {
                background-image: url("img/bottom.jpg");
            }
        </style>
        <script>
            function notice() {
                alert("系统维护中>>>");
            }

            function login() {
                var username = $("#username").val();
                var password = $("#password").val();
                var checkadmin = $("#admin").prop("checked");
                var checkUser = $("#user").prop("checked");
                //开始ajax
                $.ajax({
                    type: "post",
                    url: "LoginServlet",
                    data: {
                        username: username,
                        password: password,
                        checkadmin: checkadmin,
                        checkUser: checkUser
                    },
                    dataType: "text",//设置返回类型
                    success: function (result) {
                        if (result == "TRUE") {//用户
                            window.location.href = "index.jsp?&username=" + username;
                        } else if (result == "YES") {//管理员
                            window.location.href = "admin/main.jsp?&username=" + username;
                        } else if (result == "NULL") {
                            alert("密码或用户名不能为空");
                        } else {
                            alert("密码或用户名错误");
                        }
                    },
                    error: function (result) {
                        alert("请求失败")
                    }
                })
            }
        </script>
    </head>
<body>

<div class="dowebok">
    <div class="logo"></div>
    <div class="form-item">
        <input id="username" name="username" type="text" autocomplete="off" placeholder="账号">
    </div>
    <div class="form-item">
        <input id="password" name="password" type="password" autocomplete="off" placeholder="登录密码">
    </div>
    <div class="form-item">
        <button id="submit" type="button" onclick="login()">登&nbsp;&nbsp;录</button>
    </div>

    <div class="fo">
        <center><input type="radio" name="s" id="admin" value="admin">管理员
            <input type="radio" name="s" id="user" value="user" checked>用户
        </center>
    </div>
    <div class="reg-bar">
        <a class="reg" href="register.jsp">立即注册</a>
        <%--     注册成功后的提示信息         --%>
        <span style="color: red;text-align: center;margin-left: 60px">${register_msg==null?"":register_msg}</span>
        <%--     删除session中的提示信息      --%>
        <%request.getSession().removeAttribute("register_msg");%>
        <a class="forget" href="#" onclick="notice()">忘记密码</a>
    </div>
    </form>
</div>
</body>
</html>