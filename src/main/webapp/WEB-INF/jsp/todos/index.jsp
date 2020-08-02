<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>



<%@ include file="../includes/head.jsp"%>

<body class="font-sans bg-gray-100">
<div id="app">

    <jsp:include page="../includes/nav.jsp"></jsp:include>

    <div class=" min-h-screen">
        <div class="py-4">
            <div class="max-w-4xl mx-auto px-4 sm:px-4 lg:px-4">

                <div class="bg-white rounded-lg shadow p-6">
                    <div class="flex justify-between">
                        <nav class="flex items-center text-sm leading-5 font-medium">
                            <a href="${contextUrl}/projects" class="text-gray-500 hover:text-gray-700 transition duration-150 ease-in-out">
                                Home
                            </a>
                            <svg class="flex-shrink-0 mx-2 h-5 w-5 text-gray-400" viewBox="0 0 20 20" fill="currentColor">
                                <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <a href="${contextUrl}/project/${project.id}" class="text-gray-500 hover:text-gray-700 transition duration-150 ease-in-out">
                                ${project.name}

                            </a>
                        </nav>

                        <div>
                                <span class="inline-flex rounded-full shadow-sm">

                                   <a href="${contextUrl}/project/${project.id}/todo/new" class="inline-flex items-center px-2 py-1 border border-transparent text-sm leading-5 font-medium rounded-lg text-white bg-indigo-600 hover:bg-indigo-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition ease-in-out duration-150">
                                       New
                                   </a>
                               </span>
                        </div>

                    </div>
                    <div class="mt-2">
                        <div class="flex justify-between">
                            <div class="text-xl font-bold text-gray-900 sm:text-md  sm:truncate">
                                To-dos
                            </div>
                        </div>
                        <%-- <div class="mt-1 flex items-center text-sm leading-5 text-gray-500">
                            ${project.description}
                        </div> --%>

                        <div class="mt-1 flex items-center text-sm leading-5 text-gray-500">
                            Make list of work that needs to get done, assign items, set due dates, and discuss.
                        </div>

                    </div>

                    <div class="mt-2">
                        <ul>
                            <c:forEach items="${pendingTodos}" var="todo">
                            <li>
                                <a href="${contextUrl}/project/${project.id}/todo/${todo.id}" class="block py-2 hover:bg-gray-50 focus:outline-none focus:bg-gray-50 transition duration-150 ease-in-out">
                                    <div class="flex items-center justify-between">
                                        <div class="min-w-0 flex-1 flex items-center">
                                            <%--
                                            <div class="flex-shrink-0">
                                                <img class="h-12 w-12 rounded-full" src="${contextUrl}/avatar/${todo.createdBy.id}/${todo.createdBy.firstName.charAt(0)}${todo.createdBy.lastName.charAt(0)}.svg" alt="" title="${todo.createdBy.firstName} ${todo.createdBy.lastName}">
                                            </div>
                                            --%>

                                            <div class="min-w-0 flex-1 px-4 mr-4">
                                                <div>
                                                    <%-- <div class="leading-5 font-medium font-gray-900 truncate">
                                                        ${message.title}
                                                    </div> --%>
                                                    <div class=" leading-5 flex">
                                                        <span class="font-gray-900 mr-2">${todo.description}</span>
                                                        <c:if test="${todo.comments.size() != 0}">
                                                            <span class="h-5 w-5 text-center rounded-full bg-indigo-600 text-white text-xs mr-2">
                                                                    ${todo.comments.size()}
                                                            </span>
                                                        </c:if>

                                                        <span class="mr-1">
                                                            <img class="h-5 w-5 rounded-full" src="${contextUrl}/avatar/${todo.assignedTo.id}/${todo.assignedTo.firstName.charAt(0)}${todo.assignedTo.lastName.charAt(0)}.svg" alt="" title="${todo.assignedTo.firstName} ${todo.assignedTo.lastName}">
                                                        </span>
                                                        <span class="text-gray-600 text-sm mr-2">
                                                                ${todo.assignedTo.firstName} ${todo.assignedTo.lastName.charAt(0)}.
                                                        </span>
                                                        <span class="mr-1">
                                                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="h-5 w-5 text-gray-600">
                                                              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                                            </svg>

                                                        </span>
                                                        <span class="text-gray-600 text-sm">
                                                            <c:if test="${todo.dueDate.time == null}">
                                                                No due date
                                                            </c:if>
                                                            <c:if test="${todo.dueDate.time != null}">
                                                                <fmt:formatDate value="${todo.dueDate.time}" pattern="MMM dd, yyyy"/>
                                                            </c:if>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </a>
                            </li>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="mt-4" id="add-a-todo-div">

                    <a href="${contextUrl}/project/${project.id}/todo/new" class="py-2 px-4 border border-gray-300 rounded-full text-sm leading-5 font-medium text-gray-700 hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue active:bg-gray-50 active:text-gray-800 transition duration-150 ease-in-out">
                        Add a to-do
                    </a>

                    </div>

                    <div class="mt-8">

                        <div class="flex">
                            <span class="text-xl font-bold text-gray-900 sm:text-md  sm:truncate">Completed To-dos</span>
                        </div>

                        <ul>
                            <c:forEach items="${completedTodos}" var="todo">
                                <li>
                                    <a href="${contextUrl}/project/${project.id}/todo/${todo.id}" class="block py-2 hover:bg-gray-50 focus:outline-none focus:bg-gray-50 transition duration-150 ease-in-out">
                                        <div class="flex items-center justify-between">
                                            <div class="min-w-0 flex-1 flex items-center">
                                                    <%--
                                                    <div class="flex-shrink-0">
                                                        <img class="h-12 w-12 rounded-full" src="${contextUrl}/avatar/${todo.createdBy.id}/${todo.createdBy.firstName.charAt(0)}${todo.createdBy.lastName.charAt(0)}.svg" alt="" title="${todo.createdBy.firstName} ${todo.createdBy.lastName}">
                                                    </div>
                                                    --%>

                                                <div class="min-w-0 flex-1 px-4 mr-4">
                                                    <div>
                                                            <%-- <div class="leading-5 font-medium font-gray-900 truncate">
                                                                ${message.title}
                                                            </div> --%>
                                                        <div class=" leading-5 flex">
                                                            <span class="font-gray-900 mr-2">${todo.description}</span>
                                                            <c:if test="${todo.comments.size() != 0}">
                                                            <span class="h-5 w-5 text-center rounded-full bg-indigo-600 text-white text-xs mr-2">
                                                                    ${todo.comments.size()}
                                                            </span>
                                                            </c:if>

                                                            <span class="mr-1">
                                                            <img class="h-5 w-5 rounded-full" src="${contextUrl}/avatar/${todo.assignedTo.id}/${todo.assignedTo.firstName.charAt(0)}${todo.assignedTo.lastName.charAt(0)}.svg" alt="" title="${todo.assignedTo.firstName} ${todo.assignedTo.lastName}">
                                                        </span>
                                                            <span class="text-gray-600 text-sm mr-2">
                                                                ${todo.assignedTo.firstName} ${todo.assignedTo.lastName.charAt(0)}.
                                                        </span>
                                                            <span class="mr-1">
                                                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="h-5 w-5 text-gray-600">
                                                              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                                            </svg>

                                                        </span>
                                                            <span class="text-gray-600 text-sm">
                                                            <c:if test="${todo.dueDate.time == null}">
                                                                No due date
                                                            </c:if>
                                                            <c:if test="${todo.dueDate.time != null}">
                                                                <fmt:formatDate value="${todo.dueDate.time}" pattern="MMM dd, yyyy"/>
                                                            </c:if>
                                                        </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </a>
                                </li>
                            </c:forEach>
                      </ul></div>

                </div>
            </div>
        </div>
    </div>
</div>


    <%@ include file="../includes/notifications.jsp"%>

    <%@ include file="../includes/footer.jsp"%>




