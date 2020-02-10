package com.shop.servlet.main;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.shop.model.Product;
import com.shop.service.AdminService;

@WebServlet("/ShowProductListByKind")
public class ShowProductListByKindServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");


			String kind = request.getParameter("kind");
			AdminService adminService = new AdminService();

		List<Product> products = adminService.findProductBykind(kind);

			Gson gson = new Gson();
			String json = gson.toJson(products);
			
			response.getWriter().write(json);
}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}