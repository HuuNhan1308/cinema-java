<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
  String root = request.getContextPath();

  // delete ".jsp"
  String URI = request.getRequestURI();
  URI = URI.substring(0, URI.length() - 4);
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <script src="https://cdn.tailwindcss.com"></script>
  </head>
  <body>
    <!-- component header -->
    <jsp:include page="./Component/header.jsp">
      <jsp:param name="activeTab" value=""/>
    </jsp:include>

    <!--content-->
    <div class="film-wrapper">
      <div class="bg-slate-700 text-white py-14">
        <div class="film-wrapper-content md:mx-64 mx:-32 flex gap-16">
          <div class="film-thumbnail border-2 border-white rounded-lg">
            <img
              src="<%=root%>/assets/images/${movie.getImg()}"
              alt="film-thumbnail"
              class="w-64 h-96 rounded-t-lg"
              />
            <div
              class="text-center bg-black text-white border-t-2 py-2 rounded-b-lg"
              >
              In cinemas
            </div>
          </div>
          <div
            class="film-detail flex flex-col items-center justify-center gap-4"
            >
            <h1 class="film-name xl:text-4xl text-2xl font-bold">
              ${movie.getTitle()}
            </h1>
            <div class="film-rating flex items-center justify-center gap-2">
              <svg
                class=""
                fill="#57c20f"
                width="32"
                height="32px"
                viewBox="0 0 32 32"
                version="1.1"
                xmlns="http://www.w3.org/2000/svg"
                >
              <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
              <g
                class=""
                id="SVGRepo_tracerCarrier"
                stroke-linecap="round"
                stroke-linejoin="round"
                ></g>
              <g id="SVGRepo_iconCarrier">
              <path
                d="M19.017 31.992c-9.088 0-9.158-0.377-10.284-1.224-0.597-0.449-1.723-0.76-5.838-1.028-0.298-0.020-0.583-0.134-0.773-0.365-0.087-0.107-2.143-3.105-2.143-7.907 0-4.732 1.472-6.89 1.534-6.99 0.182-0.293 0.503-0.47 0.847-0.47 3.378 0 8.062-4.313 11.21-11.841 0.544-1.302 0.657-2.159 2.657-2.159 1.137 0 2.413 0.815 3.042 1.86 1.291 2.135 0.636 6.721 0.029 9.171 2.063-0.017 5.796-0.045 7.572-0.045 2.471 0 4.107 1.473 4.156 3.627 0.017 0.711-0.077 1.619-0.282 2.089 0.544 0.543 1.245 1.36 1.276 2.414 0.038 1.36-0.852 2.395-1.421 2.989 0.131 0.395 0.391 0.92 0.366 1.547-0.063 1.542-1.253 2.535-1.994 3.054 0.061 0.422 0.11 1.218-0.026 1.834-0.535 2.457-4.137 3.443-9.928 3.443zM3.426 27.712c3.584 0.297 5.5 0.698 6.51 1.459 0.782 0.589 0.662 0.822 9.081 0.822 2.568 0 7.59-0.107 7.976-1.87 0.153-0.705-0.59-1.398-0.593-1.403-0.203-0.501 0.023-1.089 0.518-1.305 0.008-0.004 2.005-0.719 2.050-1.835 0.030-0.713-0.46-1.142-0.471-1.16-0.291-0.452-0.185-1.072 0.257-1.38 0.005-0.004 1.299-0.788 1.267-1.857-0.024-0.849-1.143-1.447-1.177-1.466-0.25-0.143-0.432-0.39-0.489-0.674-0.056-0.282 0.007-0.579 0.183-0.808 0 0 0.509-0.808 0.49-1.566-0.037-1.623-1.782-1.674-2.156-1.674-2.523 0-9.001 0.025-9.001 0.025-0.349 0.002-0.652-0.164-0.84-0.443s-0.201-0.627-0.092-0.944c0.977-2.813 1.523-7.228 0.616-8.736-0.267-0.445-0.328-0.889-1.328-0.889-0.139 0-0.468 0.11-0.812 0.929-3.341 7.995-8.332 12.62-12.421 13.037-0.353 0.804-1.016 2.47-1.016 5.493 0 3.085 0.977 5.473 1.447 6.245z"
                ></path>
              </g>
              </svg>
              <h2 class="xl:font-bold font-medium">22.5K</h2>
              <div class="xl:font-bold font-medium">are interested</div>
            </div>
            <div class="film-duration xl:text-lg xl:font-bold font-medium">
              Duration: ${movie.getDuration()}
            </div>
            <div class="film-genres xl:text-lg xl:font-bold font-medium">
              Genre: ${movie.getGenre()}
            </div>
            <a
              href="<%=root%>/showing/film/seat?movieID=${movie.getMovieID()}"
              class="book-tickets xl:py-3 xl:px-8 bg-red-600 uppercase xl:font-bold py-2 px-4 font-medium my-5 rounded shadow-lg hover:shadow-white hover:cursor-pointer"
              >
              book tickets
            </a>
          </div>
        </div>
      </div>
      <div id="show-time-movie" class="xl:mx-64 mx-32 mt-7">
        <div class="show-time-detail">
          <h1 class="xl:text-3xl text-2xl font-bold mb-3">
            Showtime ${movie.getTitle()}
          </h1>
          <div class="border-2 rounded p-3 flex flex-col gap-4">
            <div
              class="show-days show-rooms grid grid-cols-7 text-center gap-4"
              >
              <input
                type="radio"
                id="day1"
                name="group-day"
                class="day-btn hidden"
                />
              <label
                for="day1"
                class="border-2 rounded xl:p-3 cursor-pointer xl:font-bold font-semmibold"
                >
                Monday <br />
                (11-10-2023)
              </label>
              <input
                type="radio"
                id="day2"
                name="group-day"
                class="day-btn hidden"
                />
              <label
                for="day2"
                class="border-2 rounded xl:p-3 cursor-pointer xl:font-bold font-semmibold"
                >
                Tuesday <br />(11-10-2023)
              </label>
              <input
                type="radio"
                id="day3"
                name="group-day"
                class="day-btn hidden"
                />
              <label
                for="day3"
                class="border-2 rounded xl:p-3 cursor-pointer xl:font-bold font-semmibold"
                >
                Wednesday <br />
                (11-10-2023)
              </label>
              <input
                type="radio"
                id="day4"
                name="group-day"
                class="day-btn hidden"
                />
              <label
                for="day4"
                class="border-2 rounded xl:p-3 cursor-pointer xl:font-bold font-semmibold"
                >
                Thursday <br />(11-10-2023)
              </label>
              <input
                type="radio"
                id="day5"
                name="group-day"
                class="day-btn hidden"
                />
              <label
                for="day5"
                class="border-2 rounded xl:p-3 cursor-pointer xl:font-bold font-semmibold"
                >
                Friday <br />(11-10-2023)
              </label>
              <input
                type="radio"
                id="day6"
                name="group-day"
                class="day-btn hidden"
                />
              <label
                for="day6"
                class="border-2 rounded xl:p-3 cursor-pointer xl:font-bold font-semmibold"
                >
                Saturday <br />(11-10-2023)
              </label>
              <input
                type="radio"
                id="day7"
                name="group-day"
                class="day-btn hidden"
                />
              <label
                for="day7"
                class="border-2 rounded xl:p-3 cursor-pointer xl:font-bold font-semmibold"
                >
                Sunday<br />(11-10-2023)
              </label>
            </div>
            <div class="show-times flex flex-col">
              <div class="text-xl font-bold mb-3">2D</div>
              <div class="grid grid-cols-5 text-center gap-2">
                <input
                  type="radio"
                  id="time1"
                  name="group-time"
                  class="time-btn hidden"
                  />
                <label
                  for="time1"
                  class="border-2 rounded py-3 cursor-pointer font-bold"
                  >
                  <span class="text-xl"> 13:10 </span> ~ 15:22
                </label>

                <input
                  type="radio"
                  id="time2"
                  name="group-time"
                  class="time-btn hidden"
                  />
                <label
                  for="time2"
                  class="border-2 rounded py-3 cursor-pointer font-bold"
                  >
                  <span class="text-xl"> 13:10 </span> ~ 15:22
                </label>

                <input
                  type="radio"
                  id="time3"
                  name="group-time"
                  class="time-btn hidden"
                  />
                <label
                  for="time3"
                  class="border-2 rounded py-3 cursor-pointer font-bold"
                  >
                  <span class="text-xl"> 13:10 </span> ~ 15:22
                </label>

                <input
                  type="radio"
                  id="time4"
                  name="group-time"
                  class="time-btn hidden"
                  />
                <label
                  for="time4"
                  class="border-2 rounded py-3 cursor-pointer font-bold"
                  >
                  <span class="text-xl"> 13:10 </span> ~ 15:22
                </label>

                <input
                  type="radio"
                  id="time5"
                  name="group-time"
                  class="time-btn hidden"
                  />
                <label
                  for="time5"
                  class="border-2 rounded py-3 cursor-pointer font-bold"
                  >
                  <span class="text-xl"> 13:10 </span> ~ 15:22
                </label>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>


  </body>
</html>
