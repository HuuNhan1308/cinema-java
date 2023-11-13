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
    <script src="<%=root%>/tailwindcss/tailwindcss.js"></script>
    <script src="<%=root%>/tailwindcss/tailwindcss-with-forms.js"></script>
    <script src="<%=root%>/tailwindcss/tailwindcss-with-typography.js"></script>
    <script src="<%=root%>/tailwindcss/tailwindcss-with-aspect-ratio.js"></script>
    <script src="<%=root%>/tailwindcss/tailwindcss-with-line-clamp.js"></script>
    <script src="<%=root%>/tailwindcss/tailwindcss-with-all-plugins.js"></script>
</head>


    <!-- component header -->
    <jsp:include page="./Component/header.jsp">
      <jsp:param name="activeTab" value=""/>
    </jsp:include>

    <!--content-->
    <div class="booking-wrapper py-14 2xl:mx-32 xl:mx-16 lg:mx-8">
      <div
        class="classify-seat grid 2xl:grid-cols-2 2xl:gap-5 xl:grid-cols-1 grid-cols-1 lg:gap-2 gap-2"
      >
        <div class="flex items-center gap-7">
          <div class="bg-slate-600 w-12 rounded h-6"></div>
          <span class="font-bold md:text-xl text-sm">Standard</span>
        </div>
        <div class="flex items-center gap-7">
          <div class="bg-red-600 w-12 rounded h-6"></div>
          <span class="font-bold md:text-xl text-sm">Unavailable</span>
        </div>
        <div class="flex items-center gap-7">
          <div class="bg-purple-600 w-12 rounded h-6"></div>
          <span class="font-bold md:text-xl text-sm">Vip</span>
        </div>
        <div class="flex items-center gap-7">
          <div class="bg-green-600 w-12 rounded h-6"></div>
          <span class="font-bold md:text-xl text-sm w-[200px]"
            >Your selected seats</span
          >
        </div>
      </div>
      <div class="screen-seats mt-12">
        <span
          class="bg-slate-600 text-center text-white text-xl uppercase font-bold py-2 rounded lg:px-64 lg:mx-40 px-[180px] mx-[70px]"
          >Screen
        </span>
      </div>

      <div class="flex flex-row lg:gap-4 lg:mt-8 gap-2 mt-6">
        <div
          class="name-seats grid grid-cols-1 gap-1 text-white text-center lg:mt-1"
        >
          <span
            class="lg:w-12 w-8 h-fit lg:py-2 py-1 bg-slate-600 lg:border-1 rounded"
            >A</span
          >
          <span
            class="lg:w-12 w-8 h-fit lg:py-2 py-1 bg-slate-600 lg:border-1 rounded"
            >B</span
          >
          <span
            class="lg:w-12 w-8 h-fit lg:py-2 py-1 bg-slate-600 lg:border-1 rounded"
            >C</span
          >
          <span
            class="lg:w-12 w-8 h-fit lg:py-2 py-1 bg-slate-600 lg:border-1 rounded"
            >D</span
          >
          <span
            class="lg:w-12 w-8 h-fit lg:py-2 py-1 bg-slate-600 lg:border-1 rounded"
            >E</span
          >
          <span
            class="lg:w-12 w-8 h-fit lg:py-2 py-1 bg-slate-600 lg:border-1 rounded"
            >F</span
          >
          <span
            class="lg:w-12 w-8 h-fit lg:py-2 py-1 bg-slate-600 lg:border-1 rounded"
            >H</span
          >
          <span
            class="lg:w-12 w-8 h-fit lg:py-2 py-1 bg-slate-600 lg:border-1 rounded"
            >G</span
          >
          <span
            class="lg:w-12 w-8 h-fit lg:py-2 py-1 bg-slate-600 lg:border-1 rounded"
            >H</span
          >
          <span
            class="lg:w-12 w-8 h-fit lg:py-2 py-1 bg-slate-600 lg:border-1 rounded"
            >I</span
          >
          <span
            class="lg:w-12 w-8 h-fit lg:py-2 py-1 bg-slate-600 lg:border-1 rounded"
            >J</span
          >
        </div>
        <div
          class="name-detail-seats h-fit grid grid-cols-10 xl:gap-2 xl:ml-[115px] 2xl:gap-2 2xl:ml-28 lg:gap-[20px] lg:ml-[110px] ml-[68px] gap-1 text-white text-center"
        >
          <input
            type="checkbox"
            id="A"
            class="hidden custom-label"
            name="group-seats"
          />
          <label
            for="A"
            class="lg:w-12 lg:p-4 w-8 lg:py-2 py-1 bg-slate-600 lg:border-1 rounded cursor-pointer"
            >A</label
          >
          <input
            type="checkbox"
            id="B"
            class="hidden custom-label"
            name="group-seats"
          />
          <label
            for="B"
            class="lg:w-12 lg:p-4 w-8 lg:py-2 py-1 bg-slate-600 lg:border-1 rounded cursor-pointer"
            >B</label
          >
          <input
            type="checkbox"
            id="C"
            class="hidden custom-label"
            name="group-seats"
          />
          <label
            for="C"
            class="lg:w-12 lg:p-4 w-8 lg:py-2 py-1 bg-red-600 lg:border-1 rounded cursor-pointer"
            >C</label
          >
          <input
            type="checkbox"
            id="D"
            class="hidden custom-label"
            name="group-seats"
          />
          <label
            for="D"
            class="lg:w-12 lg:p-4 w-8 lg:py-2 py-1 bg-slate-600 lg:border-1 rounded cursor-pointer"
            >D</label
          >
          <input
            type="checkbox"
            id="E"
            class="hidden custom-label"
            name="group-seats"
          />
          <label
            for="E"
            class="lg:w-12 lg:p-4 w-8 lg:py-2 py-1 bg-purple-600 lg:border-1 rounded cursor-pointer"
            >E</label
          >
          <input
            type="checkbox"
            id="F"
            class="hidden custom-label"
            name="group-seats"
          />
          <label
            for="F"
            class="lg:w-12 lg:p-4 w-8 lg:py-2 py-1 bg-purple-600 lg:border-1 rounded cursor-pointer"
            >F</label
          >
          <input
            type="checkbox"
            id="G"
            class="hidden custom-label"
            name="group-seats"
          />
          <label
            for="G"
            class="lg:w-12 lg:p-4 w-8 lg:py-2 py-1 bg-purple-600 lg:border-1 rounded cursor-pointer"
            >G</label
          >
          <input
            type="checkbox"
            id="H"
            class="hidden custom-label"
            name="group-seats"
          />
          <label
            for="H"
            class="lg:w-12 lg:p-4 w-8 lg:py-2 py-1 bg-slate-600 lg:border-1 rounded cursor-pointer"
            >H</label
          >
          <input
            type="checkbox"
            id="I"
            class="hidden custom-label"
            name="group-seats"
          />
          <label
            for="I"
            class="lg:w-12 lg:p-4 w-8 lg:py-2 py-1 bg-red-600 lg:border-1 rounded cursor-pointer"
            >I</label
          >
          <input
            type="checkbox"
            id="J"
            class="hidden custom-label"
            name="group-seats"
          />
          <label
            for="J"
            class="lg:w-12 lg:p-4 w-8 lg:py-2 py-1 bg-slate-600 lg:border-1 rounded cursor-pointer"
            >J</label
          >
        </div>
        <div
          class="info-film ml-[110px] md:mx-16 lg:mx-20 xl:mx-16 flex flex-col gap-4"
        >
          <div class="shadow-2xl p-10 px-20 flex flex-col gap-2">
            <h1 class="xl:text-4xl lg:text-2xl font-bold">${movie.getTitle()}</h1>
            <div class="text-sm xl:text-lg lg:text-lg">
              Retail Price: 100.000
            </div>
            <div class="text-sm xl:text-lg lg:text-lg">Seat(s)</div>
          </div>
          <div class="shadow-2xl p-8 text-center">
            <h3 class="font-bold text-lg">Total Price</h3>
            <div>Od</div>
          </div>
          <button
            class="bg-red-600 rounded text-center text-white mx-16 p-3 hover:shadow-2xl shadow-black text-lg font-bold uppercase"
          >
            Buy ticket
          </button>
        </div>
      </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.1.1/flowbite.min.js"></script>
    </div>
</body>

</html>