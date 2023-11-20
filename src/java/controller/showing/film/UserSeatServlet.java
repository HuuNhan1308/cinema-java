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

        // get seats
        String seatNumbers = request.getParameter("seatNumbers");
        String[] seatNumbersArray = seatNumbers.split(",");
        int[] seatNumbersInt = new int[seatNumbersArray.length];
        for (int i = 0; i < seatNumbersArray.length; i++) {
            seatNumbersInt[i] = Integer.parseInt(seatNumbersArray[i]);

        }

        // get customer
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        // get tickets

        List<Ticket> tickets = new ArrayList<Ticket>();
        String showtimeId = request.getParameter("showtimeId");

        // create invoice
        String invoiceId = UUID.randomUUID().toString();
        Invoice invoice = new Invoice();
        invoice.setCustomer(customer);
        Date date = java.sql.Date.valueOf(java.time.LocalDate.now());
        invoice.setBoughDate((java.sql.Date) date);
        invoice.setInvoiceID(invoiceId);

        // persist the invoice first
        InvoiceDB.insert(invoice);

        for (int i = 0; i < seatNumbersInt.length; i++) {
            String ticketId = UUID.randomUUID().toString();
            Ticket ticket = new Ticket();
            ticket.setTicketID(ticketId);
            ticket.setSeatNumber(seatNumbersInt[i]);
            ticket.setInvoice(invoice);
            ticket.setShowtime(ShowTimeDB.selectShowTime(showtimeId));
            SeatClass seatClass;
            if (seatNumbersInt[i] >= 31 && seatNumbersInt[i] <= 60) {
                seatClass = SeatClassDB.selectSeatClass(3);
            } else {
                seatClass = SeatClassDB.selectSeatClass(2);
            }
            ticket.setSeatClass(seatClass);
            tickets.add(ticket);
        }

        for (Ticket ticket : tickets) {
            TicketDB.insert(ticket);
        }

        // update the invoice with the tickets
        invoice.setTickets(tickets);
        InvoiceDB.update(invoice);

        // check condition tickets and balance
        double total = 0;
        SeatClass seatClass;
        List<Ticket> chosenSeats = ShowTimeSeatDB.getSeatsOfShowTime(showtimeId);

        for (Ticket ticket : tickets) {
            seatClass = ShowTimeSeatDB.getSeatClass(ticket.getSeatClass().getId());
            total += ticket.getShowtime().getPrice() * seatClass.getFactor();
        }

        if (customer.getBalance() >= total) {
            InvoiceDB.insert(invoice);
            double newBalance = customer.getBalance() - total;
            CustomerDB.updateBalance(customer, newBalance);
            if (tickets != chosenSeats) {
                for (Ticket ticket : tickets) {
                    TicketDB.insert(ticket);
                }
            }

        } else {
            tickets.clear();
        }

        // get customer
        // Check if customer is not null before redirecting
        if (customer != null) {
            request.getRequestDispatcher(url).forward(request, response);
        } else {
            response.sendRedirect(request.getRequestURI());
        }
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
