<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Chai 3</title>
    <link rel="stylesheet" href="https://rsms.me/inter/inter.css">
    <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tailwindcss/ui@latest/dist/tailwind-ui.min.css">
    <link rel="stylesheet" href="../resources/static/styles.css">
</head>
<body class="font-sans">

<div class="max-w-4xl mx-auto px-4 sm:px-4 lg:px-4">

    <div class="bg-white rounded-lg shadow p-6">
        <div>
            <h2 class="text-xl font-bold text-gray-900 sm:text-md  sm:truncate">
                Create a new project or a team
            </h2>
            <!-- <div class="mt-2 flex items-center text-sm leading-5 text-gray-500">

            </div> -->

        </div>



        <form:form modelAttribute="project">

        <!-- form errors start -->

        <div class="rounded-md bg-red-50 p-4 mt-4 mb-4">
            <div class="flex">
                <div class="flex-shrink-0">
                    <!-- <svg class="h-5 w-5 text-red-400" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                    </svg> -->
                </div>
                <div class="ml-3">
                    <h3 class="text-sm leading-5 font-medium text-red-700">
                       Show errors
                        prohibited this project from being saved:
                    </h3>
                    <div class="mt-2 text-sm leading-5 text-red-700">
                        <ul class="list-disc pl-5">
                            <li>Error messages list</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- form errors end -->

        <div class="mt-4 grid grid-cols-1 row-gap-6 col-gap-4 sm:grid-cols-6">
            <div class="sm:col-span-6">
                <label class="block text-sm font-medium leading-5 text-gray-700">
                    <spring:message code="project.name.label" />
                </label>
                <div class="mt-1 rounded-md shadow-sm">
                    <form:input path="name" cssClass="form-input block w-full transition duration-150 ease-in-out sm:text-sm sm:leading-5 " />
                </div>
            </div>

            <div class="sm:col-span-6">
                <label class="block text-sm font-medium leading-5 text-gray-700">
                    <spring:message code="project.description.label" />
                </label>
                <div class="mt-1 rounded-md shadow-sm">
                    <form:textarea path="description" cssClass="form-input block w-full transition duration-150 ease-in-out sm:text-sm sm:leading-5 "></form:textarea>
                </div>
            </div>

            <div class="sm:col-span-6">
                <label class="block text-sm font-medium leading-5 text-gray-700">
                    This is a project or a team?
                </label>

                <div class="mt-4">
                    <div class="flex items-center">
                        <form:radiobutton path="projectType" value="project" cssClass="form-radio h-4 w-4 text-indigo-600 transition duration-150 ease-in-out"></form:radiobutton>
                        <span class="ml-3 block text-sm leading-5 font-medium text-gray-700">Project</span>
                    </div>
                </div>

                <div class="mt-4">
                    <div class="flex items-center">
                        <form:radiobutton path="projectType" value="team" cssClass="form-radio h-4 w-4 text-indigo-600 transition duration-150 ease-in-out"></form:radiobutton>
                        <span class="ml-3 block text-sm leading-5 font-medium text-gray-700">Team</span>
                    </div>
                </div>

            </div>




        </div>


        <div class="mt-8 border-t border-gray-200 pt-5">
            <div class="flex justify-end">
        <span class="inline-flex rounded-md shadow-sm">
            <a href="projects" class="py-2 px-4 border border-gray-300 rounded-md text-sm leading-5 font-medium text-gray-700 hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue active:bg-gray-50 active:text-gray-800 transition duration-150 ease-in-out">Cancel</a>
        </span>
                <span class="ml-3 inline-flex rounded-md shadow-sm">
                    <input type="submit" value="Save" class="inline-flex justify-center py-2 px-4 border border-transparent text-sm leading-5 font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition duration-150 ease-in-out"/>
                </span>
            </div>
        </div>


    </div>



    </form:form>






</div>
</div>




</body>
</html>

