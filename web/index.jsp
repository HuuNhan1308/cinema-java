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
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home</title>
        <script src="<%=root%>/tailwind/tailwind.js"></script>
      </head>


      <!-- component header -->
      <jsp:include page="./Component/header.jsp">
        <jsp:param name="activeTab" value="home" />
      </jsp:include>

      <!--content-->
      <div class="pt-14 px-16 mx-auto">
        <div class="bg-gray-800 py-16 rounded-lg">
          <div class="container mx-auto text-center text-white px-4">
            <h1 class="text-4xl md:text-6xl font-bold">Welcome to Cinema</h1>
            <p class="text-xl mt-4">Experience movies like never before.</p>
            <div class="py-2 px-6 bg-gray-100 text-gray-800 hover:bg-gray-200 rounded-md mt-8 w-40 mx-auto">
              <a href="<%=root%>/showing">Get Started</a>
            </div>
          </div>
        </div>
      </div>

      <section class="bg-white py-16 px-16">
        <div id="animation-carousel" class="relative w-full" data-carousel="static">
          <!-- Carousel wrapper -->
          <div class="relative h-56 overflow-hidden rounded-lg md:h-96">
            <!-- Item 1 -->
            <div class="hidden duration-200 ease-linear" data-carousel-item>
              <img src="<%=root%>/assets/images/carousel1.png"
                   class="absolute block w-full -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2" alt="...">
            </div>
            <!-- Item 2 -->
            <div class="hidden duration-200 ease-linear" data-carousel-item>
              <img src="<%=root%>/assets/images/carousel2.png"
                   class="absolute block w-full -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2" alt="...">
            </div>
            <!-- Item 3 -->
            <div class="hidden duration-200 ease-linear" data-carousel-item="active">
              <img src="<%=root%>/assets/images/carousel3.png"
                   class="absolute block w-full -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2" alt="...">
            </div>
          </div>
          <!-- Slider indicators -->
          <div class="absolute z-30 flex -translate-x-1/2 space-x-3 rtl:space-x-reverse bottom-5 left-1/2">
            <button type="button" class="w-3 h-3 rounded-full" aria-current="true" aria-label="Slide 1"
                    data-carousel-slide-to="0"></button>
            <button type="button" class="w-3 h-3 rounded-full" aria-current="false" aria-label="Slide 2"
                    data-carousel-slide-to="1"></button>
            <button type="button" class="w-3 h-3 rounded-full" aria-current="false" aria-label="Slide 3"
                    data-carousel-slide-to="2"></button>
          </div>
          <!-- Slider controls -->
          <button type="button"
                  class="absolute top-0 start-0 z-30 flex items-center justify-center h-full px-4 cursor-pointer group focus:outline-none"
                  data-carousel-prev>
            <span
                  class="inline-flex items-center justify-center w-10 h-10 rounded-full bg-white/30 group-hover:bg-white/50 group-focus:ring-4 group-focus:ring-white group-focus:outline-none">
              <svg class="w-4 h-4 text-white" aria-hidden="true"
                   xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M5 1 1 5l4 4" />
              </svg>
              <span class="sr-only">Previous</span>
            </span>
          </button>
          <button type="button"
                  class="absolute top-0 end-0 z-30 flex items-center justify-center h-full px-4 cursor-pointer group focus:outline-none"
                  data-carousel-next>
            <span
                  class="inline-flex items-center justify-center w-10 h-10 rounded-full bg-white/30 group-hover:bg-white/50 group-focus:ring-4 group-focus:ring-white group-focus:outline-none">
              <svg class="w-4 h-4 text-white" aria-hidden="true"
                   xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="m1 9 4-4-4-4" />
              </svg>
              <span class="sr-only">Next</span>
            </span>
          </button>
        </div>
      </section>

      <section class="bg-white py-16 px-16">
        <div class="container mx-auto px-4">
          <h2 class="text-3xl font-bold mb-8 text-gray-800">Upcoming Movies</h2>
          <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
            <c:forEach var="movie" items="${movies}">
              <div class="shadow-lg rounded-lg overflow-hidden">
                <img src="<%=root%>/assets/images/${movie.getImg()}"
                     class="w-full" alt="Movie poster">
                <div class="p-4">
                  <h3 class="text-xl font-bold mb-2">${movie.getTitle()}</h3>
                </div>
              </div>
            </c:forEach>
          </div>
        </div>
      </section>

      <footer class="bg-gray-800 text-white py-8">
        <div class="container mx-auto px-4">
          <p>&copy; 2023 Cinema</p>
        </div>
      </footer>
      <script src="<%=root%>/tailwind/flowbite.min.js"></script>
      </div>
      </body>

      </html>