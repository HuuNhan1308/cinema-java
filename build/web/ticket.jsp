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
                    <jsp:param name="activeTab" value="ticket" />
                </jsp:include>

                <!--content-->
                <div class="container px-20 py-20">
                    <table class="w-full text-sm text-left rtl:text-right text-gray-700 text-gray-600">
                        <thead class="text-xs uppercase bg-gray-200 text-gray-700">
                            <tr>
                                <th scope="col" class="px-6 py-3">Invoice ID</th>
                                <!-- <th scope="col" class="px-6 py-3">Ticket ID</th> -->
                                <th scope="col" class="px-6 py-3">Seat Number</th>
                                <th scope="col" class="px-6 py-3">Show Date</th>
                                <th scope="col" class="px-6 py-3">Start Time</th>
                                <th scope="col" class="px-6 py-3">Price</th>
                                <th scope="col" class="px-6 py-3">Room number</th>
                                <th scope="col" class="px-6 py-3">Movie Title</th>
                                <th scope="col" class="px-6 py-3"></th>
                            </tr>
                        </thead>
                        <c:forEach var="invoice" items="${invoices}">
                            <tbody>
                                <c:set var="currentInvoiceId" value="" />
                                <c:forEach var="ticket" items="${invoice.tickets}">
                                    <tr class="border-b bg-gray-100 border-gray-200">
                                        <c:choose>
                                            <c:when test="${ticket.invoice.getInvoiceID() != currentInvoiceId}">
                                                <th scope="row" class="px-6 py-2">
                                                    ${ticket.invoice.getInvoiceID()}
                                                </th>
                                                <!-- <th scope="row" class="px-6 py-2 font-medium text-gray-700">
                                                    ${ticket.getTicketID()}
                                                </th> -->
                                                <th scope="row" class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">
                                                    ${ticket.getSeatNumber()}
                                                </th>
                                                <th scope="row" class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">
                                                    ${ticket.showtime.getDate()}
                                                </th>
                                                <th scope="row" class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">
                                                    ${ticket.showtime.getStartTimeStr()}
                                                </th>
                                                <th scope="row" class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">
                                                    ${ticket.showtime.getPrice()}
                                                </th>
                                                <th scope="row" class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">
                                                    ${ticket.showtime.room.getRoomNumber()}
                                                </th>
                                                <th scope="row" class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">
                                                    ${ticket.showtime.movie.getTitle()}
                                                </th>
                                                <td class="px-6 py-2">
                                                    <button class="block text-white focus:ring-4 focus:outline-none font-medium rounded-lg text-sm px-5 py-2.5 text-center bg-blue-600 hover:bg-blue-700 focus:ring-blue-800"
                                                            type="button">
                                                        Refund
                                                    </button>
                                                </td>
                                                <c:set var="currentInvoiceId"
                                                       value="${ticket.invoice.getInvoiceID()}" />
                                            </c:when>
                                            <c:otherwise>
                                                <th scope="row" class="px-6 py-2">
                                                    
                                                </th>
                                                <!-- <th scope="row" class="px-6 py-2 font-medium text-gray-700">
                                                    ${ticket.getTicketID()}
                                                </th> -->
                                                <th scope="row" class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">
                                                    ${ticket.getSeatNumber()}
                                                </th>
                                                <th scope="row" class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">
                                                    
                                                </th>
                                                <th scope="row" class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">
                                                    
                                                </th>
                                                <th scope="row" class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">
                                                    
                                                </th>
                                                <th scope="row" class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">
                                  
                                                </th>
                                                <th scope="row" class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">                                                   
                                                
                                                </th>
                                                <td class="px-6 py-2">

                                                </td>
                                            </c:otherwise>
                                        </c:choose>

                                    </tr>
                                </c:forEach>
                            </tbody>
                        </c:forEach>
                    </table>
                </div>


                <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>
            </body>

            </html>