package com.shop.servlet.main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.shop.model.Product;
import com.shop.service.AdminService;
@WebServlet("/getProductCookie")
public class GetProductCookieServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		Cookie[] cookies = request.getCookies();
		if(cookies!=null){
			for (Cookie c : cookies) {
				if(c.getName().equals("pid")){
					
					String[] arr = c.getValue().split("~");
					AdminService adminService = new AdminService();
					List<Product> productList = new ArrayList<Product>();
					
					for (String pid : arr) {
						if(!pid.equals("")){
							Product product = null;
							try {
								product = adminService.findProduct(pid);
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							if(product!=null){
								
								productList.add(product);
								
							}
						}
						
					}
					Gson gson = new Gson();
					String json = gson.toJson(productList);
					System.out.println(json);
					response.getWriter().write(json);
					
					
				}
			}
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}