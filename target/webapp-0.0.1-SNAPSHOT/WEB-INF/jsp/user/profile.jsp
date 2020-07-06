<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


    <%@ include file="../includes/head.jsp"%>

    <body class="font-sans bg-gray-100">
    <div id="app">

    <jsp:include page="../includes/nav.jsp"></jsp:include>

    <div class=" min-h-screen">
        <div class="py-4 md:py-10">
            <div class="max-w-4xl mx-auto px-4 sm:px-4 lg:px-4">
                <div class="bg-white rounded-lg shadow p-6">
                    <div>
                        <h2 class="text-xl font-bold text-gray-900 sm:text-md  sm:truncate">
                           My profile
                        </h2>
                        <!-- <div class="mt-2 flex items-center text-sm leading-5 text-gray-500">
                        </div> -->
                    </div>

                    <form:form modelAttribute="userForm">

                    <div class="mt-4 grid grid-cols-1 row-gap-6 col-gap-4 sm:grid-cols-6">



                        <div class="sm:col-span-6">
                            <label class="block text-sm font-medium leading-5 text-gray-700">
                                <spring:message code="user.username.label" />
                            </label>
                            <div class="mt-1 rounded-md shadow-sm">
                                <form:input path="username" disabled="true" cssClass="form-input block w-full bg-gray-100 transition duration-150 ease-in-out sm:text-sm sm:leading-5 " />
                            </div>
                            <p class="mt-1 text-sm mb-4 text-red-500">
                                <form:errors path="username"></form:errors>
                            </p>
                        </div>

                        <div class="sm:col-span-6">
                            <label class="block text-sm font-medium leading-5 text-gray-700">
                                <spring:message code="user.firstName.label" />
                            </label>
                            <div class="mt-1 rounded-md shadow-sm">
                                <form:input path="firstName" cssClass="form-input block w-full transition duration-150 ease-in-out sm:text-sm sm:leading-5 " />
                            </div>
                            <p class="mt-1 text-sm mb-4 text-red-500">
                                <form:errors path="firstName"></form:errors>
                            </p>
                        </div>

                        <div class="sm:col-span-6">
                            <label class="block text-sm font-medium leading-5 text-gray-700">
                                <spring:message code="user.lastName.label" />
                            </label>
                            <div class="mt-1 rounded-md shadow-sm">
                                <form:input path="lastName" cssClass="form-input block w-full transition duration-150 ease-in-out sm:text-sm sm:leading-5 " />
                            </div>
                            <p class="mt-1 text-sm mb-4 text-red-500">
                                <form:errors path="lastName"></form:errors>
                            </p>
                        </div>

                        <div class="sm:col-span-6">
                            <label class="block text-sm font-medium leading-5 text-gray-700">
                                <spring:message code="user.password.label" />
                            </label>
                            <div class="mt-1 rounded-md shadow-sm">
                                <form:password path="password" cssClass="form-input block w-full transition duration-150 ease-in-out sm:text-sm sm:leading-5 " />
                            </div>
                            <p class="mt-1 text-sm mb-4 text-red-500">
                                <form:errors path="password"></form:errors>
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

    <%@ include file="../includes/footer.jsp"%>