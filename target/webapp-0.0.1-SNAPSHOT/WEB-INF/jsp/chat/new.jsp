<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="for" uri="http://www.springframework.org/tags/form" %>

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
                <a href="${contextUrl}/project/${project.id}/files" class="text-gray-500 hover:text-gray-700 transition duration-150 ease-in-out">
                    Docs & files
                </a>

            </nav>
        </div>

        <div class="mt-2">
            <h2 class="text-xl font-bold text-gray-900 sm:text-md  sm:truncate">
                Upload a file <%-- Todo this should let the user create a document or created folders as well later --%>
            </h2>
        </div>



        <form:form modelAttribute="activeStorageFile" enctype="multipart/form-data">



            
        <div class="mt-4 grid grid-cols-1 row-gap-6 col-gap-4 sm:grid-cols-6">

            <div class="sm:col-span-6">
                <%-- <label class="block text-sm font-medium leading-5 text-gray-700">
                    <spring:message code="activeStorageFile.file.label" />
                </label> --%>
                <div class="mt-1 rounded-md shadow-sm">
                    <input type="file" name="multipartFile"/>
                </div>
            </div>

            <%--
            <div class="sm:col-span-6">
                <label class="block text-sm font-medium leading-5 text-gray-700">
                    <spring:message code="activeStorageFile.name.label" />
                </label>
                <div class="mt-1 rounded-md shadow-sm">
                    <form:input path="name" cssClass="form-input block w-full transition duration-150 ease-in-out sm:text-sm sm:leading-5 " />
                </div>
            </div>

            <div class="sm:col-span-6">
                <label class="block text-sm font-medium leading-5 text-gray-700">
                    <spring:message code="activeStorageFile.description.label" />
                </label>
                <div class="mt-1 rounded-md shadow-sm">
                    <form:textarea path="description" cssClass="form-input block w-full transition duration-150 ease-in-out sm:text-sm sm:leading-5"></form:textarea>
                </div>
            </div>
            --%>
        </div>


        <div class="mt-8 border-t border-gray-200 pt-5">
            <div class="flex justify-end">
        <span class="inline-flex rounded-md shadow-sm">
            <a href="${contextUrl}/project/${project.id}/files" class="py-2 px-4 border border-gray-300 rounded-md text-sm leading-5 font-medium text-gray-700 hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue active:bg-gray-50 active:text-gray-800 transition duration-150 ease-in-out">Cancel</a>
        </span>
                <span class="ml-3 inline-flex rounded-md shadow-sm">
                    <input type="submit" value="Upload file to project" class="inline-flex justify-center py-2 px-4 border border-transparent text-sm leading-5 font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition duration-150 ease-in-out"/>
                </span>
            </div>
        </div>


    </form:form>


</div>
</div>

</div>

</div>

<jsp:include page="../includes/notifications.jsp"></jsp:include>

<%@ include file="../includes/footer.jsp"%>