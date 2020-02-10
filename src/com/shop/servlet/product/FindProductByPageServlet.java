package com.shop.servlet.product;


import com.shop.model.PageBean;
import com.shop.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/FindProductByPageServlet")
public class FindProductByPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String currentPage = request.getParameter("currentPage");
        String count = request.getParameter("count");

        if(currentPage==null||"".equals(currentPage)){
            currentPage="1";
        }
        if(count==null||"".equals(count)){
            count="5";
        }
        //条件查询
        Map<String, String[]> condition = request.getParameterMap();
        AdminService adminService = new AdminService();
        PageBean pageBean=adminService.findProductByPage(currentPage,count,condition);

        request.setAttribute("pageBean",pageBean);
        request.setAttribute("condition",condition);
        request.getRequestDispatcher("/admin/product/list.jsp").forward(request,response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
