<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>

<jsp:useBean id="now" class="java.util.Date" />

<%@ include file="../includes/head.jsp"%>

<body class="font-sans bg-gray-100">
<div id="app">

    <jsp:include page="../includes/nav.jsp"></jsp:include>

    <div class=" min-h-screen">
        <div class="py-4">
            <div class="max-w-4xl mx-auto px-4 sm:px-4 lg:px-4">

                <div class="bg-white rounded-lg shadow p-6">
                    <div>
                        <h2 class="text-xl font-bold text-gray-900 sm:text-md  sm:truncate">
                            Update timesheet entry
                        </h2>
                        <!-- <div class="mt-2 flex items-center text-sm leading-5 text-gray-500">

                        </div> -->

                    </div>



                    <form:form modelAttribute="timesheet">

                        <div class="mt-4 grid grid-cols-1 row-gap-6 col-gap-4 sm:grid-cols-6">
                            <div class="sm:col-span-3">
                                <label class="block text-sm font-medium leading-5 text-gray-700">
                                    Task
                                </label>
                                <div class="mt-1 rounded-md shadow-sm">
                                    <form:input path="task" cssClass="form-input block w-full transition duration-150 ease-in-out sm:text-sm sm:leading-5 " />
                                </div>
                                <p class="mt-1 text-sm mb-4 text-red-500">
                                    <form:errors path="task"></form:errors>
                                </p>
                            </div>

                            <div class="sm:col-span-3">
                                <label for="timeLogDate" class="block text-sm font-medium leading-5 text-gray-700" wfd-id="81">
                                    Date
                                </label>
                                <div class="mt-1 rounded-md">

                                    <input type="date" id="timeLogDate" name="timeLogDate"
                                           value="<fmt:formatDate pattern = "yyyy-MM-dd" value = "${timesheet.timeLogDate}" />"
                                           class=" form-input block w-full pl-3 py-2 text-base leading-6 border-gray-300 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 sm:text-sm sm:leading-5">

                                    <p class="mt-1 text-sm mb-4 text-red-500">
                                        <form:errors path="timeLogDate"></form:errors>
                                    </p>

                                </div>

                            </div>




                            <div class="sm:col-span-3">
                                <label for="projectId" class="block text-sm font-medium leading-5 text-gray-700" wfd-id="81">
                                    Project
                                </label>
                                <div class="mt-1 rounded-md shadow-sm">
                                    <form:select path="projectId" id="projectId" class="mt-1 form-select block w-full pl-3 pr-10 py-2 text-base leading-6 border-gray-300 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 sm:text-sm sm:leading-5">
                                        <c:forEach items="${projects}" var="project">
                                            <option value="${project.id}">${project.name}</option>
                                        </c:forEach>
                                    </form:select>
                                </div>
                            </div>


                            <div class="sm:col-span-3">
                                <label for="manHours" class="block text-sm font-medium leading-5 text-gray-700" wfd-id="81">
                                    Time spent in hour(s)
                                </label>
                                <div class="mt-1 rounded-md shadow-sm">
                                    <form:input path="manHours" cssClass="form-input block w-full transition duration-150 ease-in-out sm:text-sm sm:leading-5 "/>
                                </div>
                                <p class="mt-1 text-sm mb-4 text-red-500">
                                    <form:errors path="manHours"></form:errors>
                                </p>
                            </div>


                            <div class="sm:col-span-6">
                                <label class="block text-sm font-medium leading-5 text-gray-700">
                                    Notes (supports markdown)
                                </label>
                                <div class="mt-1 rounded-md shadow-sm">
                                    <form:textarea path="notes" cssClass="form-input block w-full transition duration-150 ease-in-out sm:text-sm sm:leading-5 "></form:textarea>
                                </div>
                                <p class="mt-1 text-sm mb-4 text-red-500">
                                    <form:errors path="notes"></form:errors>
                                </p>
                            </div>





                        </div>


                        <div class="mt-8 border-t border-gray-200 pt-5">
                            <div class="flex justify-end">
        <span class="inline-flex rounded-md shadow-sm">
            <a href="${contextUrl}/projects" class="py-2 px-4 border border-gray-300 rounded-md text-sm leading-5 font-medium text-gray-700 hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue active:bg-gray-50 active:text-gray-800 transition duration-150 ease-in-out">Cancel</a>
        </span>
                                <span class="ml-3 inline-flex rounded-md shadow-sm">
                    <input type="submit" value="Save" class="inline-flex justify-center py-2 px-4 border border-transparent text-sm leading-5 font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition duration-150 ease-in-out"/>
                </span>
                            </div>
                        </div>


                    </form:form>


                </div>



                <jsp:include page="../includes/notifications.jsp"></jsp:include>

            </div>
        </div>
    </div>

</div>

<%@ include file="../includes/footer.jsp"%>

