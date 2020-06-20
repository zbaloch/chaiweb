<html lang="en">
    <head>
        <jsp:include page="../includes/head.jsp"></jsp:include>
    </head>
    <body class="font-sans">

    <jsp:include page="../includes/nav.jsp"></jsp:include>

    <div class=" min-h-screen">
        <div class="py-10">
                <div class="max-w-4xl mx-auto px-4 sm:px-4 lg:px-4">
                    <span class="inline-flex rounded-full shadow-sm mb-4">
                        <a href="project/new" class="inline-flex items-center px-4 py-2 border border-transparent text-sm leading-5 font-medium rounded-full text-white bg-indigo-600 hover:bg-indigo-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition ease-in-out duration-150">Create a project or a team</a>
                    </span>
                    <div class="mb-8">
                        <div class="flex flex-wrap -mx-3">

                            <div class="w-full md:w-1/2 lg:w-1/3 px-3 flex flex-col mb-8">
                                <a href="/project/1" class="no-underline bg-white rounded-lg shadow hover:shadow-raised hover:translateY-2px transition flex-1 flex flex-col overflow-hidden">
                                    <div class="p-6 flex flex-col">
                                        <h3 class="font-display text-black no-underline mb-2 font-bold">Project Name</h3> <!-- TODO: Seed the HQ by default-->
                                        <div class="text-gray-700">
                                            Project description
                                        </div>
                                        <div class="mt-4">
                                            <div class="flex overflow-hidden">
                                                <img class="inline-block h-8 w-8 rounded-full text-white shadow-solid" src="https://images.unsplash.com/photo-1491528323818-fdd1faba62cc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80" alt="" />
                                                <img class="-ml-1 inline-block h-8 w-8 rounded-full text-white shadow-solid" src="https://images.unsplash.com/photo-1550525811-e5869dd03032?ixlib=rb-1.2.1&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80" alt="" />
                                                <img class="-ml-1 inline-block h-8 w-8 rounded-full text-white shadow-solid" src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2.25&w=256&h=256&q=80" alt="" />
                                                <img class="-ml-1 inline-block h-8 w-8 rounded-full text-white shadow-solid" src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80" alt="" />
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>

                        </div>
                    </div>
                </div>

        </div>
    </div>
    <jsp:include page="../includes/notifications.jsp"></jsp:include>

    </body>
</html>

