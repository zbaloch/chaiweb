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
                                   <a href="${contextUrl}/project/${project.id}/file/new" class="inline-flex items-center px-2 py-1 border border-transparent text-sm leading-5 font-medium rounded-lg text-white bg-indigo-600 hover:bg-indigo-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition ease-in-out duration-150">
                                       New
                                   </a>
                               </span>
                        </div>

                    </div>
                    <div class="mt-2">
                        <div class="flex justify-between">
                            <div class="text-xl font-bold text-gray-900 sm:text-md  sm:truncate">
                                Docs & Files
                            </div>
                        </div>
                        <%-- <div class="mt-1 flex items-center text-sm leading-5 text-gray-500">
                            ${project.description}
                        </div> --%>

                        <div class="mt-1 flex items-center text-sm leading-5 text-gray-500">
                            This is a place to store and organize assets and reference material.
                        </div>


                    </div>

                    <div class="mt-2">

                        <div class="py-6 bg-white">
                            <div class="max-w-xl mx-auto lg:max-w-screen-xl">
                                <div class="lg:grid lg:grid-cols-3 lg:gap-8">
                                    <c:forEach items="${activeStorageFiles}" var="activeStorageFile">
                                    <div class="">
                                        <%-- <div class="flex items-center justify-center h-12 w-12 rounded-md bg-indigo-500 text-white">
                                            <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 12a9 9 0 01-9 9m9-9a9 9 0 00-9-9m9 9H3m9 9a9 9 0 01-9-9m9 9c1.657 0 3-4.03 3-9s-1.343-9-3-9m0 18c-1.657 0-3-4.03-3-9s1.343-9 3-9m-9 9a9 9 0 019-9"/>
                                            </svg>
                                        </div> --%>
                                        <div class="mt-2">
                                            <a href="${contextUrl}/project/${project.id}/file/${activeStorageFile.id}"
                                               target="_blank" class="font-medium text-gray-900 underline">
                                                    ${activeStorageFile.fileName}
                                            </a>
                                            <%-- <p class="mt-1 text-sm text-gray-500">
                                                    ${activeStorageFile.description}
                                            </p> --%>
                                            <div class="text-sm text-gray-500 mt-1">
                                                <%--Posted--%> By ${activeStorageFile.user.firstName} ${activeStorageFile.user.lastName.charAt(0)}. on
                                                <fmt:formatDate value="${activeStorageFile.createdAt.time}" type = "date" dateStyle = "long" timeStyle = "long"></fmt:formatDate>
                                                <%-- · 73 KB --%>
                                            </div>
                                            <%--
                                            <div class="flex-1 min-w-0">

                                                <div class="flex flex-row">
                                                    <div class="mt-1 flex items-center text-sm leading-5 text-gray-500 sm:mr-6 text-sm">
                                                        <svg class="flex-shrink-0 mr-1 h-4 w-4 text-gray-400" viewBox="0 0 20 20" fill="currentColor">
                                                            <path fill-rule="evenodd" d="M6 6V5a3 3 0 013-3h2a3 3 0 013 3v1h2a2 2 0 012 2v3.57A22.952 22.952 0 0110 13a22.95 22.95 0 01-8-1.43V8a2 2 0 012-2h2zm2-1a1 1 0 011-1h2a1 1 0 011 1v1H8V5zm1 5a1 1 0 011-1h.01a1 1 0 110 2H10a1 1 0 01-1-1z" clip-rule="evenodd"></path>
                                                            <path d="M2 13.692V16a2 2 0 002 2h12a2 2 0 002-2v-2.308A24.974 24.974 0 0110 15c-2.796 0-5.487-.46-8-1.308z"></path>
                                                        </svg>
                                                        Full-time
                                                    </div>
                                                    <div class="mt-1 flex items-center text-sm leading-5 text-gray-500 sm:mr-6 text-sm">
                                                        <svg class="flex-shrink-0 mr-1 h-4 w-4 text-gray-400" viewBox="0 0 20 20" fill="currentColor">
                                                            <path fill-rule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" clip-rule="evenodd"></path>
                                                        </svg>
                                                        Remote
                                                    </div>
                                                </div>

                                            </div>
                                            --%>

                                            <%-- <a href="#" class="text-red-500 text-sm">Delete</a> --%>
                                            <%-- <div>
                                                <a href="#" class="text-sm text-blue-500 underline">Download</a>
                                            </div> --%>
                                        </div>
                                    </div>
                                    </c:forEach>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


    <%@ include file="../includes/notifications.jsp"%>

    <%@ include file="../includes/footer.jsp"%>


