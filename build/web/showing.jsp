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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Showing</title>
    <script src="./tailwindcss/tailwindcss.js"></script>
    <script src="./tailwindcss/tailwindcss-with-forms.js"></script>
    <script src="./tailwindcss/tailwindcss-with-typography.js"></script>
    <script src="./tailwindcss/tailwindcss-with-aspect-ratio.js"></script>
    <script src="./tailwindcss/tailwindcss-with-line-clamp.js"></script>
    <script src="./tailwindcss/tailwindcss-with-all-plugins.js"></script>
  </head>

  <body>
    <!-- component header -->
    <jsp:include page="./Component/header.jsp">
      <jsp:param name="activeTab" value="showing"/>
    </jsp:include>

    <!--content-->
    <div class="bg-white py-16 px-16">
      <div class="container mx-auto px-4">
        <h2 class="text-3xl font-bold mb-8 text-gray-800">Showing Movies</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
          <div
            class="max-w-xs bg-white border border-gray-200 rounded-lg shadow">
            <a href="#">
              <img class="rounded-t-lg"
                   src="./assets/images/culaoxacsong.png"
                   alt="" />
            </a>
            <div class="p-5">
              <a href="#">
                <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900">Cù lao xác
                  sống</h5>
              </a>
              <p class="mb-3 font-normal text-gray-700">Phim hay lắm</p>
              <a href="./film.html"
                 class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300">
                Book
                <svg class="w-3.5 h-3.5 ml-2" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                     fill="none" viewBox="0 0 14 10">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                      stroke-width="2" d="M1 5h12m0 0L9 1m4 4L9 9" />
                </svg>
              </a>
            </div>
          </div>
          <div
            class="max-w-xs bg-white border border-gray-200 rounded-lg shadow">
            <a href="#">
              <img class="rounded-t-lg"
                   src="./assets/images/culaoxacsong.png"
                   alt="" />
            </a>
            <div class="p-5">
              <a href="#">
                <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900">Cù lao xác
                  sống</h5>
              </a>
              <p class="mb-3 font-normal text-gray-700">Phim hay lắm</p>
              <a href="./film.html"
                 class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300">
                Book
                <svg class="w-3.5 h-3.5 ml-2" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                     fill="none" viewBox="0 0 14 10">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                      stroke-width="2" d="M1 5h12m0 0L9 1m4 4L9 9" />
                </svg>
              </a>
            </div>
          </div>
          <div
            class="max-w-xs bg-white border border-gray-200 rounded-lg shadow">
            <a href="#">
              <img class="rounded-t-lg"
                   src="./assets/images/culaoxacsong.png"
                   alt="" />
            </a>
            <div class="p-5">
              <a href="#">
                <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900">Cù lao xác
                  sống</h5>
              </a>
              <p class="mb-3 font-normal text-gray-700">Phim hay lắm</p>
              <a href="./film.html"
                 class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300">
                Book
                <svg class="w-3.5 h-3.5 ml-2" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                     fill="none" viewBox="0 0 14 10">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                      stroke-width="2" d="M1 5h12m0 0L9 1m4 4L9 9" />
                </svg>
              </a>
            </div>
          </div>
          <div
            class="max-w-xs bg-white border border-gray-200 rounded-lg shadow">
            <a href="#">
              <img class="rounded-t-lg"
                   src="./assets/images/culaoxacsong.png"
                   alt="" />
            </a>
            <div class="p-5">
              <a href="#">
                <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900">Cù lao xác
                  sống</h5>
              </a>
              <p class="mb-3 font-normal text-gray-700">Phim hay lắm</p>
              <a href="./film.html"
                 class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300">
                Book
                <svg class="w-3.5 h-3.5 ml-2" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                     fill="none" viewBox="0 0 14 10">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                      stroke-width="2" d="M1 5h12m0 0L9 1m4 4L9 9" />
                </svg>
              </a>
            </div>
          </div>
          <div
            class="max-w-xs bg-white border border-gray-200 rounded-lg shadow">
            <a href="#">
              <img class="rounded-t-lg"
                   src="./assets/images/culaoxacsong.png"
                   alt="" />
            </a>
            <div class="p-5">
              <a href="#">
                <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900">Cù lao xác
                  sống</h5>
              </a>
              <p class="mb-3 font-normal text-gray-700">Phim hay lắm</p>
              <a href="./film.html"
                 class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300">
                Book
                <svg class="w-3.5 h-3.5 ml-2" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                     fill="none" viewBox="0 0 14 10">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                      stroke-width="2" d="M1 5h12m0 0L9 1m4 4L9 9" />
                </svg>
              </a>
            </div>
          </div>
          
          <c:forEach var="movie" items="${movies}">
            <div
            class="max-w-xs bg-white border border-gray-200 rounded-lg shadow">
            <a href="#">
              <img class="rounded-t-lg"
                   src="<%=root%>/assets/images/${movie.getImg()}"
                   alt="" />
            </a>
            <div class="p-5">
              <a href="#">
                <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900">${movie.getTitle()}</h5>
              </a>
              <p class="mb-3 font-normal text-gray-700">Phim hay lắm</p>
              <a href="<%=root%>/showing/film?movieID=${movie.getMovieID()}"
                 class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300">
                Book
                <svg class="w-3.5 h-3.5 ml-2" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                     fill="none" viewBox="0 0 14 10">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                      stroke-width="2" d="M1 5h12m0 0L9 1m4 4L9 9" />
                </svg>
              </a>
            </div>
          </div>
          </c:forEach>

        </div>

      </div>
    </div>

    <footer class="bg-gray-800 text-white py-8">
      <div class="container mx-auto px-4">
        <p>&copy; 2023 Cinema</p>
      </div>
    </footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.1.1/flowbite.min.js"></script>
  </div>
</body>

</html>