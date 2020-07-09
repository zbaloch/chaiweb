<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<body class="font-sans bg-gray-100">
<div id="app">

    <%@ include file="includes/head.jsp"%>

<jsp:include page="includes/nav.jsp"></jsp:include>

<div class=" min-h-screen">
    <div class="py-4">

        <div class="flex flex-col justify-center sm:px-6 lg:px-8">
            <div class="sm:mx-auto sm:w-full sm:max-w-md">
                <h2 class="mt-6 text-center text-3xl leading-9 font-extrabold text-gray-900">
                    Reset
                </h2>
                <p class="mt-2 text-center text-sm leading-5 text-gray-600">
                    or
                    <a class="font-medium text-indigo-600 hover:text-indigo-500 focus:outline-none focus:underline transition ease-in-out duration-150" href="${contextUrl}/login">
                        sign in if you have already have an account</a>
                </p>
            </div>

            <div class="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
                <c:if test="${message != null}">
                    <div class="rounded-md bg-green-50 p-4">
                        <div class="flex">

                            <div class="ml-3">
                                <h3 class="text-sm leading-5 font-medium text-green-700 ">
                                    ${message}
                                </h3>
                            </div>
                        </div>
                    </div>
                </c:if>

                <c:if test="${error != null}">
                    <div class="rounded-md bg-red-50 p-4">
                        <div class="flex">

                            <div class="ml-3">
                                <h3 class="text-sm leading-5 font-medium text-red-700 ">
                                        ${error}
                                </h3>
                            </div>
                        </div>
                    </div>
                </c:if>


                <div class="bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10 mt-4">


                    <form:form action="${contextPath}/reset" accept-charset="UTF-8" method="post" modelAttribute="userForm">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                        <div>
                            <label for="username" class="block text-sm font-medium leading-5 text-gray-700">
                                Email address
                            </label>
                            <div class="mt-1 rounded-md shadow-sm">
                                <input type="email" class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5" name="username" id="username">
                            </div>
                        </div>

                        <div class="mt-6">
                          <span class="block w-full rounded-md shadow-sm">
                            <button type="submit" class="w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition duration-150 ease-in-out">
                              Reset password
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
