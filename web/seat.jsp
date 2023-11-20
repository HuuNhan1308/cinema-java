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
                class="bg-slate-600 text-center text-white text-xl uppercase font-bold py-2 rounded lg:px-64 lg:mx-40 px-[188px] mx-[70px]"
                >Screen
            </span>
        </div>

        <div class="flex flex-row lg:gap-2 lg:mt-8 mt-[5px] gap-2">
            <div
                class="name-seats grid grid-cols-1 gap-[8px] text-black text-center font-bold lg:mt-[2.5px]"
                >
                <label
                    class="lg:w-12 lg:p-4 w-8 h-fit lg:py-[8px] text-white lg:border-1  rounded select-none "
                    >O</label
                >
                <label
                    class="lg:w-12 lg:p-4 w-8 h-fit lg:py-[8px] py-1 border-gray-500 lg:border-1 border-[1px] rounded select-none"
                    >A</label
                >
                <label
                    class="lg:w-12 lg:p-4 w-8 h-fit lg:py-[8px] py-1 border-gray-500 lg:border-1 border-[1px] rounded select-none"
                    >B</label
                >
                <label
                    class="lg:w-12 lg:p-4 w-8 h-fit lg:py-[8px] py-1 border-gray-500 lg:border-1 border-[1px] rounded select-none"
                    >C</label
                >
                <label
                    class="lg:w-12 lg:p-4 w-8 h-fit lg:py-[8px] py-1 border-gray-500 lg:border-1 border-[1px] rounded select-none"
                    >D</label
                >
                <label
                    class="lg:w-12 lg:p-4 w-8 h-fit lg:py-[8px] py-1 border-gray-500 lg:border-1 border-[1px] rounded select-none"
                    >E</label
                >
                <label
                    class="lg:w-12 lg:p-4 w-8 h-fit lg:py-[8px] py-1 border-gray-500 lg:border-1 border-[1px] rounded select-none"
                    >F</label
                >
                <label
                    class="lg:w-12 lg:p-4 w-8 h-fit lg:py-[8px] py-1 border-gray-500 lg:border-1 border-[1px] rounded select-none"
                    >G</label
                >
                <label
                    class="lg:w-12 lg:p-4 w-8 h-fit lg:py-[8px] py-1 border-gray-500 lg:border-1 border-[1px] rounded select-none"
                    >H</label
                >
                <label
                    class="lg:w-12 lg:p-4 w-8 h-fit lg:py-[8px] py-1 border-gray-500 lg:border-1 border-[1px] rounded select-none"
                    >I</label
                >
                <label
                    class="lg:w-12 lg:p-4 w-8 h-fit lg:py-[8px] py-1 border-gray-500 lg:border-1 border-[1px] rounded select-none"
                    >J</label
                >
            </div>

            <div
                class="name-detail-seats h-fit grid grid-cols-10 xl:gap-2 xl:ml-[115px] 2xl:gap-2 2xl:ml-28 lg:gap-[20px] lg:ml-[110px] ml-[68px] gap-1 mt-[3px] text-center"
                >
                <input
                    type="checkbox"
                    id="A"
                    class="hidden custom-label"
                    name="group-seats"
                    />
                <label
                    for="A"
                    class="lg:w-12 lg:p-4 w-8 lg:py-2 lg:ml-[2px] py-1  lg:border-1 border-gray-500 border-[1px] rounded cursor-pointer font-bold"
                    >1</label
                >
                <input
                    type="checkbox"
                    id="B"
                    class="hidden custom-label"
                    name="group-seats"
                    />
                <label
                    for="B"
                    class="lg:w-12 lg:p-4 w-8 lg:py-2 lg:ml-[2px] py-1  lg:border-1 border-gray-500 border-[1px] rounded cursor-pointer font-bold"
                    >2</label
                >
                <input
                    type="checkbox"
                    id="C"
                    class="hidden custom-label"
                    name="group-seats"
                    />
                <label
                    for="C"
                    class="lg:w-12 lg:p-4 w-8 lg:py-2 lg:ml-[2px] py-1  lg:border-1 border-gray-500 border-[1px] rounded cursor-pointer font-bold"
                    >3</label
                >
                <input
                    type="checkbox"
                    id="D"
                    class="hidden custom-label"
                    name="group-seats"
                    />
                <label
                    for="D"
                    class="lg:w-12 lg:p-4 w-8 lg:py-2 lg:ml-[2px] py-1  lg:border-1 border-gray-500 border-[1px] rounded cursor-pointer font-bold"
                    >4</label
                >
                <input
                    type="checkbox"
                    id="E"
                    class="hidden custom-label"
                    name="group-seats"
                    />
                <label
                    for="E"
                    class="lg:w-12 lg:p-4 w-8 lg:py-2 lg:ml-[2px] py-1  lg:border-1 border-gray-500 border-[1px] rounded cursor-pointer font-bold"
                    >5</label
                >
                <input
                    type="checkbox"
                    id="F"
                    class="hidden custom-label"
                    name="group-seats"
                    />
                <label
                    for="F"
                    class="lg:w-12 lg:p-4 w-8 lg:py-2 lg:ml-[2px] py-1  lg:border-1 border-gray-500 border-[1px] rounded cursor-pointer font-bold"
                    >6</label
                >
                <input
                    type="checkbox"
                    id="G"
                    class="hidden custom-label"
                    name="group-seats"
                    />
                <label
                    for="G"
                    class="lg:w-12 lg:p-4 w-8 lg:py-2 lg:ml-[2px] py-1  lg:border-1 border-gray-500 border-[1px] rounded cursor-pointer font-bold"
                    >7</label
                >
                <input
                    type="checkbox"
                    id="H"
                    class="hidden custom-label"
                    name="group-seats"
                    />
                <label
                    for="H"
                    class="lg:w-12 lg:p-4 w-8 lg:py-2 lg:ml-[2px] py-1  lg:border-1 border-gray-500 border-[1px] rounded cursor-pointer font-bold"
                    >8</label
                >
                <input
                    type="checkbox"
                    id="I"
                    class="hidden custom-label"
                    name="group-seats"
                    />
                <label
                    for="I"
                    class="lg:w-12 lg:p-4 w-8 lg:py-2 lg:ml-[2px] py-1  lg:border-1 border-gray-500 border-[1px] rounded cursor-pointer font-bold"
                    >9</label
                >
                <input
                    type="checkbox"
                    id="J"
                    class="hidden custom-label"
                    name="group-seats"
                    />
                <label
                    for="J"
                    class="lg:w-12 lg:p-4 w-8 lg:py-2 lg:ml-[2px] py-1  lg:border-1 border-gray-500 border-[1px] rounded cursor-pointer font-bold"
                    >10</label
                >

                <c:set var="SeatName" value="ABCDEFGHIJ" />
                <c:forEach var="i" begin="0" end="99">
                    <c:set var="found" value="false" />
                    <c:forEach var="seat" items="${chosenSeats}" varStatus="loop">
                        <c:if test="${!found && i == seat.getSeatNumber()- 1}">
                            <input type="hidden" name="seatNumber" value="${i}" />
                            <input type="submit"
                                   class="lg:w-12 w-8 lg:py-[9px] lg:ml-[2px] py-1 bg-red-600
                                   lg:border-1 rounded cursor-pointer text-white text-center select-none"
                                   value="${SeatName.charAt(i/10)}${i%10 + 1}" />
                            <c:set var="found" value="true" />
                        </c:if>
                    </c:forEach>
                    <c:if test="${!found && i >= 30 && i <= 60 - 1}">
                        <input type="hidden" name="seatNumber" id="seatNumber" value="${i}" />
                        <input type="submit"
                               class="lg:w-12 w-8 lg:py-[9px] lg:ml-[2px] py-1 bg-purple-600
                               lg:border-1 rounded cursor-pointer text-white text-center select-none"
                               value="${SeatName.charAt(i/10)}${i%10 + 1}"
                               onclick="changeColor(this, ${i + 1})"
                               />
                        <c:set var="found" value="true" />
                    </c:if>
                    <c:if test="${!found}">
                        <input type="hidden" name="seatNumber" value="${i}" />
                        <input type="submit"
                               class="lg:w-12 w-8 lg:py-[9px] lg:ml-[2px] py-1 bg-slate-600
                               lg:border-1 rounded cursor-pointer text-white text-center select-none"
                               value="${SeatName.charAt(i/10)}${i%10 + 1}"
                               onclick="changeColor(this, ${i + 1})"
                               />
                    </c:if>
                </c:forEach>
            </div>


            <div
                class="info-film ml-[110px] md:mx-16 lg:mx-20 xl:mx-16 flex flex-col gap-4"
                >
                <div class="shadow-2xl p-10 px-20 flex flex-col gap-2">
                    <h1 class="xl:text-4xl lg:text-2xl font-bold">${showtime.getMovie().getTitle()}</h1>
                    <div class="text-sm xl:text-lg lg:text-lg text-center">
                        Retail: <span  class="font-bold"> ${showtime.getPrice()}đ</span>
                    </div>
                </div>
                <c:if test = "${sessionScope.state == 'book_success'}">                    
                    <div class="flex items-center p-4 mb-4 text-sm text-green-800 rounded
                         dark:bg-gray-800 dark:text-green-400" role="alert">
                        <svg class="flex-shrink-0 inline w-4 h-4 me-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z"/>
                        </svg>
                        <div>
                            <span class="font-medium">Booking successful! Your seats are now reserved. Enjoy the show!</span>                        </div>
                    </div>
                    <c:remove var="state" scope="session"/>

                </c:if>
                <c:if test = "${sessionScope.state == 'book_fail'}">
                    <div class="flex items-center p-4 mb-4 text-sm text-green-800 rounded
                         dark:bg-gray-800 dark:text-red-400" role="alert">
                        <svg class="flex-shrink-0 inline w-4 h-4 me-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z"/>
                        </svg>
                        <div>
                            <span class="font-medium">Booking unsuccessful. Insufficient funds in your account.</span>                        </div>
                    </div>
                    <c:remove var="state" scope="session"/>
                </c:if>

                <form action="<%=root%>/showing/film/seat" method="POST" class="flex justify-center" onsubmit="prepareData();
                      ">
                    <input type="hidden" name="action" value="bookingSeats">
                    <input type="hidden" name="seatNumbers" id="seatNumbersInput">
                    <input type="hidden" name="showtimeId" value="${showtime.getShowtimeId()}">
                    <button class="bg-red-600 rounded w-1/2 text-center text-white p-3 hover:shadow-2xl shadow-black text-lg font-bold uppercase" type="submit">
                        Buy ticket
                    </button>
                </form>


            </div>
        </div>
    </div>

    <script>
        var listSeatNumber = [];
        function changeColor(input, seatNumber) {
            if (input.classList.contains('bg-green-600')) {
                input.classList.remove('bg-green-600');
                input.classList.add('bg-slate-600');
                const index = listSeatNumber.indexOf(seatNumber);
                if (index > -1) {
                    listSeatNumber.splice(index, 1);
                }

                //                console.log(listSeatNumber);

            } else {
                input.classList.remove('bg-slate-600');
                input.classList.add('bg-green-600');
                const index = listSeatNumber.indexOf(seatNumber);
                if (!listSeatNumber.includes(seatNumber)) {
                    listSeatNumber.push(seatNumber);
                }
                //                console.log(listSeatNumber);

            }

            var purpleRangeStart = 31;
            var purpleRangeEnd = 60;

            if (seatNumber >= purpleRangeStart && seatNumber <= purpleRangeEnd) {
                if (input.classList.contains('bg-purple-600')) {
                    input.classList.remove('bg-purple-600');
                    input.classList.add('bg-green-600');
                    if (!listSeatNumber.includes(seatNumber)) {
                        listSeatNumber.push(seatNumber);
                    }

                    //                    console.log(listSeatNumber);

                } else {
                    input.classList.remove('bg-green-600');
                    input.classList.remove('bg-slate-600');
                    input.classList.add('bg-purple-600');
                    const index = listSeatNumber.indexOf(seatNumber);
                    if (index > -1) {
                        listSeatNumber.splice(index, 1);
                    }
                    //                    console.log(listSeatNumber);
                }
            } else {
                if (input.classList.contains('bg-purple-600' || 'bg-slate-600')) {
                    input.classList.remove('bg-slate-600');
                    input.classList.add('bg-green-600');
                }
            }
            console.log(listSeatNumber);
        }
        function prepareData() {
            document.getElementById('seatNumbersInput').value = listSeatNumber.join(',');
        }


    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.1.1/flowbite.min.js"></script>
</div>
</body>

</html>