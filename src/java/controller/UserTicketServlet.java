/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import business.Invoice;
import data.InvoiceDB;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;
import java.util.List;

@WebServlet(name = "UserTicketServlet", urlPatterns = { "/ticket" })
public class UserTicketServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = "/ticket.jsp";

        // Get all cookies
        Cookie[] cookies = request.getCookies();
        String customerId = null;

        // If there are no cookies, this would be null
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("customerId")) {
                    customerId = cookie.getValue();
                    break;
                }
            }
        }
        if (customerId == null) {
            url = "/login.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        }

        // Select all ticket with this customerId
        List<Invoice> invoices = InvoiceDB.selectInvoices(customerId);

        // Query all ticket with this customerId
        request.setAttribute("invoices", invoices);

        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
