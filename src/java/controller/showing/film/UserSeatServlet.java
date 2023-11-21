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
import java.util.Date;
import java.util.UUID;
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
        Customer customer = (Customer) session.getAttribute("customer");
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
        invoice.setBoughDate(java.sql.Date.valueOf(java.time.LocalDate.now()));

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

        // Persist the invoice first
        InvoiceDB.insert(invoice);

        // // Create tickets
        // List<Ticket> tickets = new ArrayList<>();
        // for (int seatNumber : seatNumbersInt) {
        // String ticketId = UUID.randomUUID().toString();
        // Ticket ticket = new Ticket();
        // ticket.setTicketID(ticketId);
        // ticket.setSeatNumber(seatNumber);
        // ticket.setInvoice(invoice);
        // ticket.setShowtime(ShowTimeDB.selectShowTime(showtimeId));
        //
        // // Determine seat class based on seat number
        // int seatClassId = (seatNumber >= 31 && seatNumber <= 60) ? 3 : 2;
        // SeatClass seatClass = SeatClassDB.selectSeatClass(seatClassId);
        // ticket.setSeatClass(seatClass);
        //
        // tickets.add(ticket);
        // }

        List<Ticket> tickets = invoice.getTickets();

        // Insert tickets
        // Update the invoice with the tickets
        // Calculate total cost
        double total = 0;
        for (Ticket ticket : tickets) {
            SeatClass seatClass = ShowTimeSeatDB.getSeatClass(ticket.getSeatClass().getId());
            total += ticket.getShowtime().getPrice() * seatClass.getFactor();
        }

        // Check if customer has enough balance
        try {
            // Check if customer has enough balance
            if (customer.getBalance() >= total) {
                double newBalance = customer.getBalance() - total;
                CustomerDB.updateBalance(customer, newBalance);
                for (Ticket ticket : tickets) {
                    TicketDB.insert(ticket);
                }
                invoice.setTickets(tickets);
                InvoiceDB.update(invoice);
                session.setAttribute("state", "book_success");
            } else {
                tickets.clear();
                InvoiceDB.delete(invoice);
                session.setAttribute("state", "book_fail");
            }
        } catch (Exception e) {
            // Log the exception
            e.printStackTrace();

            // Redirect to home page
            response.sendRedirect(request.getHeader("Referer"));
            session.setAttribute("state", "book_fail");
        }

        // Forward to the same page
        response.sendRedirect(request.getHeader("Referer"));

    }

    @Override
    @SuppressWarnings("empty-statement")
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "/seat.jsp";
        String showtimeId = request.getParameter("showtimeId");

        if (showtimeId != null && !showtimeId.isEmpty()) {
            ShowTime showtime = ShowTimeDB.selectShowTime(showtimeId);
            List<Ticket> chosenSeats = showtime.getTickets();

            if (showtime != null) {
                request.setAttribute("showtime", showtime);
                request.setAttribute("chosenSeats", chosenSeats);

                System.out.println(chosenSeats.get(3).getSeatNumber());
                request.getRequestDispatcher(url).forward(request, response);
            } else {
                System.out.println("Error retrieving chosenSeats or showtime from database.");
            }
        } else {
            System.out.println("showtimeId is not set correctly.");
        }
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
