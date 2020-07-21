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
                            <svg class="flex-shrink-0 mx-2 h-5 w-5 text-gray-400" viewBox="0 0 20 20" fill="currentColor">
                                <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <a href="${contextUrl}/project/${project.id}/messages" class="text-gray-500 hover:text-gray-700 transition duration-150 ease-in-out">
                                Messages
                            </a>
                        </nav>

                        <div>
                                <span class="inline-flex rounded-full shadow-sm">
                                    <c:if test="${message.user.id == sessionScope.current_user.id}">
                                   <a href="${contextUrl}/project/${project.id}/message/${message.id}/edit" class="inline-flex items-center px-2 py-1 border border-transparent text-sm leading-5 font-medium rounded-full text-white bg-indigo-600 hover:bg-indigo-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition ease-in-out duration-150">
                                       Edit
                                   </a>
                                    </c:if>
                               </span>
                        </div>

                    </div>
                    <div class="mt-2">
                        <div class="flex justify-between">
                            <div class="text-xl font-bold text-gray-900 sm:text-md  sm:truncate">
                                ${message.title}
                            </div>
                        </div>
                        <%-- <div class="mt-1 flex items-center text-sm leading-5 text-gray-500">
                            ${project.description}
                        </div> --%>
                        <div class="flex items-center justify-between border-t  mt-4 py-2">
                            <div class="min-w-0 flex-1 flex items-center mt-2">
                                <div class="flex-shrink-0">

                                    <img src="${contextUrl}/avatar/${message.user.id}/${message.user.firstName.charAt(0)}${message.user.lastName.charAt(0)}.svg" alt="" title="${message.user.firstName} ${message.user.lastName}" class="h-12 w-12 rounded-full"></div>
                                <div class="min-w-0 flex-1 px-4 md:grid md:grid-cols-2 md:gap-4">
                                    <div>
                                        <div class="leading-5 text-gray-900 truncate">
                                            ${message.user.firstName} ${message.user.lastName}
                                        </div>
                                        <div class="leading-5 text-gray-900 truncate">
                                            <%-- ${message.user.firstName} ${message.user.lastName} • --%> <fmt:formatDate value="${message.createdAt.time}" pattern="MMM dd, yyyy"/> at <fmt:formatDate value="${message.createdAt.time}" pattern="h:m a"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="flex items-center justify-center h-8 w-8 rounded-full bg-indigo-500 text-white">
                                    ${message.comments.size()}
                                </div>
                            </div>
                        </div>

                        <div class="mt-2 ">
                            <div class="border-t py-4 border-gray-300 break-words">
                            ${message.content}
                            </div>
                        </div>

                        <div class="mt-4">

                            <div class="mt-4 py-8">

                                <div class="flex items-center">
                                    <h4 class="flex-shrink-0 pr-4 font-bold text-lg leading-5 tracking-wider text-gray-900">
                                        Discussion
                                    </h4>
                                    <div class="flex-1 border-t-2 border-gray-900"></div>
                                </div>

                            </div>
                            <c:forEach items="${comments}" var="comment">
                                <a name="comment_${comment.id}">
                                    <div class="sm:col-span-6 mt-6">
                                    <div class="relative">

                                        <div class="absolute left-0 top-0">
                                            <img src="${contextUrl}/avatar/${comment.user.id}/${comment.user.firstName.charAt(0)}${comment.user.lastName.charAt(0)}.svg" alt="" title="${comment.user.firstName} ${comment.user.lastName}" class="h-12 w-12 rounded-full ">
                                        </div>

                                        <div class="ml-16">
                                            <div class="flex justify-between ">
                                                <div>
                                                    <span class="font-semibold">${comment.user.firstName} ${comment.user.lastName}, </span>
                                                    <span class="text-sm mt-1 text-gray-600">
                                                        <fmt:formatDate value="${comment.createdAt.time}" pattern="MMM dd, yyyy"/> at <fmt:formatDate value="${comment.createdAt.time}" pattern="h:m a"/>
                                                    </span>
                                                </div>
                                                <div class="text-sm">
                                                    <%-- <a href="#" class="underline text-indigo-700 mr-1">Edit</a> --%>
                                                    <a href="${contextUrl}/project/${project.id}/message/${message.id}/comment/${comment.id}/delete" class="underline text-red-700 mr-1">Delete</a>
                                                </div>
                                            </div>
                                            <div class="mt-1">
                                                ${comment.text}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </a>
                                <%-- <div class="sm:col-span-6 hidden">
                                    <div class="relative">

                                        <div class="absolute left-0 top-0">
                                            <img src="${contextUrl}/avatar/${sessionScope.current_user.id}/${sessionScope.current_user.firstName.charAt(0)}${sessionScope.current_user.lastName.charAt(0)}.svg" alt="" title="${message.user.firstName} ${message.user.lastName}" class="h-12 w-12 rounded-full ">
                                        </div>

                                        <form:form modelAttribute="comment">
                                            <script type="x-template" id="comment-template">
                                                <div>
                                                    <input type="hidden" id="x" name="text"/>
                                                    <trix-editor input="x" class="trix-editor-comment"></trix-editor>
                                                </div>
                                            </script>
                                            <div class="ml-16">
                                                <comment-editor></comment-editor>
                                                <div class="mt-4">
                                                    <button type="submit" class="inline-flex justify-center py-2 px-4 border border-transparent text-sm leading-5 font-medium rounded-full text-white bg-indigo-600 hover:bg-indigo-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition duration-150 ease-in-out">
                                                        Add this comment
                                                    </button>
                                                </div>
                                            </div>
                                        </form:form>

                                    </div>
                                </div> --%>

                            </c:forEach>

                            <div class="sm:col-span-6 mt-12">
                                <div class="relative">

                                    <div class="absolute left-0 top-0">
                                        <img src="${contextUrl}/avatar/${sessionScope.current_user.id}/${sessionScope.current_user.firstName.charAt(0)}${sessionScope.current_user.lastName.charAt(0)}.svg" alt="" title="${message.user.firstName} ${message.user.lastName}" class="h-12 w-12 rounded-full ">
                                    </div>

                                    <form:form modelAttribute="comment">
                                        <script type="x-template" id="comment-template">
                                            <div>
                                                <input type="hidden" id="newComment" name="text"/>
                                                <trix-editor input="newComment" class="trix-editor-comment"></trix-editor>
                                            </div>
                                        </script>
                                        <div class="ml-16">
                                            <comment-editor></comment-editor>
                                            <div class="mt-4">
                                                <button type="submit" class="inline-flex justify-center py-2 px-4 border border-transparent text-sm leading-5 font-medium rounded-full text-white bg-indigo-600 hover:bg-indigo-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition duration-150 ease-in-out">
                                                    Add this comment
                                                </button>
                                            </div>
                                        </div>
                                    </form:form>
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

        <script>

            Vue.component("comment-editor", {
                template: "#comment-template"
            });

        </script>


    <%@ include file="../includes/footer.jsp"%>
