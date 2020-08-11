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
                            <a href="${contextUrl}/project/${project.id}/todos" class="text-gray-500 hover:text-gray-700 transition duration-150 ease-in-out">
                                To-dos
                            </a>
                        </nav>

                        <div>
                            <span class="inline-flex rounded-full shadow-sm">
                                    <c:if test="${todo.createdBy.id == sessionScope.current_user.id}">
                                       <a href="${contextUrl}/project/${project.id}/todo/${todo.id}/edit" class="text-indigo-600 underline mr-2">
                                           Edit
                                       </a>
                                    </c:if>
                               </span>

                                <span class="inline-flex rounded-full shadow-sm">
                                    <c:if test="${todo.createdBy.id == sessionScope.current_user.id && todo.done != true}">
                                   <a href="${contextUrl}/project/${project.id}/todo/${todo.id}/complete"
                                      class="inline-flex items-center px-2 py-1 border border-transparent text-sm leading-5 font-medium rounded-lg text-white bg-green-500 hover:bg-green-400 focus:outline-none focus:border-green-600 focus:shadow-outline-green active:bg-green-600 transition ease-in-out duration-150">
                                       Mark this complete
                                   </a>
                                    </c:if>
                                    <c:if test="${todo.done == true}">
                                        <span class="px-2 inline-flex leading-5 font-medium rounded-full bg-green-100 text-green-800">
                                            Done
                                        </span>
                                    </c:if>

                               </span>
                        </div>

                    </div>


                    <div class=" py-5 border-b border-gray-200">
                            <h3 class="text-lg leading-6 font-medium text-gray-900">
                                ${todo.description}
                            </h3>
                            <p class="mt-1 max-w-2xl text-sm leading-5 text-gray-500">
                                Added by ${todo.createdBy.firstName} ${todo.createdBy.lastName.charAt(0)}. on
                                <fmt:formatDate value="${todo.createdAt.time}" pattern="MMM d, yyyy"/>
                                at <fmt:formatDate value="${todo.createdAt.time}" pattern="h:m a"/>
                            </p>
                        </div>
                    <div class=" py-5">
                            <dl class="grid grid-cols-1 col-gap-4 row-gap-8 sm:grid-cols-2">
                                <div class="sm:col-span-1">
                                    <dt class="text-sm leading-5 font-medium text-gray-500">
                                        Assigned to
                                    </dt>

                                    <dd class="mt-1 leading-5 text-gray-900">
                                        <div class="flex">
                                            <span class="mr-1">
                                <img class="h-6 w-6 rounded-full" src="${contextUrl}/avatar/${todo.assignedTo.id}/${todo.assignedTo.firstName.charAt(0)}${todo.assignedTo.lastName.charAt(0)}.svg" alt="" title="${todo.assignedTo.firstName} ${todo.assignedTo.lastName}">
                            </span>
                                            <span class="mt-1 text-sm leading-5 text-gray-900">
                                ${todo.assignedTo.firstName} ${todo.assignedTo.lastName.charAt(0)}.
                            </span>
                                        </div>

                                    </dd>
                                </div>
                                <div class="sm:col-span-1">
                                    <dt class="text-sm leading-5 font-medium text-gray-500">
                                        Due on
                                    </dt>
                                    <dd class="mt-1 text-sm leading-5 text-gray-900 flex">
                                       <span class="mr-1">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="h-5 w-5">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                            </svg>
                        </span>
                                        <span class="">
                                            <c:if test="${todo.dueDate.time == null}">
                                                No due date
                                            </c:if>
                                            <c:if test="${todo.dueDate.time != null}">
                                                <fmt:formatDate value="${todo.dueDate.time}" pattern="MMM dd, yyyy"/>
                                            </c:if>
                                        </span>

                                    </dd>
                                </div>


                                <div class="sm:col-span-2">
                                    <dt class="text-sm leading-5 font-medium text-gray-500">
                                        Notes
                                    </dt>
                                    <dd class="mt-1 text-sm leading-5 text-gray-900">
                                        <c:if test="${todo.notes == null}">No notes here.</c:if>
                                        ${todo.notes}
                                    </dd>
                                </div>
                            </dl>
                        </div>


                    <div class="mt-4">
                        <div class="flex items-center">

                            <div class="flex items-center">
                                <span class="flex items-center justify-center h-8 w-8 rounded-full bg-indigo-100 text-indigo-800 font-bold">
                                    ${todo.comments.size()}
                                </span>
                            </div>


                            <h4>
                                <div class="flex-shrink-0 pr-4 pl-4 text-lg leading-5 tracking-wider font-medium text-gray-900 ">Comments</div>
                            </h4>
                            <div class="flex-1 border-t border-gray-200"></div>
                        </div>
                    </div>

                        <div class="mt-4">

                             <c:forEach items="${todo.comments}" var="comment">
                                <div class="sm:col-span-6 mt-6" id="comment_${comment.id}">
                                    <div class="relative">

                                        <div class="absolute left-0 top-0">
                                            <img src="${contextUrl}/avatar/${comment.user.id}/${comment.user.firstName.charAt(0)}${comment.user.lastName.charAt(0)}.svg" alt="" title="${comment.user.firstName} ${comment.user.lastName}" class="h-12 w-12 rounded-full ">
                                        </div>

                                        <div class="ml-16">
                                            <div class="flex justify-between ">
                                                <div>
                                                    <span class="font-medium">${comment.user.firstName} ${comment.user.lastName}, </span>
                                                    <span class="text-sm mt-1 text-gray-600">
                                                        <fmt:formatDate value="${comment.createdAt.time}" pattern="MMM dd, yyyy"/> at <fmt:formatDate value="${comment.createdAt.time}" pattern="h:m a"/>
                                                    </span>
                                                </div>
                                                <div class="text-sm">
                                                    <c:if test="${sessionScope.current_user.id == comment.user.id}">

                                                        <a v-on:click.stop="deleteComment(${project.id}, ${todo.id}, ${comment.id})" class="underline text-red-500 cursor-pointer ">
                                                            <svg fill="none" class="h-6 w-6 mr-4" viewBox="0 0 24 24" stroke="currentColor">
                                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/>
                                                            </svg>
                                                        </a>

                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="formatted_content">
                                                    ${comment.text}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <a name="comment_form">
                                <div class="sm:col-span-6 mt-12">
                                    <div class="relative">
                                        <div class="absolute left-0 top-0">
                                            <img src="${contextUrl}/avatar/${sessionScope.current_user.id}/${sessionScope.current_user.firstName.charAt(0)}${sessionScope.current_user.lastName.charAt(0)}.svg" alt="" title="${sessionScope.current_user.firstName} ${sessionScope.current_user.lastName}" class="h-12 w-12 rounded-full ">
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
                                                    <button type="submit" class="inline-flex justify-center py-2 px-4 border border-transparent text-sm leading-5 font-medium rounded-lg text-white bg-indigo-600 hover:bg-indigo-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition duration-150 ease-in-out">
                                                        Add this comment
                                                    </button>
                                                </div>
                                            </div>
                                        </form:form>
                                    </div>
                                </div>
                            </a>

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
