package controller.ticket;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import business.Customer;
import business.Invoice;
import business.Ticket;
import data.CustomerDB;
import data.InvoiceDB;
import data.TicketDB;

@WebServlet(name = "UserRefundServlet", urlPatterns = { "/ticket/refund" })
public class UserRefundServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Customer customer = (Customer) request.getSession().getAttribute("customer");
        String InvoiceID = request.getParameter("InvoiceID");
        System.out.println(InvoiceID);
        Invoice invoice = InvoiceDB.selectInvoice(InvoiceID);

        // compare with current date
        Date showtimeDate = invoice.getTickets().get(0).getShowtime().getDate();

        // Get the current date
        java.time.LocalDate currentDate = java.time.LocalDate.now();

        System.out.println("Date: " + java.sql.Date.valueOf(currentDate));

        // Get the date two days from now
        java.time.LocalDate twoDaysFromNow = currentDate.plusDays(2);

        System.out.println("twoDaysFromNow: " + twoDaysFromNow);

        if (showtimeDate.before(java.sql.Date.valueOf(twoDaysFromNow))) {
            request.setAttribute("state", "fail");
            request.setAttribute("invoices", InvoiceDB.selectInvoices(customer.getCustomerId()));
            request.getRequestDispatcher("/ticket.jsp").forward(request, response);
            return;
        }

        List<Ticket> tickets = invoice.getTickets();

        int refundTotal = 0;

        for (Ticket ticket : tickets) {
            if (ticket.getSeatNumber() >= 31 && ticket.getSeatNumber() <= 60) {
                refundTotal += ticket.getShowtime().getPrice() * 1.2;
            } else {
                refundTotal += ticket.getShowtime().getPrice();
            }
        }

        InvoiceDB.delete(invoice);

        customer.setBalance(customer.getBalance() + refundTotal);
        CustomerDB.update(customer);

        request.setAttribute("state", "success");
        request.setAttribute("invoices", InvoiceDB.selectInvoices(customer.getCustomerId()));
        request.getRequestDispatcher("/ticket.jsp").forward(request, response);
    }

}
