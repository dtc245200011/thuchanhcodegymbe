package com.codegym;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "CalculatorServlet", value = "/calculate")
public class CalculatorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        
        float firstOperand = Float.parseFloat(request.getParameter("first-operand"));
        float secondOperand = Float.parseFloat(request.getParameter("second-operand"));
        char operator = request.getParameter("operator").charAt(0);

        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Result</title>");
            out.println("<style>");
            out.println("body { font-family: 'Times New Roman', Times, serif; padding: 20px; }");
            out.println("h1 { font-size: 32px; font-weight: bold; margin-bottom: 20px; }");
            out.println("p { font-size: 20px; }");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Result:</h1>");

            try {
                float result = Calculator.calculate(firstOperand, secondOperand, operator);
                out.println("<p>" + firstOperand + " " + operator + " " + secondOperand + " = " + result + "</p>");
            } catch (Exception ex) {
                out.println("<p style='color: red;'>Error: " + ex.getMessage() + "</p>");
            }

            out.println("</body>");
            out.println("</html>");
        }
    }
}
