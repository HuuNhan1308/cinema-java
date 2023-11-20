/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.showing;

import business.Customer;
import business.Movie;
import business.ShowTime;
import data.CustomerDB;
import data.MovieDB;
import data.ShowTimeDB;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.time.format.TextStyle;
import java.util.Locale;
import javax.servlet.http.Cookie;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UserFilmServlet", urlPatterns = {"/showing/film"})
public class UserFilmServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = "/film.jsp";

        String movieID = request.getParameter("movieID");

        Movie movie = MovieDB.selectMovie(movieID);

        List<Date> comingDates = ShowTimeDB.selectComingDate_byMovieId(movieID);
        List<ShowTime> comingShowTimes = ShowTimeDB.selectComingShowTime_ByMovieID(movieID);

        request.setAttribute("movie", movie);
        request.setAttribute("comingDates", comingDates);
        request.setAttribute("comingShowTimes", comingShowTimes);

        Customer customer = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("customerId")) {
                    customer = CustomerDB.selectCustomer_byId(cookie.getValue());
                }
            }
        }
        request.setAttribute("cusomer", customer);
//        if (customerId == null) {
//            url = "/login.jsp";
////            request.getRequestDispatcher(url).forward(request, response);
//        }

        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
