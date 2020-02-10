package com.shop.servlet;

import com.shop.model.Admin;
import com.shop.model.User;
import com.shop.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String checkadmin = request.getParameter("checkadmin");
        String checkUser = request.getParameter("checkUser");

        //获取输出流
        PrintWriter pw = response.getWriter();

        if (username == "" || password == "") { //用户名或者密码为空
            pw.write("NULL");
        } else if (checkadmin.equals("true")) {//管理员登录
            boolean flag = new UserService().CheckAdminLogin(username, password);
            if (flag) {
                pw.write("YES");
                Admin admin = new Admin(username, password);
                request.getSession().setAttribute("admin", admin);
            } else {
                pw.write("NO");
            }
        } else if (checkUser.equals("true")) {//用户登录
            boolean flag = new UserService().CheckUserLogin(username, password);
            if (flag) {
                pw.write("TRUE");
                User user = new User(username, password);
                request.getSession().setAttribute("user", user);
            } else {
                pw.write("FALSE");
            }
        }
        //关闭输出流
        pw.close();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
