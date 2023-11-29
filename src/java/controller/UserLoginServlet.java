package controller;

import business.Customer;
import data.CustomerDB;
import data.MailUtilGmailDB;

import java.io.IOException;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.MessagingException;
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
      throws ServletException, IOException, MessagingException {
    String url = "/login.jsp";
    request.setCharacterEncoding("UTF-8");

    // get value
    String fullname = request.getParameter("fullname");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String phoneNumber = request.getParameter("phoneNumber");

    // set value to new customer object
    Customer customer = new Customer();
    customer.setBalance(0);
    customer.setEmail(email);
    customer.setFullname(fullname);
    customer.setPassword(password);
    customer.setPhoneNumber(phoneNumber);
    customer.setUsername(username);

    Customer checkEmail = CustomerDB.selectCustomerByEmail(email);
    Customer checkUsername = CustomerDB.selectCustomerByUsername(username);

    if (checkEmail != null || checkUsername != null) {
      request.setAttribute("state", "existCustomer");
      request.getRequestDispatcher(url).forward(request, response);
      return;
    }

    // insert to db
    CustomerDB.insert(customer);

    // send mail
    String to = email;
    String subject = "Thanks for creating an account with us! NTV Cinema";
    String body = "Hi " + fullname + ",\n\n"
        + "Your username is " + username + ".\n\n"
        + "Thank you for registering and booking cinema online with us. We are delighted to have you as our valued customer."
        + "\n"
        + "Please keep your information safe and do not share them with anyone. You can use them to log in to your account and manage your bookings, preferences, and rewards."
        + "\n"
        + "We hope you enjoy the movie and have a wonderful time with us. If you have any questions or feedback, please feel free to contact us at "
        + "nhanhohuunhan7398@gmail.com" + ".\n"
        + "Thank you for choosing us and we look forward to seeing you again soon." + "\n\n"
        + "Best regards, NTV Cinema" + "\n";

    try {
      MailUtilGmailDB.sendMail(to, subject, body);
    } catch (jakarta.mail.MessagingException ex) {
      Logger.getLogger(UserLoginServlet.class.getName()).log(Level.SEVERE, null, ex);
    }

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

    if ("admin".equals(username) && "admin".equals(password)) {
      response.sendRedirect(request.getContextPath() + "/admin/movies");
      return;
    }

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

      response.sendRedirect(request.getContextPath() + "/");
    } else {
      request.setAttribute("state", "fail");
      request.getRequestDispatcher(url).forward(request, response);
    }

  }

  protected void recoverPassword(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "/login.jsp";
    String emailForgot = request.getParameter("emailForgot");
    request.setAttribute("emailForgot", emailForgot);
    Customer customer = CustomerDB.selectCustomerByEmail(emailForgot);
    String newPassword = UUID.randomUUID().toString();
    if (customer == null) {
      request.setAttribute("state", "emailNotFound");
      request.getRequestDispatcher(url).forward(request, response);
      return;
    } else {
      request.setAttribute("state", "emailFound");
      customer.setPassword(newPassword);
      CustomerDB.update(customer);
      String to = emailForgot;
      String subject = "Password Recovery for Your NTV Cinema Account";
      String body = "Hi " + customer.getFullname() + ",\n\n"
          + "You have requested to recover your password.\n\n"
          + "Your username is " + customer.getUsername() + ".\n\n"
          + "Your new password is: " + newPassword + "\n\n"
          + "Please change this password after logging in for security purposes.\n\n";
      try {
        MailUtilGmailDB.sendMail(to, subject, body);
      } catch (jakarta.mail.MessagingException ex) {
        Logger.getLogger(UserLoginServlet.class.getName()).log(Level.SEVERE, null, ex);
      }
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
    request.setCharacterEncoding("UTF-8");
    String action = request.getParameter("action");

    if (null != action) {
      switch (action) {
        case "register" -> {
          try {
            this.register(request, response);
          } catch (MessagingException e) {
            // Handle the exception here
            e.printStackTrace();
          }
        }
        case "login" -> {
          this.login(request, response);
        }
        case "recoverPassword" -> {
          this.recoverPassword(request, response);
        }
        default -> {
        }
      }
    }
  }
}
