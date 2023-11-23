/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import business.SeatClass;
import data.SeatClassDB;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class AdminSeatClassServlet extends HttpServlet {

  protected void update(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // Navigate to edit movie page
    String url = "/admin/seatclass.jsp";
    String action = request.getParameter("action");
    int id = Integer.parseInt(request.getParameter("id"));

    SeatClass seatClass = SeatClassDB.selectSeatClass(id);

    request.setAttribute("action", action);
    request.setAttribute("seatClass", seatClass);

    request.getRequestDispatcher(url).forward(request, response);
  }

  protected void show(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "/admin/seatclass.jsp";

    List<SeatClass> seatClasses = SeatClassDB.selectSeatClasses();
    request.setAttribute("seatClasses", seatClasses);
    request.getRequestDispatcher(url).forward(request, response);
  }

  // Navigate to add movie page
  protected void add(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "/admin/seatclass.jsp";

    request.setAttribute("action", "add");
    request.getRequestDispatcher(url).forward(request, response);
  }

  // Handle add movie
  protected void addSeatClass(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // get value
    String category = request.getParameter("category");
    float factor = Float.parseFloat(request.getParameter("factor"));

    // creat obj
    SeatClass seatClass = new SeatClass();
    seatClass.setCategory(category);
    seatClass.setFactor(factor);

    // add to db
    SeatClassDB.insert(seatClass);

    // edirect to movies page
    String seatClassPage = request.getRequestURI();
    response.sendRedirect(seatClassPage);
  }

  // Handle update movie
  protected void updateSeatClass(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // handle logic
    int id = Integer.parseInt(request.getParameter("id"));
    String category = request.getParameter("category");
    float factor = Float.parseFloat(request.getParameter("factor"));

    // update seat class
    SeatClass seatClass = SeatClassDB.selectSeatClass(id);
    seatClass.setCategory(category);
    seatClass.setFactor(factor);

    // commit change
    SeatClassDB.update(seatClass);

    // edirect to movies page
    String seatClassPage = request.getRequestURI();
    response.sendRedirect(seatClassPage);
  }

  // Handle delete movie
  protected void deleteSeatClass(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // handle logic
    int id = Integer.parseInt(request.getParameter("seatClassID"));

    // del seat class
    SeatClass seatClass = SeatClassDB.selectSeatClass(id);
    SeatClassDB.delete(seatClass);

    // edirect to movies page
    String seatClassPage = request.getRequestURI();
    response.sendRedirect(seatClassPage);
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
          this.updateSeatClass(request, response);
        case "delete" ->
          this.deleteSeatClass(request, response);
        case "add" ->
          this.addSeatClass(request, response);
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
