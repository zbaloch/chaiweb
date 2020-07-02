<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <%@ include file="../includes/head.jsp"%>
    </head>
    <body class="font-sans bg-gray-100">
    <div id="app">


    <jsp:include page="../includes/nav.jsp"></jsp:include>

    <div class=" min-h-screen">
        <div class="py-10">
            <div class="max-w-4xl mx-auto px-4 sm:px-4 lg:px-4">

                <div class="bg-white rounded-lg shadow p-6">
                    <div>
                        <nav class="sm:flex items-center text-sm leading-5 font-medium">
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
                    <div class="mt-2">
                        <div class="flex justify-between">
                            <div class="text-xl font-bold text-gray-900 sm:text-md  sm:truncate">
                                Docs & Files
                            </div>
                            <div>
                                <span class="inline-flex rounded-full shadow-sm">
                                   <a href="${contextUrl}/project/${project.id}/file/new" class="inline-flex items-center px-2 py-1 border border-transparent text-sm leading-5 font-medium rounded-full text-white bg-indigo-600 hover:bg-indigo-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition ease-in-out duration-150">
                                       New
                                   </a>
                               </span>
                            </div>
                            <c:if test="${project.createdBy == sessionScope.current_user.id}">
                                <div data-controller="nav" class="relative">
                                    <button class="text-gray-800 font-bold z-10 relative" data-action="click -> nav#toggleProjectActions">
                                        <svg class="fill-current w-4 h-4 mr-2" fill="none" stroke-
                                                ="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 20 20" stroke="currentColor">
                                            <path d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z"></path>
                                        </svg>
                                    </button>
                                    <button data-target="nav.toggleProjectActionsButton" tab-index="-1" data-action="click -> nav#toggleProjectActions" class="fixed inset-0 h-full w-full hidden cursor-default"></button>
                                    <div data-target="nav.projectActions" class="absolute right-0 hidden mt-2 py-2 w-24 bg-white rounded-lg shadow-xl">
                                        <a class="block px-4 py-1 text-gray-800 hover:bg-indigo-500 hover:text-white " href="/projects/2/edit">Edit</a>
                                        <a class="block px-4 py-1 text-red-600 hover:bg-red-500 hover:text-white" data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/projects/2">Delete</a>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                        <div class="mt-2 flex items-center text-sm leading-5 text-gray-500">
                            ${project.description}
                        </div>



                    </div>

                    <div>
                        <c:forEach items="${activeStorageFiles}" var="activeStorageFile">
                            <div>
                                ${activeStorageFile.fileName} - ${activeStorageFile.description}
                            </div>
                        </c:forEach>

                        <%-- <c:forEach items="files" var="file">
                            ${file}
                        </c:forEach> --%>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="../includes/notifications.jsp"%>

    </div>
    </body>
</html>

