package com.shop.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {
    @Override
    public void doFilter(ServletRequest arg0, ServletResponse arg1,
                         FilterChain arg2) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) arg0;
        HttpServletResponse response = (HttpServletResponse) arg1;
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();

        arg2.doFilter(arg0, arg1);

//        if (session.getAttribute("user")==null&&session.getAttribute("admin")==null){
//            if (request.getRequestURI().contains("login.do")
//                    || request.getRequestURI().contains("register.do")
//                    || request.getRequestURI().contains("/LoginServlet")
//                    || request.getRequestURI().contains("/RegisterServlet")
//                    || request.getRequestURI().contains("css")
//                    || request.getRequestURI().contains("fonts")
//                    || request.getRequestURI().contains("img")
//                    || request.getRequestURI().contains("js")) {
//                arg2.doFilter(arg0, arg1);
//            }else {
//                response.sendRedirect("login.jsp");
//            }
//        }

//        if (request.getRequestURI().contains("login.do")
//                || request.getRequestURI().contains("register.do")
//                || request.getRequestURI().contains("/LoginServlet")
//                || request.getRequestURI().contains("/RegisterServlet")
//                || request.getRequestURI().contains("css")
//                || request.getRequestURI().contains("fonts")
//                || request.getRequestURI().contains("img")
//                || request.getRequestURI().contains("js")) {
//            arg2.doFilter(arg0, arg1);
//        }
//        else if (request.getSession().getAttribute("user") != null) {
//            if (!request.getRequestURI().contains("/admin")) {
//                arg2.doFilter(arg0, arg1);
//            } else {
//                response.sendRedirect("login.jsp");
//            }
//        } else if (request.getSession().getAttribute("admin") != null) {
//            if (request.getRequestURI().contains("/admin")) {
//                arg2.doFilter(arg0, arg1);
//            } else {
//                response.sendRedirect("login.jsp");
//            }
//        }
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
    }

    @Override
    public void destroy() {
    }
}