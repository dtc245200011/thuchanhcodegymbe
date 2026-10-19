package com.codegym;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "DiscountServlet", value = "/display-discount")
public class DiscountServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String description = request.getParameter("description");
        double price = 0;
        double discountPercent = 0;

        try {
            price = Double.parseDouble(request.getParameter("price"));
            discountPercent = Double.parseDouble(request.getParameter("discount"));
        } catch (NumberFormatException e) {
            price = 0;
            discountPercent = 0;
        }

        double discountAmount = price * discountPercent * 0.01;
        double discountPrice = price - discountAmount;

        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Discount Result</title>");
            out.println("<style>");
            out.println("body { font-family: Arial, sans-serif; display: flex; justify-content: center; margin-top: 50px; background-color: #f8fafc; }");
            out.println(".result-container { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); width: 400px; }");
            out.println(".result-row { display: flex; justify-content: space-between; margin-bottom: 12px; font-size: 16px; }");
            out.println(".result-label { font-weight: bold; color: #1b2a7a; }");
            out.println(".result-value { color: #333; }");
            out.println(".highlight { color: #27ae60; font-weight: bold; }");
            out.println(".btn-back { display: block; text-align: center; margin-top: 20px; padding: 10px; background-color: #1b2a7a; color: white; text-decoration: none; border-radius: 4px; }");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class='result-container'>");
            out.println("<h2 style='text-align: center; color: #1b2a7a;'>Product Discount Calculation</h2>");
            out.println("<hr/><br/>");
            
            out.println("<div class='result-row'><span class='result-label'>Product Description:</span><span class='result-value'>" + description + "</span></div>");
            out.println("<div class='result-row'><span class='result-label'>List Price:</span><span class='result-value'>$" + String.format("%.2f", price) + "</span></div>");
            out.println("<div class='result-row'><span class='result-label'>Discount Percent:</span><span class='result-value'>" + discountPercent + "%</span></div>");
            out.println("<div class='result-row'><span class='result-label'>Discount Amount:</span><span class='result-value highlight'>$" + String.format("%.2f", discountAmount) + "</span></div>");
            out.println("<div class='result-row'><span class='result-label'>Discount Price:</span><span class='result-value highlight'>$" + String.format("%.2f", discountPrice) + "</span></div>");
            
            out.println("<a href='index.jsp' class='btn-back'>Calculate Again</a>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        }
    }
}
