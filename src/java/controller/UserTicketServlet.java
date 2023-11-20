/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import business.Customer;
import business.Invoice;
import data.CookieUtil;
import data.CustomerDB;
import data.InvoiceDB;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;
import java.util.List;
import javax.servlet.http.HttpSession;

@WebServlet(name = "UserTicketServlet", urlPatterns = {"/ticket"})
public class UserTicketServlet extends HttpServlet {

  protected void show(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    String url = "/ticket.jsp";

    // Get user from session
    HttpSession session = request.getSession();
    final Object lock = request.getSession().getId().intern();
    Customer customer;

    // Get customer from session
    synchronized (lock) {
      customer = (Customer) session.getAttribute("customer");
    }

    System.out.println(customer);
    
    // Dont have in session? check in cookie
    if (customer == null) {
      // Get all cookies
      Cookie[] cookies = request.getCookies();
      String customerId = CookieUtil.getCookieValue(cookies, "customerId");

      if (customerId.isEmpty() || customerId == null) {
        //check if customerId not exist in cookie --> redirect to login page
        response.sendRedirect(request.getContextPath() + "/login");
        return;
      } else {
        // if contain cookie --> move to page
        customer = CustomerDB.selectCustomer_byId(customerId);
      }
    }

    
    String customerId = customer.getCustomerId();
    // Select all ticket with this customerId
    List<Invoice> invoices = InvoiceDB.selectInvoices(customerId);

    // Query all ticket with this customerId
    request.setAttribute("invoices", invoices);

    request.getRequestDispatcher(url).forward(request, response);

  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {

    this.show(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {

  }

}
