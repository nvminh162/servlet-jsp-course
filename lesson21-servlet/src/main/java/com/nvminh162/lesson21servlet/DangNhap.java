package com.nvminh162.lesson21servlet;

import java.io.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "dang-nhap", value = "/dang-nhap")
public class DangNhap extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            // Set character encoding
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html");

            String tenDangNhap = request.getParameter("tenDangNhap");
            String matKhau = request.getParameter("matKhau");

            String url ="";
            if (tenDangNhap.equalsIgnoreCase("1")&&matKhau.equals("1")) {
                //response.getWriter().append("Chúc mừng bạn đã đăng nhập thành công!");
                 url = "/success.jsp";
//                response.sendRedirect("success.jsp");

            }else {
                //response.getWriter().append("Đăng nhập thất bại!");
                url = "/error.jsp";
//                response.sendRedirect("error.jsp");
            }

            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);

        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            // Set character encoding
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            // Set content type
            response.setContentType("text/html");


        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}