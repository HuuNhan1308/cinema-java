package controller;

import business.Customer;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import business.Movie;
import data.CookieUtil;
import data.CustomerDB;

import data.MovieDB;

import java.util.List;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

@WebServlet(name = "UserServlet", urlPatterns = { "" })
public class UserServlet extends HttpServlet {

  protected void logOut(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    HttpSession session = request.getSession();

    // delete customerId cookies
    Cookie c = new Cookie("customerId", "");
    c.setMaxAge(0);
    response.addCookie(c);

    // delete all session
    session.invalidate();

    System.out.println("invalidate session");
    response.sendRedirect(request.getContextPath());
  }

  protected void show(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    HttpSession session = request.getSession();

    // Check cookie and assign to session
    Cookie[] cookies = request.getCookies();
    String customerId = CookieUtil.getCookieValue(cookies, "customerId");
    if (customerId != null && !customerId.isEmpty()) {
      // If exist customer Id in cookie ==> create customer obj
      Customer customer = CustomerDB.selectCustomer_byId(customerId);
      session.setAttribute("customer", customer);
      customer = CustomerDB.selectCustomer_byId(customerId);
    }

    String url = "/index.jsp";

    List<Movie> movies = MovieDB.selectTop8Movies();

    request.setAttribute("movies", movies);
    request.getRequestDispatcher(url).forward(request, response);
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String action = request.getParameter("action");

    // if invoke action logout
    if (action == null) {
      this.show(request, response);
    } else {
      switch (action) {
        case "out" ->
          this.logOut(request, response);
        default -> {

        }
      }
    }

  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    // add balance
    HttpSession session = request.getSession();
    Customer customer = (Customer) session.getAttribute("customer");
    int addedBalance = Integer.parseInt(request.getParameter("balance"));
    customer.setBalance(customer.getBalance() + addedBalance);

    CustomerDB.update(customer);

    response.sendRedirect(request.getContextPath());

  }

}
