<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
  String root = request.getContextPath();
  
  // delete ".jsp"
  String URI = request.getRequestURI();
  URI = URI.substring(0, URI.length() - 4);
%>

<header>
  <nav class="bg-gray-200 border-gray-200 lg:px-6 py-2.5">
    <div class="flex flex-wrap justify-between items-center mx-auto max-w-screen-xl">
      <a href="#" class="flex items-center">
        <img src="https://flowbite.com/docs/images/logo.svg" class="mr-3 h-6 sm:h-9" alt="Flowbite Logo" />
        <span class="self-center text-xl font-semibold whitespace-nowrap">Cinema</span>
      </a>
      <div class="flex items-center lg:order-2">
        <c:choose>
          <c:when test="${sessionScope.customer == null}">
            <a href="<%=root%>/login"
               class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium 
               rounded-lg text-sm px-4 lg:px-5 py-2 lg:py-2.5 mr-2">
              Login
            </a>
          </c:when>
          <c:otherwise>
            ${sessionScope.customer.getFullname()} | ${sessionScope.customer.getBalance()}đ

            <!-- Modal toggle -->
            <button data-modal-target="authentication-modal" data-modal-toggle="authentication-modal" 
                    class="block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none 
                    focus:ring-blue-300 font-medium rounded-lg text-sm px-2 py-1 ml-2 text-center" type="button">
              Add balance
            </button>

            <!-- Main modal add balance-->
            <div id="authentication-modal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
              <div class="relative p-4 w-full max-w-md max-h-full">
                <!-- Modal content -->
                <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                  <!-- Modal header -->
                  <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t ">
                    <h3 class="text-xl font-semibold text-gray-900">
                      Add balance
                    </h3>
                    <button type="button" class="end-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center" data-modal-hide="authentication-modal">
                      <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                      </svg>
                      <span class="sr-only">Close modal</span>
                    </button>
                  </div>
                  <!-- Modal body -->
                  <div class="p-4 md:p-5">
                    <form class="space-y-4" method="post" action="<%=root%>/">
                      <div>
                        <label for="balance" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Balance</label>
                        <input type="number" name="balance" id="balance" class="bg-gray-50 border border-gray-300 
                               text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 
                               block w-full p-2.5">
                      </div>
                      <button type="submit" class="w-full text-white bg-blue-700 hover:bg-blue-800 
                              focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg 
                              text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 
                              dark:focus:ring-blue-800">Submit</button>
                      
                    </form>
                  </div>
                </div>
              </div>
            </div> 


            <a href="<%=root%>?action=out"
               class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium 
               rounded-lg text-sm px-4 lg:px-2 py-2 lg:py-1 mx-2 ">
              Log out
            </a>
          </c:otherwise>
        </c:choose>
<!--        <a href="<%=root%>/login"
           class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium 
           rounded-lg text-sm px-4 lg:px-5 py-2 lg:py-2.5 mr-2">
          Login
        </a>-->
        <button data-collapse-toggle="mobile-menu-2" type="button"
                class="inline-flex items-center p-2 ml-1 text-sm text-gray-500 rounded-lg lg:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200"
                aria-controls="mobile-menu-2" aria-expanded="false">
          <span class="sr-only">Open main menu</span>
          <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd"
                  d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                  clip-rule="evenodd"></path>
          </svg>
          <svg class="hidden w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
               xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd"
                  d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                  clip-rule="evenodd"></path>
          </svg>
        </button>
      </div>
      <div class="hidden justify-between items-center w-full lg:flex lg:w-auto lg:order-1" id="mobile-menu-2">
        <ul class="flex flex-col mt-4 font-medium lg:flex-row lg:space-x-8 lg:mt-0">
          <li>
            <a href="<%=root%>"
               class="block py-2 pr-4 pl-3 rounded bg-blue-700 lg:bg-transparent 
               ${param.activeTab == "home" ? "lg:text-blue-700" : "text-gray-700"} lg:hover:text-blue-700 lg:p-0"
               >Home</a>
          </li>
          <li>
            <a href="<%=root%>/showing"
               class="block py-2 pr-4 pl-3 ${param.activeTab == "showing" ? "lg:text-blue-700" : "text-gray-700"}
               border-b border-gray-100 hover:bg-gray-50 
               lg:hover:bg-transparent lg:border-0 lg:hover:text-blue-700 lg:p-0"
               >Showing</a>
          </li>
          <li>
            <a href="<%=root%>/ticket"
               class="block py-2 pr-4 pl-3 ${param.activeTab == "ticket" ? "lg:text-blue-700" : "text-gray-700"}
               border-b border-gray-100 hover:bg-gray-50 lg:hover:bg-transparent lg:border-0 
               lg:hover:text-blue-700 lg:p-0">Tickets</a>
          </li>
          <li>
            <a href="<%=root%>/admin/movies"
               class="block py-2 pr-4 pl-3 ${param.activeTab == "admin" ? "lg:text-blue-700" : "text-gray-700"}
               border-b border-gray-100 hover:bg-gray-50 lg:hover:bg-transparent lg:border-0 
               lg:hover:text-blue-700 lg:p-0"">
              Admin
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <script>

  </script>
</header>