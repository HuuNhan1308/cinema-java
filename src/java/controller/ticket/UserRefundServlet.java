package controller.ticket;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import business.Customer;
import business.Invoice;

import data.CustomerDB;
import data.InvoiceDB;

import java.time.LocalDate;

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
        Invoice invoice = InvoiceDB.selectInvoice(InvoiceID);

        // compare with current date
        Date showtimeDate = invoice.getTickets().get(0).getShowtime().getDate();

        // Get the date two days from now
        LocalDate twoDaysFromNow = LocalDate.now().plusDays(2);

        // cannot refund if exceed 2 days before
        if (showtimeDate.before(Date.valueOf(twoDaysFromNow))) {
            request.setAttribute("state", "fail");
            request.setAttribute("invoices", InvoiceDB.selectInvoices(customer.getCustomerId()));
            request.getRequestDispatcher("/ticket.jsp").forward(request, response);
            return;
        }

        double refundTotal = invoice.getTotalPrice();
        InvoiceDB.delete(invoice);

        customer.setBalance(customer.getBalance() + refundTotal);
        CustomerDB.update(customer);

        request.setAttribute("state", "success");
        request.setAttribute("invoices", InvoiceDB.selectInvoices(customer.getCustomerId()));
        request.getRequestDispatcher("/ticket.jsp").forward(request, response);
    }

}
