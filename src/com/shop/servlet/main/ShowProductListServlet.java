package com.shop.servlet.main;

import com.google.gson.Gson;
import com.shop.model.Product;
import com.shop.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ShowProductList")
public class ShowProductListServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");


			AdminService adminService = new AdminService();

		List<Product> products = adminService.findAll();

			Gson gson = new Gson();
			String json = gson.toJson(products);
			
			response.getWriter().write(json);
}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}