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
      <jsp:param name="activeTab" value="ticket"/>
    </jsp:include>

    <!--content-->
    <div
      class="tickets-wrapper 2xl:mx-64 2xl:py-14 grid xl:grid-cols-2 xl:gap-10 xl:mx-32 xl:py-7 md:rid-flow-cols md:gap-4"
    >
      <div class="tickets-detail relative">
        <img
          class="md:w-fit md:h-fit"
          src="assets/images/ticket.jpg"
          alt="tickets"
        />
        <h1
          class="absolute 2xl:-mt-[170px] 2xl:ml-52 2xl:font-bold 2xl:text-3xl xl:-mt-[150px] xl:ml-[190px] lg:-mt-[165px] lg:ml-[203px] lg:font-medium lg:text-xl md:-mt-[150px]"
        >
          Black Panther
        </h1>
        <h2
          class="absolute 2xl:-mt-[125px] 2xl:ml-64 2xl:text-lg 2xl:font-bold xl:-mt-[113px] xl:font-medium xl:text-sm xl:ml-[230px]"
        >
          Dec 22, 2023
        </h2>
        <h2
          class="absolute 2xl:-mt-[94px] 2xl:ml-64 2xl:pt-1 2xl:font-bold xl:-mt-[83px] xl:ml-[230px] xl:text-sm xl:font-medium"
        >
          D5
        </h2>
        <h2
          class="absolute 2xl:-mt-[94px] 2xl:ml-[345px] 2xl:pt-1 2xl:font-bold xl:-mt-[83px] xl:ml-[320px] xl:text-sm xl:font-medium"
        >
          $80.000
        </h2>
        <h2
          class="absolute rotate-90 2xl:-mt-[148px] 2xl:ml-[558px] 2xl:font-bold 2xl:text-lg xl:-mt-[135px] xl:ml-[520px] xl:text-sm"
        >
          1s3d254s2t5ug6s
        </h2>
      </div>
      <div class="tickets-detail relative">
        <img class="w-fit h-fit" src="assets/images/ticket.jpg" alt="tickets" />
        <h1
          class="absolute 2xl:-mt-[170px] 2xl:ml-52 2xl:font-bold 2xl:text-3xl xl:-mt-[110px] xl:ml-[130px] lg:-mt-[165px] lg:ml-[203px] lg:font-medium lg:text-xl md:-mt-[150px]"
        >
          Black Panther
        </h1>
        <h2
          class="absolute 2xl:-mt-[125px] 2xl:ml-64 2xl:text-lg 2xl:font-bold xl:-mt-[82px] xl:font-medium xl:text-sm xl:ml-[162px]"
        >
          Dec 22, 2023
        </h2>
        <h2
          class="absolute 2xl:-mt-[94px] 2xl:ml-64 2xl:pt-1 2xl:font-bold xl:-mt-[60px] xl:ml-[160px] xl:text-sm xl:font-medium"
        >
          D5
        </h2>
        <h2
          class="absolute 2xl:-mt-[94px] 2xl:ml-[345px] 2xl:pt-1 2xl:font-bold xl:-mt-[60px] xl:ml-[225px] xl:text-sm xl:font-medium"
        >
          $80.000
        </h2>
        <h2
          class="absolute rotate-90 2xl:-mt-[148px] 2xl:ml-[558px] 2xl:font-bold 2xl:text-lg xl:-mt-[95px] xl:ml-[355px] xl:text-sm"
        >
          1s3d254s2t5ug6s
        </h2>
      </div>

      <div class="tickets-detail relative">
        <img class="w-fit h-fit" src="assets/images/ticket.jpg" alt="tickets" />
        <h1
          class="absolute 2xl:-mt-[170px] 2xl:ml-52 2xl:font-bold 2xl:text-3xl xl:-mt-[110px] xl:ml-[130px] lg:-mt-[165px] lg:ml-[203px] lg:font-medium lg:text-xl md:-mt-[150px]"
        >
          Black Panther
        </h1>
        <h2
          class="absolute 2xl:-mt-[125px] 2xl:ml-64 2xl:text-lg 2xl:font-bold xl:-mt-[82px] xl:font-medium xl:text-sm xl:ml-[162px]"
        >
          Dec 22, 2023
        </h2>
        <h2
          class="absolute 2xl:-mt-[94px] 2xl:ml-64 2xl:pt-1 2xl:font-bold xl:-mt-[60px] xl:ml-[160px] xl:text-sm xl:font-medium"
        >
          D5
        </h2>
        <h2
          class="absolute 2xl:-mt-[94px] 2xl:ml-[345px] 2xl:pt-1 2xl:font-bold xl:-mt-[60px] xl:ml-[225px] xl:text-sm xl:font-medium"
        >
          $80.000
        </h2>
        <h2
          class="absolute rotate-90 2xl:-mt-[148px] 2xl:ml-[558px] 2xl:font-bold 2xl:text-lg xl:-mt-[95px] xl:ml-[355px] xl:text-sm"
        >
          1s3d254s2t5ug6s
        </h2>
      </div>
      <div class="tickets-detail relative">
        <img class="w-fit h-fit" src="assets/images/ticket.jpg" alt="tickets" />
        <h1
          class="absolute 2xl:-mt-[170px] 2xl:ml-52 2xl:font-bold 2xl:text-3xl xl:-mt-[110px] xl:ml-[130px] lg:-mt-[165px] lg:ml-[203px] lg:font-medium lg:text-xl md:-mt-[150px]"
        >
          Black Panther
        </h1>
        <h2
          class="absolute 2xl:-mt-[125px] 2xl:ml-64 2xl:text-lg 2xl:font-bold xl:-mt-[82px] xl:font-medium xl:text-sm xl:ml-[162px]"
        >
          Dec 22, 2023
        </h2>
        <h2
          class="absolute 2xl:-mt-[94px] 2xl:ml-64 2xl:pt-1 2xl:font-bold xl:-mt-[60px] xl:ml-[160px] xl:text-sm xl:font-medium"
        >
          D5
        </h2>
        <h2
          class="absolute 2xl:-mt-[94px] 2xl:ml-[345px] 2xl:pt-1 2xl:font-bold xl:-mt-[60px] xl:ml-[225px] xl:text-sm xl:font-medium"
        >
          $80.000
        </h2>
        <h2
          class="absolute rotate-90 2xl:-mt-[148px] 2xl:ml-[558px] 2xl:font-bold 2xl:text-lg xl:-mt-[95px] xl:ml-[355px] xl:text-sm"
        >
          1s3d254s2t5ug6s
        </h2>
      </div>
    </div>
    <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>
  </body>
</html>
