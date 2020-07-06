<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


        <%@ include file="../includes/head.jsp"%>

<body class="font-sans bg-gray-100">
<div id="app">


    <jsp:include page="../includes/nav.jsp"></jsp:include>

    <div class=" min-h-screen">
        <div class="py-4 md:py-10">


                <div class="max-w-4xl mx-auto px-4 sm:px-4 lg:px-4">



                    <div class="bg-white rounded-lg shadow p-6" wfd-id="247">
                        <div wfd-id="259">
                            <div class="flex justify-between" wfd-id="260">
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
                            </div>
                        </div>
                        <div class="mt-2">
                            <div class="flex justify-between">
                                <div class="text-xl font-bold text-gray-900 sm:text-md  sm:truncate">
                                    Add or remove users from ${project.name}
                                </div>
                            </div>
                            <div class="mt-1 flex items-center text-sm leading-5 text-gray-500">
                                Use the list of all users show below to add or remove users from ${project.name}
                            </div>


                            </div>

                        <div class="mt-4">
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
                        </div>

                    <%-- <div class="mt-4 mb-8" wfd-id="137">
                        <div class="flex flex-wrap -mx-3" wfd-id="138">
                            <div class="w-full md:w-1/2 lg:w-1/3 px-3 mb-8" wfd-id="142">
                                <a href="/chaiweb/project/29" class="no-underline bg-white rounded-lg shadow hover:shadow-raised hover:translateY-2px transition flex-1 flex flex-col">
                                    <div class="p-6 flex flex-col" wfd-id="143">
                                        <h3 class="font-display text-black no-underline mb-2 font-bold">
                                            Design Team
                                        </h3>
                                        <div class="text-gray-700 text-sm" wfd-id="144">
                                            Design team
                                        </div>
                                    </div>
                                </a>
                            </div>

                            <div class="w-full md:w-1/2 lg:w-1/3 px-3 mb-8" wfd-id="142">
                                <a href="/chaiweb/project/29" class="no-underline bg-white rounded-lg shadow hover:shadow-raised hover:translateY-2px transition flex-1 flex flex-col">
                                    <div class="p-6 flex flex-col" wfd-id="143">
                                        <h3 class="font-display text-black no-underline mb-2 font-bold">
                                            Design Team
                                        </h3>
                                        <div class="text-gray-700 text-sm" wfd-id="144">
                                            Design team
                                        </div>
                                    </div>
                                </a>
                            </div>

                        </div>
                    </div>

                    --%>


                    <div class="flex flex-col mt-4">
                        <div class="-my-2 py-2 overflow-x-auto sm:-mx-6 sm:px-6 lg:-mx-8 lg:px-8">
                            <div class="align-middle inline-block min-w-full shadow overflow-hidden sm:rounded-lg border-b border-gray-200">
                                <table class="min-w-full">
                                    <thead>
                                    <tr>
                                        <th class="px-6 py-3 border-b border-gray-200 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">
                                            Name
                                        </th>
                                        <%-- <th class="px-6 py-3 border-b border-gray-200 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">
                                            Title
                                        </th>
                                        <th class="px-6 py-3 border-b border-gray-200 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">
                                            Status
                                        </th>
                                        <th class="px-6 py-3 border-b border-gray-200 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">
                                            Role
                                        </th> --%>
                                        <th class="px-6 py-3 border-b border-gray-200 bg-gray-50"></th>
                                    </tr>
                                    </thead>
                                    <tbody class="bg-white">
                                    <c:forEach items="${users}" var="user">
                                    <tr>
                                        <td class="px-6 py-4 whitespace-no-wrap border-b border-gray-200">
                                            <div class="flex items-center">
                                                <div class="flex-shrink-0 h-10 w-10">
                                                    <img class="h-10 w-10 rounded-full" src="https://avatars.wip.chat/${user.id}.svg?text=${user.firstName.charAt(0)}${user.lastName.charAt(0)}" alt="" />
                                                </div>
                                                <div class="ml-4">
                                                    <div class="text-sm leading-5 font-medium text-gray-900">${user.firstName} ${user.lastName}</div>
                                                    <div class="text-sm leading-5 text-gray-500">${user.username}</div>
                                                </div>
                                            </div>
                                        </td>

                                        <%-- <td class="px-6 py-4 whitespace-no-wrap border-b border-gray-200">
                                            <div class="text-sm leading-5 text-gray-900">Director</div>
                                            <div class="text-sm leading-5 text-gray-500">Human Resources</div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-no-wrap border-b border-gray-200">
              <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
                Active
              </span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-no-wrap border-b border-gray-200 text-sm leading-5 text-gray-500">
                                            Owner
                                        </td> --%>
                                        <td class="px-6 py-4 whitespace-no-wrap text-right border-b border-gray-200 text-sm leading-5 font-medium">
                                            <c:if test="${user.addedAlready == true}">
                                                <form:form modelAttribute="puf">
                                                    <form:input type="hidden" path="action" value="remove"/>
                                                    <form:input type="hidden" path="projectId" value="${project.id}"/>
                                                    <form:input type="hidden" path="userId" value="${user.id}"/>
                                                    <button type="submit" class="text-red-500 hover:text-red-800">Remove</button>
                                                </form:form>
                                            </c:if>
                                            <c:if test="${user.addedAlready == false}">
                                                <form:form modelAttribute="puf">
                                                    <form:input type="hidden" path="action" value="add"/>
                                                    <form:input type="hidden" path="projectId" value="${project.id}"/>
                                                    <form:input type="hidden" path="userId" value="${user.id}"/>
                                                    <button type="submit" class="text-indigo-600 hover:text-indigo-900">Add</button>
                                                </form:form>
                                            </c:if>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>


                </div>

        </div>
    </div>
    <jsp:include page="../includes/notifications.jsp"></jsp:include>


    <%@ include file="../includes/footer.jsp"%>
