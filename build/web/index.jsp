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
    <title>Home</title>
    <script src="<%=root%>/tailwind/tailwind.js"></script>
</head>


    <!-- component header -->
    <jsp:include page="./Component/header.jsp">
      <jsp:param name="activeTab" value="home"/>
    </jsp:include>

    <!--content-->
    <div class="bg-gray-800 py-16">
        <div class="container mx-auto text-center text-white px-4">
            <h1 class="text-4xl md:text-6xl font-bold">Welcome to Cinema</h1>
            <p class="text-xl mt-4">Experience movies like never before.</p>
            <button class="py-2 px-6 bg-gray-100 text-gray-800 hover:bg-gray-200 rounded-md mt-8">Get Started</button>
        </div>
    </div>

    <section class="bg-white py-16 px-16">
        <div class="container mx-auto px-4">
            <h2 class="text-3xl font-bold mb-8 text-gray-800">Upcoming Movies</h2>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 gap-8">
              <c:forEach var="movie" items="${movies}">
                <div class="shadow-lg rounded-lg overflow-hidden">
                  <img src="<%=root%>/assets/images/${movie.getImg()}"
                         class="w-full" alt="Movie poster">
                    <div class="p-4">
                        <h3 class="text-xl font-bold mb-2">${movie.getTitle()}</h3>
                        
                    </div>
                </div>
              </c:forEach>
                <div class="shadow-lg rounded-lg overflow-hidden">
                    <img src="https://www.elleman.vn/wp-content/uploads/2021/12/20/208672/review-phim-spider-man-no-way-home-elle-man-cover-1.jpeg"
                         class="w-full" alt="Movie poster">
                    <div class="p-4">
                        <h3 class="text-xl font-bold mb-2">Spider Man: No way home</h3>
                        
                    </div>
                </div>
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