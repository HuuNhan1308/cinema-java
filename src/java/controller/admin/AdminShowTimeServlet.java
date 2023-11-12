/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import business.Movie;
import business.Room;
import business.ShowTime;
import data.MovieDB;
import data.RoomDB;
import data.ShowTimeDB;
import java.io.IOException;

import java.util.List;
import java.sql.Time;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class AdminShowTimeServlet extends HttpServlet {

  protected void update(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
//    Navigate to edit movie page
    String url = "/admin/showtimes.jsp";
    String action = request.getParameter("action");

    request.setAttribute("action", action);
    request.getRequestDispatcher(url).forward(request, response);
  }

  protected void show(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    String url = "/admin/showtimes.jsp";

    List<ShowTime> showTimes = ShowTimeDB.selectShowTimes();
    request.setAttribute("showTimes", showTimes);
    request.getRequestDispatcher(url).forward(request, response);
  }

  // Navigate to add movie page
  protected void add(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    String url = "/admin/showtimes.jsp";

    //get value to choose room and movie
    List<Movie> movies = MovieDB.selectMovies();
    request.setAttribute("movies", movies);
    List<Room> rooms = RoomDB.selectRooms();
    request.setAttribute("rooms", rooms);

    request.setAttribute("action", "add");
    request.getRequestDispatcher(url).forward(request, response);
  }

  //Handle add movie
  protected void addShowTime(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    //get value
    String movieID = request.getParameter("movieID");
    int roomNumber = Integer.parseInt(request.getParameter("roomNumber"));
    Date date = Date.valueOf(request.getParameter("date"));
    Time time = Time.valueOf(request.getParameter("time") + ":00");
    int price = Integer.parseInt(request.getParameter("price"));
    
    // set value
    ShowTime showTime = new ShowTime();
    showTime.setPrice(price);
    showTime.setDate(date);
    showTime.setStartTime(time);

    Movie movie = MovieDB.selectMovie(movieID);
    showTime.setMovie(movie);

    Room room = RoomDB.selectRoom(roomNumber);
    List<Room> rooms = List.of(room);
    showTime.setRooms(rooms);

    ShowTimeDB.insert(showTime);
    //edirect to movies page
    String seatClassPage = request.getRequestURI();
    response.sendRedirect(seatClassPage);
  }

  //Handle update movie
  protected void updateShowTime(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {

    //edirect to movies page
    String seatClassPage = request.getRequestURI();
    response.sendRedirect(seatClassPage);
  }

  //Handle delete movie
  protected void deleteShowTime(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    String showTimeID = request.getParameter("showTimeID");
    int roomNumber = Integer.parseInt(request.getParameter("roomNumber"));
    
    //handle delete showtime and room specifically
    ShowTime showTime = ShowTimeDB.selectShowTime(showTimeID);
    Room room = RoomDB.selectRoom(roomNumber);

    ShowTimeDB.delete(showTime);
    //redirect to movies page
    String showTimePage = request.getRequestURI();
    response.sendRedirect(showTimePage);
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {

    String action = request.getParameter("action");
    if (null == action) {
      this.show(request, response);
    } else {
      switch (action) {
        case "update" ->
          this.update(request, response);
        case "add" ->
          this.add(request, response);
        default -> {
        }
      }
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    String action = request.getParameter("action");

    if (null != action) {
      switch (action) {
        case "update" ->
          this.updateShowTime(request, response);
        case "delete" ->
          this.deleteShowTime(request, response);
        case "add" ->
          this.addShowTime(request, response);
        default -> {
        }
      }
    }
  }

  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}
