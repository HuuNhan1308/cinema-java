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
                <title>Ticket</title>
                <script src="<%=root%>/tailwind/tailwind.js"></script>
            </head>

            <body>
                <!-- component header -->
                <jsp:include page="./Component/header.jsp">
                    <jsp:param name="activeTab" value="ticket" />
                </jsp:include>

                <!--content-->

                <div class="container px-20 py-20 mx-auto flex items-center justify-center flex-col">
                    <c:if test="${state == 'fail'}">
                        <div class="flex items-center p-4 mb-4 text-sm rounded-lg bg-gray-800 text-red-500" role="alert">
                            <svg class="flex-shrink-0 inline w-4 h-4 me-3" aria-hidden="true"
                                 xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                                <path
                                      d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z" />
                            </svg>
                            <div>
                                <span class="font-medium">Refund fail</span>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${state == 'success'}">
                        <div class="flex items-center p-4 mb-4 text-sm rounded-lg bg-gray-800 text-green-500" role="alert">
                            <svg class="flex-shrink-0 inline w-4 h-4 me-3" aria-hidden="true"
                                 xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                                <path
                                      d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z" />
                            </svg>
                            <div>
                                <span class="font-medium">Refund success</span>
                            </div>
                        </div>
                    </c:if>

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
                                                <th scope="row"
                                                    class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">
                                                    ${ticket.getSeatNumber()}
                                                </th>
                                                <th scope="row"
                                                    class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">
                                                    ${ticket.showtime.getDate()}
                                                </th>
                                                <th scope="row"
                                                    class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">
                                                    ${ticket.showtime.getStartTimeStr()}
                                                </th>
                                                <th scope="row"
                                                    class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">
                                                    ${ticket.showtime.getPrice()}
                                                </th>
                                                <th scope="row"
                                                    class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">
                                                    ${ticket.showtime.room.getRoomNumber()}
                                                </th>
                                                <th scope="row"
                                                    class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">
                                                    ${ticket.showtime.movie.getTitle()}
                                                </th>
                                                <td class="px-6 py-2">
                                                    <form method="post" action="<%=root%>/ticket/refund">
                                                        <input type="hidden" name="InvoiceID"
                                                               value="${ticket.invoice.getInvoiceID()}">
                                                        <button class="block text-white focus:ring-4 focus:outline-none font-medium rounded-lg text-sm px-5 py-2.5 text-center bg-blue-600 hover:bg-blue-700 focus:ring-blue-800"
                                                                type="submit">
                                                            Refund
                                                        </button>
                                                    </form>
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
                                                <th scope="row"
                                                    class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">
                                                    ${ticket.getSeatNumber()}
                                                </th>
                                                <th scope="row"
                                                    class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">

                                                </th>
                                                <th scope="row"
                                                    class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">

                                                </th>
                                                <th scope="row"
                                                    class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">

                                                </th>
                                                <th scope="row"
                                                    class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">

                                                </th>
                                                <th scope="row"
                                                    class="px-6 py-2 font-medium whitespace-nowrap text-gray-700">

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


                <script src="<%=root%>/tailwind/flowbite.min.js"></script>
            </body>

            </html>