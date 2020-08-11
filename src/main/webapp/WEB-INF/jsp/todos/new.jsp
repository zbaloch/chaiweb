<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="for" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ include file="../includes/head.jsp"%>

<body class="font-sans bg-gray-100">

<div id="app">

<jsp:include page="../includes/nav.jsp"></jsp:include>

<div class=" min-h-screen">
    <div class="py-4">

<div class="max-w-4xl mx-auto px-4 sm:px-4 lg:px-4">

    <div class="bg-white rounded-lg shadow p-6">

        <div>
            <nav class="flex items-center text-sm leading-5 font-medium">
                <a href="${contextUrl}/projects" class="text-gray-500 hover:text-gray-700 transition duration-150 ease-in-out">
                    Home
                </a>
                <svg class="flex-shrink-0 mx-2 h-5 w-5 text-gray-400" viewBox="0 0 20 20" fill="currentColor">
                    <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
                </svg>
                <a href="${contextUrl}/project/${project.id}" class="text-gray-500 hover:text-gray-700 transition duration-150 ease-in-out">
                    ${project.name}
                </a>

                <svg class="flex-shrink-0 mx-2 h-5 w-5 text-gray-400" viewBox="0 0 20 20" fill="currentColor">
                    <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
                </svg>
                <a href="${contextUrl}/project/${project.id}/todos" class="text-gray-500 hover:text-gray-700 transition duration-150 ease-in-out">
                    To-dos
                </a>

            </nav>
        </div>

        <div class="mt-2">
            <h2 class="text-xl font-bold text-gray-900 sm:text-md  sm:truncate">
                New To-do<%-- Todo this should let the user create a document or created folders as well later --%>
            </h2>
        </div>

        <div class="">
            <form:form modelAttribute="todo">
                <div>
                    <div>
                        <div class="mt-6 grid grid-cols-1 row-gap-6 col-gap-4 sm:grid-cols-6">

                            <div class="sm:col-span-6">
                                <label for="description" class="block text-sm font-medium leading-5 text-gray-700" wfd-id="81">
                                    Description
                                </label>
                                <div class="mt-1 rounded-md shadow-sm">
                                    <%-- <input type="text" class="form-input block w-full transition duration-150 ease-in-out sm:text-sm sm:leading-5"/> --%>
                                    <form:input path="description" cssClass="form-input block w-full transition duration-150 ease-in-out sm:text-sm sm:leading-5" placeholder="Type a title..."></form:input>
                                        <p class="mt-1 text-sm mb-4 text-red-500">
                                            <form:errors path="description"></form:errors>
                                        </p>
                                </div>
                            </div>

                            <div class="sm:col-span-3">
                                <label for="assignedToVariable" class="block text-sm font-medium leading-5 text-gray-700" wfd-id="81">
                                    Assigned to
                                </label>
                                <div class="mt-1 rounded-md shadow-sm">
                                    <form:select path="assignedToVariable" id="location" class="mt-1 form-select block w-full pl-3 pr-10 py-2 text-base leading-6 border-gray-300 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 sm:text-sm sm:leading-5">
                                        <c:forEach items="${project.users}" var="user">
                                            <option value="${user.id}">${user.firstName} ${user.lastName}</option>
                                        </c:forEach>
                                        <c:if test="${project.user.id == sessionScope.current_user.id}">
                                            <option value="${sessionScope.current_user.id}">${sessionScope.current_user.firstName} ${sessionScope.current_user.lastName}</option>
                                        </c:if>
                                        <c:if test="${project.user.id != sessionScope.current_user.id}">
                                            <option value="${project.user.id}">${project.user.firstName} ${project.user.lastName}</option>
                                        </c:if>
                                    </form:select>
                                </div>
                            </div>

                            <div class="sm:col-span-3">
                                <label for="dueDateVariable" class="block text-sm font-medium leading-5 text-gray-700" wfd-id="81">
                                    Due on
                                </label>
                                <div class="mt-1 rounded-md">

                                    <input type="date" id="dueDateVariable" name="dueDateVariable" value="2020-08-11"
                                            class=" form-input block w-full pl-3 py-2 text-base leading-6 border-gray-300 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 sm:text-sm sm:leading-5">

                                    <p class="mt-1 text-sm mb-4 text-red-500">
                                        <form:errors path="dueDateVariable"></form:errors>
                                    </p>

                                </div>

                            </div>

                            <script type="x-template" id="editor-template">
                                <div>

                                    <input type="hidden" id="x" name="notes"/>
                                        <%-- <form:hidden path="content"/> --%>
                                    <trix-editor input="x" class="trix-editor-message"></trix-editor>
                                </div>
                            </script>

                            <div class="sm:col-span-6">
                                <label for="notes" class="block text-sm font-medium leading-5 text-gray-700" wfd-id="81">
                                    Notes
                                </label>
                                <editor></editor>
                            </div>

                        </div>
                    </div>

                </div>
                <div class="mt-8 border-t border-gray-200 pt-5">
                    <div class="flex justify-end">
      <span class="inline-flex rounded-md shadow-sm">
        <a href="${contextUrl}/project/${project.id}/todos" type="button" class="py-2 px-4 border border-gray-300 rounded-md text-sm leading-5 font-medium text-gray-700 hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue active:bg-gray-50 active:text-gray-800 transition duration-150 ease-in-out">
          Cancel
        </a>
      </span>
                        <span class="ml-3 inline-flex rounded-md shadow-sm">
        <button type="submit" class="inline-flex justify-center py-2 px-4 border border-transparent text-sm leading-5 font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition duration-150 ease-in-out">
          Save
        </button>
      </span>
                    </div>
                </div>
            </form:form>

        </div>

    </div>
</div>

</div>

</div>

</div>


<jsp:include page="../includes/notifications.jsp"></jsp:include>

<script>
    // Vue.config.ignoredElements = ['trix-editor'];
    Vue.component("editor", {
        template: "#editor-template"
    });


</script>


<%@ include file="../includes/footer.jsp"%>