package com.shop.servlet;

import com.shop.model.User;
import com.shop.service.UserService;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        String username = request.getParameter("username");
        boolean flag = new UserService().findByUsername(username);
        if (flag) {
            request.getSession().setAttribute("register_msg", "用户已存在，请重新注册");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else {
            Map<String, String[]> map = request.getParameterMap();
            User user = new User();
            UserService userService = new UserService();
            try {
                //将页面的值封装到user
                BeanUtils.populate(user, map);
                int i = userService.register(user);
                if (i == 1) {//注册成功
                    request.getSession().setAttribute("register_msg", "注册成功，请登录");
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                } else {//注册请求失败
                    request.getSession().setAttribute("register_msg", "注册失败，请重试");
                }
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
