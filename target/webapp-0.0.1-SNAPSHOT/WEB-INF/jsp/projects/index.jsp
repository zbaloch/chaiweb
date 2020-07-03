<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="../includes/head.jsp"%>

<body class="font-sans bg-gray-100">
<div id="app">

    <jsp:include page="../includes/nav.jsp"></jsp:include>

    <div class=" min-h-screen">
        <div class="py-10">
                <div class="max-w-4xl mx-auto px-4 sm:px-4 lg:px-4">
                    <span class="inline-flex rounded-full shadow-sm mb-4">
                       <a href="project/new" class="inline-flex items-center px-4 py-2 border border-transparent text-sm leading-5 font-medium rounded-full text-white bg-indigo-600 hover:bg-indigo-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition ease-in-out duration-150">
                           Create a project or a team
                       </a>
                   </span>

                    <div class="mb-8">
                        <div class="flex flex-wrap -mx-3">
                            <c:forEach items="${projects}" var="project">
                                <div class="w-full md:w-1/2 lg:w-1/3 px-3 mb-8">
                                    <a class="no-underline bg-white rounded-lg shadow hover:shadow-raised hover:translateY-2px transition flex-1 flex flex-col" href="project/${project.id}">
                                        <div class="p-6 flex flex-col">
                                            <h3 class="font-display text-black no-underline mb-2 font-bold">
                                                ${project.name}
                                            </h3> <!-- TODO: Seed the HQ by default-->
                                            <div class="text-gray-700 text-sm">
                                                ${project.description}
                                            </div>
                                            <%-- <div class="mt-4">
                                                <div class="flex overflow-hidden">
                                                    <img class="inline-block h-8 w-8 rounded-full text-white shadow-solid" src="https://images.unsplash.com/photo-1491528323818-fdd1faba62cc?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=facearea&amp;facepad=2&amp;w=256&amp;h=256&amp;q=80" alt="">
                                                    <img class="-ml-1 inline-block h-8 w-8 rounded-full text-white shadow-solid" src="https://images.unsplash.com/photo-1550525811-e5869dd03032?ixlib=rb-1.2.1&amp;auto=format&amp;fit=facearea&amp;facepad=2&amp;w=256&amp;h=256&amp;q=80" alt="">
                                                    <img class="-ml-1 inline-block h-8 w-8 rounded-full text-white shadow-solid" src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=facearea&amp;facepad=2.25&amp;w=256&amp;h=256&amp;q=80" alt="">
                                                    <img class="-ml-1 inline-block h-8 w-8 rounded-full text-white shadow-solid" src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=facearea&amp;facepad=2&amp;w=256&amp;h=256&amp;q=80" alt="">
                                                </div>
                                            </div> --%>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

        </div>
    </div>
    <jsp:include page="../includes/notifications.jsp"></jsp:include>

<%@ include file="../includes/footer.jsp"%>