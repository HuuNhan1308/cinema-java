<%@ page import="java.time.format.TextStyle" %>
  <%@ page import="java.util.Locale" %>
    <%@ page import="java.sql.Date" %>


      <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
          <%
             String root=request.getContextPath();

             // delete ".jsp"
             String URI=request.getRequestURI();
             URI=URI.substring(0, URI.length() - 4);

             %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
              <meta charset="UTF-8" />
              <meta name="viewport" content="width=device-width, initial-scale=1.0" />
              <title>${movie.getTitle()}</title>
              <script src="<%=root%>/tailwind/tailwind.js"></script>
            </head>

            <body>
              <!-- component header -->
              <jsp:include page="./Component/header.jsp">
                <jsp:param name="activeTab" value="" />
              </jsp:include>

              <!--content-->
              <div class="film-wrapper pb-[60px]">

                <!--Show movie-->
                <div class="text-white py-14 bg-gradient-to-r from-gray-800 via-black-500 to-gray-500">
                  <div class="film-wrapper-content md:mx-64 mx:-32 flex gap-16">
                    <div class="film-thumbnail border-2 border-white rounded-lg min-w-[300px]">
                      <img
                           src="<%=root%>/assets/images/${movie.getImg()}"
                           alt="film-thumbnail"
                           class="w-96 h-96 rounded-t-lg" />
                      <div
                           class="text-center bg-black text-white border-t-2 py-2 rounded-b-lg">
                        Showing
                      </div>
                    </div>
                    <div class="film-detail flex flex-col items-start justify-center gap-4">
                      <h1 class="film-name xl:text-4xl text-2xl font-bold font-extrabold text-transparent bg-clip-text bg-gradient-to-r from-white to-gray-400">
                        ${movie.getTitle()}
                      </h1>
                      <div class="film-duration xl:text-lg xl:font-semmibold font-medium">
                        ${movie.getDuration()}
                      </div>
                      <div class="film-genres xl:text-lg xl:font-semmibold font-medium">
                        ${movie.getGenre()}
                      </div>
                      <div class="film-director xl:text-lg xl:font-semmibold font-medium">
                        Director: ${movie.getDirector()}, Main Actor: ${movie.getMainActor()}
                      </div>
                      <div class="film-mainactor xl:text-lg xl:font-normal font-normal">
                        ${movie.getDescription()}
                      </div>
                    </div>
                  </div>
                </div>

                <!--Showtime-->
                <div id="show-time-movie" class="xl:mx-64 mx-32 mt-7">
                  <div class="show-time-detail">
                    <h1 class="xl:text-3xl text-2xl font-bold mb-3">
                      Showtime ${movie.getTitle()}
                    </h1>

                    <div class="border-2 rounded p-3 flex flex-col gap-4">
                      <!--Choose date-->
                      <div class="show-days show-rooms grid grid-cols-7 text-center gap-4">

                        <c:forEach var="comingDate" items="${comingDates}">
                          <c:set var="dayOfWeek"
                                 value="${comingDate.toLocalDate().getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.getDefault())}" />

                          <div>
                            <input 
                              type="radio" 
                              id="${dayOfWeek}" 
                              name="dayOfWeek" 
                              value="${comingDate}"     
                              class="hidden peer">
                              
                            <label for="${dayOfWeek}" class="inline-flex items-center justify-between w-full p-3 xl:font-bold font-semmibold
                              border-2 border-gray-200 rounded cursor-pointer peer-checked:border-blue-600 peer-checked:text-blue-600
                              hover:text-gray-700 hover:bg-gray-100">
                              <div class="block">
                                ${dayOfWeek} <br />
                                (${comingDate})
                              </div>
                            </label>
                          </div>
                        </c:forEach>
                      </div>

                      <!--Choose Time-->
                      <div id="showtime_times" class="hidden">
                        <div class="text-xl font-bold mb-3">2D</div>
                        <div class="grid grid-cols-5 text-center gap-2">
                          <c:forEach var="comingShowTime" items="${comingShowTimes}" varStatus="loop">
                            <div>
                              <input
                                     type="radio"
                                     id="time_${loop.index + 1}"
                                     name="time"
                                     value="${comingShowTime.getStartTime()}"
                                     -data-day-of-week="${comingShowTime.getDayOfWeek()}"
                                     class="hidden peer" />
                              <a
                                for="time_${loop.index + 1}"
                                href="<%=root%>/showing/film/seat?showtimeId=${comingShowTime.getShowtimeId()}"
                                class="block border-2 rounded py-3 cursor-pointer font-bold peer-checked:border-blue-600
                                peer-checked:text-blue-600 hover:text-gray-700 hover:bg-gray-100">
                                <span class="text-xl"> ${comingShowTime.getStartTime_ToMinute()} </span> ~
                                ${comingShowTime.getEndTime_ToMinute()}
                              </a>
                            </div>
                          </c:forEach>

                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <script src="<%=root%>/tailwind/flowbite.min.js"></script>

              <script>
                const dateInputs = [...document.querySelectorAll("[name='dayOfWeek']")];
                const timeInputs = [...document.querySelectorAll("[name='time']")];
                const showtime_times = document.getElementById("showtime_times");
                let dayOfWeek_atDateInput, dayOfWeek_atTimeInput;

                dateInputs.forEach((dateInput) => {
                  dateInput.addEventListener("click", (e) => {
                    dayOfWeek_atDateInput = e.target.getAttribute("id");

                    // set display of showtime_times to block
                    showtime_times.classList.remove("hidden");
                    showtime_times.classList.add('show-times','flex', 'flex-col');

                    // show times by day of week hide times not in day of week
                    timeInputs.forEach((timeInput) => {
                      dayOfWeek_atTimeInput = timeInput.getAttribute("-data-day-of-week");

                      if (dayOfWeek_atDateInput === dayOfWeek_atTimeInput)
                        timeInput.parentElement.style.display = "block";
                      else
                        timeInput.parentElement.style.display = "none";
                    });
                  });
                });
              </script>

            </body>

            </html>