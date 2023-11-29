package controller.showing;

import business.Movie;
import business.ShowTime;

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

@WebServlet(name = "UserFilmServlet", urlPatterns = { "/showing/film" })
public class UserFilmServlet extends HttpServlet {

  protected void show(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "/film.jsp";

    String movieID = request.getParameter("movieID");

    Movie movie = MovieDB.selectMovie(movieID);

    List<Date> comingDates = ShowTimeDB.selectComingDate_byMovieId(movieID);
    List<ShowTime> comingShowTimes = ShowTimeDB.selectComingShowTime_ByMovieID(movieID);

    request.setAttribute("movie", movie);
    request.setAttribute("comingDates", comingDates);
    request.setAttribute("comingShowTimes", comingShowTimes);

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
