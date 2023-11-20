package controller;

import business.Customer;
import data.CustomerDB;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "UserLoginServlet", urlPatterns = { "/login" })
public class UserLoginServlet extends HttpServlet {

  protected void register(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "/login.jsp";
    request.setCharacterEncoding("UTF-8");

    // get value
    String fullname = request.getParameter("fullname");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String phoneNumber = request.getParameter("phoneNumber");
    System.out.println(fullname);

    // set value to new customer object
    Customer customer = new Customer();
    customer.setBalance(0);
    customer.setEmail(email);
    customer.setFullname(fullname);
    customer.setPassword(password);
    customer.setPhoneNumber(phoneNumber);
    customer.setUsername(username);

    System.out.println(customer.getFullname());

    // insert to db
    CustomerDB.insert(customer);

    request.setAttribute("state", "register_success");
    request.getRequestDispatcher(url).forward(request, response);
  }

  protected void login(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "/login.jsp";

    // get value
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String remember = request.getParameter("remember");

    // set value to new customer object
    Customer customer = CustomerDB.selectCustomer(username, password);

    if (null != customer) {
      // if login success --> find out
      // Store customer to the session
      HttpSession session = request.getSession();
      final Object lock = request.getSession().getId().intern();
      synchronized (lock) {
        session.setAttribute("customer", customer);
      }

      // Create cookie for customer if remember = 'on'
      if ("on".equals(remember)) {
        Cookie c = new Cookie("customerId", customer.getCustomerId());
        c.setMaxAge(60 * 60 * 24); // cookie expire in 1 day
        c.setPath(request.getContextPath());
        response.addCookie(c);
      }

      response.sendRedirect(request.getContextPath());
    } else {
      request.setAttribute("state", "fail");
      request.getRequestDispatcher(url).forward(request, response);
    }

  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "/login.jsp";

    request.getRequestDispatcher(url).forward(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String action = request.getParameter("action");

    if (null != action) {
      switch (action) {
        case "register" ->
          this.register(request, response);
        case "login" ->
          this.login(request, response);
        default -> {
        }
      }
    }

  }

}
