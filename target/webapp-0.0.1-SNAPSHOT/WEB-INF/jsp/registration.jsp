<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<%@ include file="includes/head.jsp"%>

<body class="font-sans bg-gray-100">
<div id="app">

<jsp:include page="includes/nav.jsp"></jsp:include>

<div class=" min-h-screen">

            <div class="py-10">

                <div class="flex flex-col justify-center sm:px-6 lg:px-8">
                    <div class="sm:mx-auto sm:w-full sm:max-w-md">
                        <h2 class="mt-6 text-center text-3xl leading-9 font-extrabold text-gray-900">
                            Sign up
                            <p class="mt-2 text-center text-sm leading-5 text-gray-600">
                                or
                                <a class="font-medium text-indigo-600 hover:text-indigo-500 focus:outline-none focus:underline transition ease-in-out duration-150" href="${contextPath}/login">sign in if you have already joined</a>
                            </p>
                        </h2>
                    </div>

                    <div class="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
                        <div class="bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
                            <form:form method="POST" modelAttribute="userForm">
                                <div>
                                    <spring:bind path="firstName">
                                        <label for="firstName" class="block text-sm font-medium leading-5 text-gray-700">
                                            First name
                                        </label>
                                        <div class="mt-1 rounded-md shadow-sm">
                                            <form:input type="text" path="firstName" class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5"
                                                        placeholder="First name"></form:input>
                                        </div>
                                        <p class="mt-1 text-sm mb-4 text-red-500">
                                            <form:errors path="firstName"></form:errors>
                                        </p>
                                        <%-- <div class="form-group ${status.error ? 'has-error' : ''}">

                                        </div> --%>
                                    </spring:bind>
                                </div>
                                <div>
                                    <spring:bind path="lastName">
                                        <label for="lastName" class="block text-sm font-medium leading-5 text-gray-700">
                                            Last name
                                        </label>
                                        <div class="mt-1 rounded-md shadow-sm">
                                            <form:input type="text" path="lastName" class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5"
                                                        placeholder="Last name"></form:input>
                                        </div>
                                        <p class="mt-1 text-sm mb-4 text-red-500">
                                            <form:errors path="lastName"></form:errors>
                                        </p>
                                        <%-- <div class="form-group ${status.error ? 'has-error' : ''}">

                                        </div> --%>
                                    </spring:bind>
                                </div>

                                <div>
                                    <spring:bind path="username">
                                        <label for="username" class="block text-sm font-medium leading-5 text-gray-700">
                                            Email
                                        </label>
                                        <div class="mt-1 rounded-md shadow-sm">
                                            <form:input type="email" path="username" class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5"
                                                        placeholder="john@doe.com"></form:input>
                                        </div>
                                        <p class="mt-1 text-sm mb-4 text-red-500">
                                            <form:errors path="username"></form:errors>
                                        </p>
                                        <%-- <div class="form-group ${status.error ? 'has-error' : ''}">

                                        </div> --%>
                                    </spring:bind>
                                </div>

                                <div>
                                    <spring:bind path="password">
                                        <label for="password" class="block text-sm font-medium leading-5 text-gray-700">
                                            Password
                                        </label>
                                        <div class="mt-1 rounded-md shadow-sm">
                                            <form:input type="password" path="password" class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5"
                                                        placeholder="password"></form:input>
                                        </div>
                                        <p class="mt-1 text-sm mb-4 text-red-500">
                                            <form:errors path="password"></form:errors>
                                        </p>
                                        <%-- <div class="form-group ${status.error ? 'has-error' : ''}">

                                        </div> --%>
                                    </spring:bind>
                                </div>


                                <!-- TODO: Gotta do something about roles <input value="candidate" type="hidden" name="user[user_role]" id="user_user_role"> -->
                                <div class="mt-6">
                                  <span class="block w-full rounded-md shadow-sm">
                                      <button class="w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition duration-150 ease-in-out" type="submit">
                                          Sign up
                                      </button>
                                  </span>
                                </div>



                                </form:form>
                                </div>
                    </div>
                </div>

            </div>
        </div>
<%@ include file="includes/footer.jsp"%>
