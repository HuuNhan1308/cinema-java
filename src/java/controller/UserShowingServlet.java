package controller;

import business.Movie;
import data.MovieDB;
import java.io.IOException;

import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UserShowingServlet", urlPatterns = { "/showing" })
public class UserShowingServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String url = "/showing.jsp";

    String movieName = request.getParameter("movieName");

    if (movieName != null) {
      List<Movie> movies = MovieDB.selectComingMoviesByName(movieName);
      request.setAttribute("movies", movies);      
      request.setAttribute("movieName", movieName);
      request.getRequestDispatcher(url).forward(request, response);
      return;
    }

    List<Movie> movies = MovieDB.selectComingMovies();

    request.setAttribute("movies", movies);

    request.getRequestDispatcher(url).forward(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

  }

}
