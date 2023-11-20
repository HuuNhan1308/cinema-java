<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%String root = request.getContextPath();%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin page</title>
    <script src="<%=root%>/tailwind/tailwind.js"></script>
    <link rel="stylesheet" href="<%=root%>/assets/css/style.css" />
  </head>
  <body>
    <div class="admin-page bg-[#3D4857E1]">
      <!-- Aside bar -->
      <aside
        id="separator-sidebar"
        class="fixed top-0 left-0 z-40 w-64 h-screen transition-transform -translate-x-full sm:translate-x-0"
        aria-label="Sidebar"
        >
        <div class="h-full px-3 py-4 overflow-y-auto bg-gray-800">
          <ul class="space-y-2 font-medium">
            <!-- Dashboard -->
            <li>
              <a
                href="<%=root%>"
                class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 group"
                >
                <svg
                  class="w-5 h-5 transition duration-75 text-gray-400 group-hover:text-white"
                  aria-hidden="true"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="currentColor"
                  viewBox="0 0 22 21"
                  >
                <path
                  d="M16.975 11H10V4.025a1 1 0 0 0-1.066-.998 8.5 8.5 0 1 0 9.039 9.039.999.999 0 0 0-1-1.066h.002Z"
                  />
                <path
                  d="M12.5 0c-.157 0-.311.01-.565.027A1 1 0 0 0 11 1.02V10h8.975a1 1 0 0 0 1-.935c.013-.188.028-.374.028-.565A8.51 8.51 0 0 0 12.5 0Z"
                  />
                </svg>
                <span class="flex-1 ms-3 whitespace-nowrap">Dashboard</span>
              </a>
            </li>
            <!-- Movies -->
            <li>
              <a
                href="<%=root%>/admin/movies"
                class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 group"
                >
                <svg
                  class="flex-shrink-0 w-5 h-5 transition duration-75 text-gray-400 group-hover:text-white"
                  xmlns="http://www.w3.org/2000/svg"
                  height="1em"
                  fill="currentColor"
                  viewBox="0 0 640 512"
                  >
                <!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                <path
                  d="M64 64V352H576V64H64zM0 64C0 28.7 28.7 0 64 0H576c35.3 0 64 28.7 64 64V352c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V64zM128 448H512c17.7 0 32 14.3 32 32s-14.3 32-32 32H128c-17.7 0-32-14.3-32-32s14.3-32 32-32z"
                  />
                </svg>
                <span class="flex-1 ms-3 whitespace-nowrap">Movies</span>
              </a>
            </li>
            <!-- Rooms -->
            <li>
              <a
                href="<%=root%>/admin/rooms"
                class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 group"
                >
                <svg
                  class="flex-shrink-0 w-5 h-5 transition duration-75 text-gray-400 group-hover:text-white"
                  xmlns="http://www.w3.org/2000/svg"
                  height="1em"
                  fill="currentColor"
                  viewBox="0 0 512 512"
                  >
                <!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                <path
                  d="M0 96C0 60.7 28.7 32 64 32H448c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V96zM48 368v32c0 8.8 7.2 16 16 16H96c8.8 0 16-7.2 16-16V368c0-8.8-7.2-16-16-16H64c-8.8 0-16 7.2-16 16zm368-16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V368c0-8.8-7.2-16-16-16H416zM48 240v32c0 8.8 7.2 16 16 16H96c8.8 0 16-7.2 16-16V240c0-8.8-7.2-16-16-16H64c-8.8 0-16 7.2-16 16zm368-16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V240c0-8.8-7.2-16-16-16H416zM48 112v32c0 8.8 7.2 16 16 16H96c8.8 0 16-7.2 16-16V112c0-8.8-7.2-16-16-16H64c-8.8 0-16 7.2-16 16zM416 96c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V112c0-8.8-7.2-16-16-16H416zM160 128v64c0 17.7 14.3 32 32 32H320c17.7 0 32-14.3 32-32V128c0-17.7-14.3-32-32-32H192c-17.7 0-32 14.3-32 32zm32 160c-17.7 0-32 14.3-32 32v64c0 17.7 14.3 32 32 32H320c17.7 0 32-14.3 32-32V320c0-17.7-14.3-32-32-32H192z"
                  />
                </svg>
                <span class="flex-1 ms-3 whitespace-nowrap">Rooms</span>
              </a>
            </li>
            <!-- Showtimes -->
            <li>
              <a
                href="<%=root%>/admin/showtimes"
                class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 group"
                >
                <svg
                  class="flex-shrink-0 w-5 h-5 transition duration-75 text-gray-400 group-hover:text-white"
                  aria-hidden="true"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="currentColor"
                  viewBox="0 0 20 18"
                  >
                <path
                  d="M14 2a3.963 3.963 0 0 0-1.4.267 6.439 6.439 0 0 1-1.331 6.638A4 4 0 1 0 14 2Zm1 9h-1.264A6.957 6.957 0 0 1 15 15v2a2.97 2.97 0 0 1-.184 1H19a1 1 0 0 0 1-1v-1a5.006 5.006 0 0 0-5-5ZM6.5 9a4.5 4.5 0 1 0 0-9 4.5 4.5 0 0 0 0 9ZM8 10H5a5.006 5.006 0 0 0-5 5v2a1 1 0 0 0 1 1h11a1 1 0 0 0 1-1v-2a5.006 5.006 0 0 0-5-5Z"
                  />
                </svg>

                <span class="flex-1 ms-3 whitespace-nowrap">Showtime</span>
              </a>
            </li>
            <!-- Seatclass -->
            <li>
              <a
                href="<%=root%>/admin/seatclass"
                class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 group aside-tab--active"
                >
                <svg
                  class="flex-shrink-0 w-5 h-5 transition duration-75 text-gray-400 group-hover:text-white"
                  aria-hidden="true"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="currentColor"
                  viewBox="0 0 18 18"
                  >
                <path
                  d="M6.143 0H1.857A1.857 1.857 0 0 0 0 1.857v4.286C0 7.169.831 8 1.857 8h4.286A1.857 1.857 0 0 0 8 6.143V1.857A1.857 1.857 0 0 0 6.143 0Zm10 0h-4.286A1.857 1.857 0 0 0 10 1.857v4.286C10 7.169 10.831 8 11.857 8h4.286A1.857 1.857 0 0 0 18 6.143V1.857A1.857 1.857 0 0 0 16.143 0Zm-10 10H1.857A1.857 1.857 0 0 0 0 11.857v4.286C0 17.169.831 18 1.857 18h4.286A1.857 1.857 0 0 0 8 16.143v-4.286A1.857 1.857 0 0 0 6.143 10Zm10 0h-4.286A1.857 1.857 0 0 0 10 11.857v4.286c0 1.026.831 1.857 1.857 1.857h4.286A1.857 1.857 0 0 0 18 16.143v-4.286A1.857 1.857 0 0 0 16.143 10Z"
                  />
                </svg>

                <span class="flex-1 ms-3 whitespace-nowrap">Seat Class</span>
              </a>
            </li>
          </ul>
          <ul class="pt-4 mt-4 space-y-2 font-medium border-t border-gray-700">
            <li>
              <a
                href="#"
                class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 group"
                >
                <svg
                  class="flex-shrink-0 w-5 h-5 transition duration-75 text-gray-400 group-hover:text-white"
                  aria-hidden="true"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="currentColor"
                  viewBox="0 0 17 20"
                  >
                <path
                  d="M7.958 19.393a7.7 7.7 0 0 1-6.715-3.439c-2.868-4.832 0-9.376.944-10.654l.091-.122a3.286 3.286 0 0 0 .765-3.288A1 1 0 0 1 4.6.8c.133.1.313.212.525.347A10.451 10.451 0 0 1 10.6 9.3c.5-1.06.772-2.213.8-3.385a1 1 0 0 1 1.592-.758c1.636 1.205 4.638 6.081 2.019 10.441a8.177 8.177 0 0 1-7.053 3.795Z"
                  />
                </svg>
                <span class="ms-3">Upgrade to Pro</span>
              </a>
            </li>
            <li>
              <a
                href="#"
                class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 group"
                >
                <svg
                  class="flex-shrink-0 w-5 h-5 transition duration-75 text-gray-400 group-hover:text-white"
                  aria-hidden="true"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="currentColor"
                  viewBox="0 0 16 20"
                  >
                <path
                  d="M16 14V2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v15a3 3 0 0 0 3 3h12a1 1 0 0 0 0-2h-1v-2a2 2 0 0 0 2-2ZM4 2h2v12H4V2Zm8 16H3a1 1 0 0 1 0-2h9v2Z"
                  />
                </svg>
                <span class="ms-3">Documentation</span>
              </a>
            </li>
            <li>
              <a
                href="#"
                class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 group"
                >
                <svg
                  class="flex-shrink-0 w-5 h-5 transition duration-75 text-gray-400 group-hover:text-white"
                  aria-hidden="true"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="currentColor"
                  viewBox="0 0 20 18"
                  >
                <path
                  d="M18 0H6a2 2 0 0 0-2 2h14v12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2Z"
                  />
                <path
                  d="M14 4H2a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2ZM2 16v-6h12v6H2Z"
                  />
                </svg>
                <span class="ms-3">Components</span>
              </a>
            </li>
            <li>
              <a
                href="#"
                class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 group"
                >
                <svg
                  class="flex-shrink-0 w-5 h-5 transition duration-75 text-gray-400 group-hover:text-white"
                  aria-hidden="true"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="currentColor"
                  viewBox="0 0 21 21"
                  >
                <path
                  d="m5.4 2.736 3.429 3.429A5.046 5.046 0 0 1 10.134 6c.356.01.71.06 1.056.147l3.41-3.412c.136-.133.287-.248.45-.344A9.889 9.889 0 0 0 10.269 1c-1.87-.041-3.713.44-5.322 1.392a2.3 2.3 0 0 1 .454.344Zm11.45 1.54-.126-.127a.5.5 0 0 0-.706 0l-2.932 2.932c.029.023.049.054.078.077.236.194.454.41.65.645.034.038.078.067.11.107l2.927-2.927a.5.5 0 0 0 0-.707Zm-2.931 9.81c-.024.03-.057.052-.081.082a4.963 4.963 0 0 1-.633.639c-.041.036-.072.083-.115.117l2.927 2.927a.5.5 0 0 0 .707 0l.127-.127a.5.5 0 0 0 0-.707l-2.932-2.931Zm-1.442-4.763a3.036 3.036 0 0 0-1.383-1.1l-.012-.007a2.955 2.955 0 0 0-1-.213H10a2.964 2.964 0 0 0-2.122.893c-.285.29-.509.634-.657 1.013l-.01.016a2.96 2.96 0 0 0-.21 1 2.99 2.99 0 0 0 .489 1.716c.009.014.022.026.032.04a3.04 3.04 0 0 0 1.384 1.1l.012.007c.318.129.657.2 1 .213.392.015.784-.05 1.15-.192.012-.005.02-.013.033-.018a3.011 3.011 0 0 0 1.676-1.7v-.007a2.89 2.89 0 0 0 0-2.207 2.868 2.868 0 0 0-.27-.515c-.007-.012-.02-.025-.03-.039Zm6.137-3.373a2.53 2.53 0 0 1-.35.447L14.84 9.823c.112.428.166.869.16 1.311-.01.356-.06.709-.147 1.054l3.413 3.412c.132.134.249.283.347.444A9.88 9.88 0 0 0 20 11.269a9.912 9.912 0 0 0-1.386-5.319ZM14.6 19.264l-3.421-3.421c-.385.1-.781.152-1.18.157h-.134c-.356-.01-.71-.06-1.056-.147l-3.41 3.412a2.503 2.503 0 0 1-.443.347A9.884 9.884 0 0 0 9.732 21H10a9.9 9.9 0 0 0 5.044-1.388 2.519 2.519 0 0 1-.444-.348ZM1.735 15.6l3.426-3.426a4.608 4.608 0 0 1-.013-2.367L1.735 6.4a2.507 2.507 0 0 1-.35-.447 9.889 9.889 0 0 0 0 10.1c.1-.164.217-.316.35-.453Zm5.101-.758a4.957 4.957 0 0 1-.651-.645c-.033-.038-.077-.067-.11-.107L3.15 17.017a.5.5 0 0 0 0 .707l.127.127a.5.5 0 0 0 .706 0l2.932-2.933c-.03-.018-.05-.053-.078-.076ZM6.08 7.914c.03-.037.07-.063.1-.1.183-.22.384-.423.6-.609.047-.04.082-.092.129-.13L3.983 4.149a.5.5 0 0 0-.707 0l-.127.127a.5.5 0 0 0 0 .707L6.08 7.914Z"
                  />
                </svg>
                <span class="ms-3">Help</span>
              </a>
            </li>
          </ul>
        </div>
      </aside>

      <!-- Content -->
      <div class="content ml-64 px-4 h-[100vh] pt-4">
        <!-- Table -->


        <c:choose>
          <c:when test="${action == 'update' || action == 'add'}">
            <!-- update form -->
            <c:import url="${root}/AdminComponent/Update/seatclass.jsp"/>
          </c:when>    
          <c:otherwise>
            <!-- Movies table -->
            <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
              <table
                class="w-full text-sm text-left rtl:text-right text-gray-500 text-gray-400"
                >
                <thead class="text-xs uppercase bg-gray-700 text-gray-400">
                  <tr>
                    <th scope="col" class="px-6 py-3">Category</th>
                    <th scope="col" class="px-6 py-3">Factor</th>
                    <th scope="col" class="px-6 py-3"></th>
                    <th scope="col" class="px-6 py-3"></th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="seatClass" items="${seatClasses}">
                    <tr class="border-b bg-gray-800 border-gray-700">
                      <th
                        scope="row"
                        class="px-6 py-2 font-medium whitespace-nowrap text-white"
                        >
                        ${seatClass.getCategory()}
                      </th>
                      <td class="px-6 py-2">${seatClass.getFactor()}</td>
                      <td class="px-6 py-2">
                        <a href="<%=root%>/admin/seatclass?action=update&id=${seatClass.getId()}" class="font-medium text-blue-500 hover:underline"
                           >Edit</a
                        >
                      </td>
                      <td class="px-6 py-2">
                        <button data-modal-target="delete_modal" data-seatclass-id=${seatClass.getId()} data-modal-toggle="delete_modal" class="block text-white focus:ring-4 focus:outline-none font-medium rounded-lg text-sm px-5 py-2.5 text-center bg-blue-600 hover:bg-blue-700 focus:ring-blue-800" type="button">
                          Delete
                        </button>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
             
            <!--Add Movie-->
            <form method="get" action="<%=root%>/admin/seatclass">
              <input type="hidden" name="action" value="add"/>
              <button type="submit" class="mt-4 focus:outline-none text-white bg-purple-700 
                      hover:bg-purple-800 focus:ring-4 focus:ring-purple-300 font-medium rounded-lg 
                      text-sm px-5 py-2.5 mb-2 dark:bg-purple-600 dark:hover:bg-purple-700 dark:focus:ring-purple-900">
                Add seat class
              </button>
            </form>

              <!--Modal-->
            <div id="delete_modal" tabindex="-1" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
              <div class="relative p-4 w-full max-w-md max-h-full">
                <div class="relative rounded-lg shadow bg-gray-700">
                  <button type="button" class="absolute top-3 end-2.5 text-gray-400 bg-transparent rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center hover:bg-gray-600 hover:text-white" data-modal-hide="delete_modal">
                    <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                    </svg>
                    <span class="sr-only">Close modal</span>
                  </button>
                  <div class="p-4 md:p-5 text-center">
                    <svg class="mx-auto mb-4 w-12 h-12 text-gray-200" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 11V6m0 8h.01M19 10a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z"/>
                    </svg>
                    <h3 class="mb-5 text-lg font-normal text-gray-400">Are you sure you want to delete this seat class?</h3>

                    <!--FORM TO DELETE SERVLET-->
                    <form method="post" action="<%=root%>/admin/seatclass">
                      <input type="hidden" name="action" value="delete"/>
                      <input type="hidden" name="seatClassID" value=""/>
                      <button data-modal-hide="delete_modal" type="submit" class="text-white bg-red-600 px-5 py-2.5 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-800 font-medium rounded-lg text-sm inline-flex items-center text-center me-2">
                        Yes, I'm sure
                      </button>
                      <button data-modal-hide="delete_modal" type="button" class=" focus:ring-4 focus:outline-none 0 rounded-lg border text-sm font-medium px-5 py-2.5  focus:z-10 bg-gray-700 text-gray-300 border-gray-500 hover:text-white hover:bg-gray-600 focus:ring-gray-600">No, cancel</button>

                    </form>
                  </div>
                </div>
              </div>
            </div>
          </c:otherwise>
        </c:choose>



      </div>
    </div>

    <script src="<%=root%>/tailwind/flowbite.min.js"></script>
    <script>
      // Prevent click behavior in active tab
      const activeTab = document.querySelector(".aside-tab--active");
      activeTab.addEventListener("click", (e) => {
        e.preventDefault();
      });

      // get data and save to input field from delete action
      let roomNumber;
      const roomDeleteButtons = document.querySelectorAll('[data-seatclass-id]');
      const roomNumberInput = document.querySelector('[name="seatClassID"]');

      for (let roomDeleteButton of roomDeleteButtons) {
        roomDeleteButton.addEventListener("click", (e) => {
          //Get data room from element
          roomNumber = roomDeleteButton.getAttribute("data-seatclass-id");
          roomNumberInput.value = roomNumber;
        });
      }


    </script>
  </body>
</html>
