package com.shop.servlet.main;

import java.io.IOException;
import java.util.Arrays;
import java.util.LinkedList;
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
@WebServlet("/ShoppingCarServlet")
public class ShoppingCarServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String op = request.getParameter("op");
		String pid = request.getParameter("pid");
		AdminService adminService = new AdminService();
		Product product = null;
		try {
			product = adminService.findProduct(pid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Gson gson = new Gson();
		String json = gson.toJson(product);
		request.setAttribute("product", json);
		System.out.println(product);
		//把商品的数量和名字存入cookie
		String ids = "";
		Cookie[] cookies = request.getCookies();
		if(cookies!=null){
			for (Cookie c : cookies) {
				if(c.getName().equals("pid")){
					System.out.println("aaa");
					ids = c.getValue();
					System.out.println(ids);
					String[] arr = ids.split("~");
					System.out.println(arr);
					List<String> asList = Arrays.asList(arr);
					LinkedList<String> list = new LinkedList<String>(asList);
					if(list.contains(product.getPid())){
						System.out.println("bbb");
						list.remove(product.getPid());
						list.addFirst(product.getPid());
					}else{
						if(list.size()>6){
							list.removeLast();
							list.removeLast();
							list.removeLast();
							
							list.addFirst(product.getPid());
						}else{
							list.addFirst(product.getPid());
						}
					}
					System.out.println(list.size());
					ids="";
					for(String s : list){
						ids+=(s+"~");
					}
					System.out.println(ids);
					ids = ids.substring(0,ids.length()-1);
					
				}
				c = new Cookie("pid",ids);
				c.setMaxAge(10*24*60*60);
				response.addCookie(c);
			}
			
		}

		request.getRequestDispatcher("shoppingCar.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}