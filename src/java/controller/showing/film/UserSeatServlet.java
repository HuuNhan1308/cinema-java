/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.showing.film;

import business.Customer;
import business.Invoice;
import business.SeatClass;
import business.ShowTime;
import business.Ticket;
import data.SeatClassDB;
import data.CustomerDB;
import data.InvoiceDB;
import data.ShowTimeSeatDB;
import data.ShowTimeDB;
import data.TicketDB;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UserSeatServlet", urlPatterns = { "/showing/film/seat" })
public class UserSeatServlet extends HttpServlet {

  protected void bookingSeats(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "/seat.jsp";

    // Get seats
    String[] seatNumbersArray = request.getParameter("seatNumbers").split(",");
    int[] seatNumbersInt = Arrays.stream(seatNumbersArray).mapToInt(Integer::parseInt).toArray();

    // Get customer
    HttpSession session = request.getSession();
    final Object lock = request.getSession().getId().intern();
    Customer customer;
    synchronized (lock) {
      customer = (Customer) session.getAttribute("customer");
    }

    // Not exist customer --> login
    if (customer == null) {
      response.sendRedirect(request.getContextPath() + "/login");
      return;
    }

    // Get showtime
    String showtimeId = request.getParameter("showtimeId");
    ShowTime showtime = ShowTimeDB.selectShowTime(showtimeId);

    // Create invoice
    Invoice invoice = new Invoice();
    invoice.setCustomer(customer);
    invoice.setBoughDate(Date.valueOf(LocalDate.now()));
    invoice.setTickets(new ArrayList<Ticket>());

    // Create ticket and add to the new invoice
    for (int seatNumber : seatNumbersInt) {
      Ticket ticket = new Ticket();
      ticket.setInvoice(invoice);
      ticket.setSeatNumber(seatNumber);
      ticket.setShowtime(showtime);

      // Determine seat class based on seat number
      int seatClassId = (seatNumber >= 31 && seatNumber <= 60) ? 3 : 2;
      SeatClass seatClass = SeatClassDB.selectSeatClass(seatClassId);
      ticket.setSeatClass(seatClass);

      invoice.getTickets().add(ticket);
    }

    List<Ticket> tickets = invoice.getTickets();

    // Insert tickets
    // Update the invoice with the tickets

    // Check if customer has enough balance
    try {
      // Check if customer has enough balance
      int total = invoice.getTotalPrice();
      if (customer.getBalance() >= total) {
        double newBalance = customer.getBalance() - total;
        customer.setBalance(newBalance);
        CustomerDB.update(customer);

        // add tickets to invoice
        invoice.setTickets(tickets);
        InvoiceDB.insert(invoice);

        // add ticket to movie
        List<Ticket> showtimeTicket = showtime.getTickets();
        showtimeTicket.addAll(tickets);
        showtime.setTickets(showtimeTicket);
        ShowTimeDB.update(showtime);

        session.setAttribute("state", "book_success");

        // Forward to the same page
      } else {
        tickets = null; // remove tickets
        invoice = null; // remove invoice
        session.setAttribute("state", "book_fail");
      }

      response.sendRedirect(request.getHeader("Referer"));

    } catch (Exception e) {
      // Log the exception
      e.printStackTrace();

      session.setAttribute("state", "book_fail");
      // Redirect to home page
      response.sendRedirect(request.getHeader("Referer"));
    }

  }

  protected void show(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "/seat.jsp";
    String showtimeId = request.getParameter("showtimeId");
    ShowTime showtime = ShowTimeDB.selectShowTime(showtimeId);

    if (showtime == null) {
      response.sendRedirect(request.getContextPath() + "/showing");
      return;
    }

    List<Ticket> chosenSeats = showtime.getTickets();

    System.out.println(chosenSeats.size());
    System.out.println(showtime);

    request.setAttribute("showtime", showtime);
    request.setAttribute("chosenSeats", chosenSeats);
    request.getRequestDispatcher(url).forward(request, response);
  }

  @Override
  @SuppressWarnings("empty-statement")
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    this.show(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String action = request.getParameter("action");
    if ("bookingSeats".equals(action)) {
      this.bookingSeats(request, response);
    }

  }

}
