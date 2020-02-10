package com.shop.servlet.main;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.shop.model.Product;
import com.shop.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/ShowProductListByNameServlet")
public class ShowProductListByNameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        String pname = request.getParameter("pname");

        //创建集合，封装数据为json
        Map<Object, String> hashMap = new HashMap<>();
        ObjectMapper mapper = new ObjectMapper();

        if (pname==null||pname.equals("")) { //输入为空
            hashMap.put("msg","NULL");
            mapper.writeValue(response.getWriter(),hashMap);

        }else { //输入不为空
        AdminService adminService = new AdminService();
        List<Product> products = adminService.findProductsByName(pname);

                if(products==null||products.toString()=="[]") { ////输入不为空，但是查询得到的结果为空
                    hashMap.put("msg","WRONG");
                    mapper.writeValue(response.getWriter(),hashMap);
                }else{//输入不为空。查询到数据
                    Gson gson = new Gson();
                    String json = gson.toJson(products);
                    response.getWriter().write(json);
                }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
