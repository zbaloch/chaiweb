<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>


<%@ include file="../includes/head.jsp"%>

<body class="font-sans bg-gray-100">
<div id="app">

    <jsp:include page="../includes/nav.jsp"></jsp:include>

    <div class="">
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

                        </div>

                    </div>
                    <div class="mt-2">
                        <div class="flex justify-between">
                            <div class="text-xl font-bold text-gray-900 sm:text-md  sm:truncate">
                                Chat
                            </div>
                        </div>
                        <%-- <div class="mt-1 flex items-center text-sm leading-5 text-gray-500">
                            Chat casually with the group, ask random questions, and share stuff without ceremony.
                        </div> --%>
                    </div>

                    <div class="mt-4">
                            <div class="mx-auto max-w-screen-xl border-t">
                                <%-- <div class="lg:grid lg:grid-cols-3 lg:gap-8"> --%>

                                     <!-- component -->
                                        <div class="font-sans antialiased">
                                            <!-- Sidebar / channel list -->

                                            <!-- Chat content -->
                                            <div class="flex flex-col bg-white overflow-hidden" style="height: calc(100vh - 260px);">
                                                <!-- Top bar -->
                                                <%-- <div class="border-b flex px-6 py-2 items-center flex-none overflow-hidden">
                                                    <div class="flex flex-col">
                                                        <h3 class="text-grey-darkest mb-1 font-extrabold">#general</h3>
                                                        <div class="text-grey-dark text-sm truncate">
                                                            Chit-chattin' about ugly HTML and mixing of concerns.
                                                        </div>
                                                    </div>
                                                    <div class="ml-auto hidden md:block">
                                                        <div class="relative">
                                                            <input type="search" placeholder="Search" class="appearance-none border border-grey rounded-lg pl-8 pr-4 py-2">
                                                            <div class="absolute pin-y pin-l pl-3 flex items-center justify-center">
                                                                <svg class="fill-current text-grey h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                                                    <path d="M12.9 14.32a8 8 0 1 1 1.41-1.41l5.35 5.33-1.42 1.42-5.33-5.34zM8 14A6 6 0 1 0 8 2a6 6 0 0 0 0 12z" />
                                                                </svg>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div> --%>
                                                <!-- Chat messages -->
                                                <div class="flex flex-col min-h-full">
                                                    <div class="flex-1 py-4 flex-1 overflow-y-scroll" id="chat-window">
                                                        <!-- A message -->
                                                        <div class="flex items-start mb-4 text-sm">
                                                            <img class="w-10 h-10 rounded-full mr-3" src="https://avatars.wip.chat/${sessionScope.current_user.id}.svg?text=${sessionScope.current_user.firstName.charAt(0)}${sessionScope.current_user.lastName.charAt(0)}" alt="">
                                                            <div class="flex-1 overflow-hidden">
                                                                <div>
                                                                    <span class="font-bold">Adam Wathan</span>
                                                                    <span class="text-grey text-xs">12:45</span>
                                                                </div>
                                                                <p class="text-black leading-normal">How are we supposed to control the marquee space without an utility for it? I propose this:</p>
                                                                <%-- <div class="bg-grey-lighter border border-grey-light text-grey-darkest text-sm font-mono rounded p-3 mt-2 whitespace-pre overflow-scroll">.marquee-lightspeed { -webkit-marquee-speed: fast; }
                                                                    .marquee-lightspeeder { -webkit-marquee-speed: faster; }</div> --%>
                                                            </div>
                                                        </div>


                                                        <!-- A message -->
                                                        <div class="flex items-start mb-4 text-sm">
                                                            <img src="https://pbs.twimg.com/profile_images/887661330832003072/Zp6rA_e2_400x400.jpg" class="w-10 h-10 rounded-full mr-3" />
                                                            <div class="flex-1 overflow-hidden">
                                                                <div>
                                                                    <span class="font-bold">Adam Wathan</span>
                                                                    <span class="text-grey text-xs">12:45</span>
                                                                </div>
                                                                <p class="text-black leading-normal">How are we supposed to control the marquee space without an utility for it? I propose this:</p>
                                                                <%-- <div class="bg-grey-lighter border border-grey-light text-grey-darkest text-sm font-mono rounded p-3 mt-2 whitespace-pre overflow-scroll">.marquee-lightspeed { -webkit-marquee-speed: fast; }
                                                                    .marquee-lightspeeder { -webkit-marquee-speed: faster; }</div> --%>
                                                            </div>
                                                        </div>


                                                        <!-- A message -->
                                                        <div class="flex items-start mb-4 text-sm">
                                                            <img src="https://pbs.twimg.com/profile_images/887661330832003072/Zp6rA_e2_400x400.jpg" class="w-10 h-10 rounded mr-3" />
                                                            <div class="flex-1 overflow-hidden">
                                                                <div>
                                                                    <span class="font-bold">Adam Wathan</span>
                                                                    <span class="text-grey text-xs">12:45</span>
                                                                </div>
                                                                <p class="text-black leading-normal">How are we supposed to control the marquee space without an utility for it? I propose this:</p>
                                                                <%-- <div class="bg-grey-lighter border border-grey-light text-grey-darkest text-sm font-mono rounded p-3 mt-2 whitespace-pre overflow-scroll">.marquee-lightspeed { -webkit-marquee-speed: fast; }
                                                                    .marquee-lightspeeder { -webkit-marquee-speed: faster; }</div> --%>
                                                            </div>
                                                        </div>


                                                        <!-- A message -->
                                                        <div class="flex items-start mb-4 text-sm">
                                                            <img src="https://pbs.twimg.com/profile_images/887661330832003072/Zp6rA_e2_400x400.jpg" class="w-10 h-10 rounded mr-3" />
                                                            <div class="flex-1 overflow-hidden">
                                                                <div>
                                                                    <span class="font-bold">Adam Wathan</span>
                                                                    <span class="text-grey text-xs">12:45</span>
                                                                </div>
                                                                <p class="text-black leading-normal">How are we supposed to control the marquee space without an utility for it? I propose this:</p>
                                                                <%-- <div class="bg-grey-lighter border border-grey-light text-grey-darkest text-sm font-mono rounded p-3 mt-2 whitespace-pre overflow-scroll">.marquee-lightspeed { -webkit-marquee-speed: fast; }
                                                                    .marquee-lightspeeder { -webkit-marquee-speed: faster; }</div> --%>
                                                            </div>
                                                        </div>


                                                        <!-- A message -->
                                                        <div class="flex items-start mb-4 text-sm">
                                                            <img src="https://pbs.twimg.com/profile_images/887661330832003072/Zp6rA_e2_400x400.jpg" class="w-10 h-10 rounded mr-3" />
                                                            <div class="flex-1 overflow-hidden">
                                                                <div>
                                                                    <span class="font-bold">Adam Wathan</span>
                                                                    <span class="text-grey text-xs">12:45</span>
                                                                </div>
                                                                <p class="text-black leading-normal">How are we supposed to control the marquee space without an utility for it? I propose this:</p>
                                                                <%-- <div class="bg-grey-lighter border border-grey-light text-grey-darkest text-sm font-mono rounded p-3 mt-2 whitespace-pre overflow-scroll">.marquee-lightspeed { -webkit-marquee-speed: fast; }
                                                                    .marquee-lightspeeder { -webkit-marquee-speed: faster; }</div> --%>
                                                            </div>
                                                        </div>

                                                        <!-- A message -->
                                                        <div class="flex items-start mb-4 text-sm">
                                                            <img src="https://pbs.twimg.com/profile_images/887661330832003072/Zp6rA_e2_400x400.jpg" class="w-10 h-10 rounded mr-3" />
                                                            <div class="flex-1 overflow-hidden">
                                                                <div>
                                                                    <span class="font-bold">Adam Wathan</span>
                                                                    <span class="text-grey text-xs">12:45</span>
                                                                </div>
                                                                <p class="text-black leading-normal">How are we supposed to control the marquee space without an utility for it? I propose this:</p>
                                                                <%-- <div class="bg-grey-lighter border border-grey-light text-grey-darkest text-sm font-mono rounded p-3 mt-2 whitespace-pre overflow-scroll">.marquee-lightspeed { -webkit-marquee-speed: fast; }
                                                                    .marquee-lightspeeder { -webkit-marquee-speed: faster; }</div> --%>
                                                            </div>
                                                        </div>


                                                        <!-- A message -->
                                                        <div class="flex items-start mb-4 text-sm">
                                                            <img src="https://pbs.twimg.com/profile_images/887661330832003072/Zp6rA_e2_400x400.jpg" class="w-10 h-10 rounded mr-3" />
                                                            <div class="flex-1 overflow-hidden">
                                                                <div>
                                                                    <span class="font-bold">Adam Wathan</span>
                                                                    <span class="text-grey text-xs">12:45</span>
                                                                </div>
                                                                <p class="text-black leading-normal">How are we supposed to control the marquee space without an utility for it? I propose this:</p>
                                                                <%-- <div class="bg-grey-lighter border border-grey-light text-grey-darkest text-sm font-mono rounded p-3 mt-2 whitespace-pre overflow-scroll">.marquee-lightspeed { -webkit-marquee-speed: fast; }
                                                                    .marquee-lightspeeder { -webkit-marquee-speed: faster; }</div> --%>
                                                            </div>
                                                        </div>

                                                        <!-- A message -->
                                                        <div class="flex items-start mb-4 text-sm">
                                                            <img src="https://pbs.twimg.com/profile_images/887661330832003072/Zp6rA_e2_400x400.jpg" class="w-10 h-10 rounded mr-3" />
                                                            <div class="flex-1 overflow-hidden">
                                                                <div>
                                                                    <span class="font-bold">Adam Wathan</span>
                                                                    <span class="text-grey text-xs">12:45</span>
                                                                </div>
                                                                <p class="text-black leading-normal">How are we supposed to control the marquee space without an utility for it? I propose this:</p>
                                                                <%-- <div class="bg-grey-lighter border border-grey-light text-grey-darkest text-sm font-mono rounded p-3 mt-2 whitespace-pre overflow-scroll">.marquee-lightspeed { -webkit-marquee-speed: fast; }
                                                                    .marquee-lightspeeder { -webkit-marquee-speed: faster; }</div> --%>
                                                            </div>
                                                        </div>

                                                        <!-- A message -->
                                                        <div class="flex items-start mb-4 text-sm">
                                                            <img src="https://pbs.twimg.com/profile_images/887661330832003072/Zp6rA_e2_400x400.jpg" class="w-10 h-10 rounded mr-3" />
                                                            <div class="flex-1 overflow-hidden">
                                                                <div>
                                                                    <span class="font-bold">Adam Wathan</span>
                                                                    <span class="text-grey text-xs">12:45</span>
                                                                </div>
                                                                <p class="text-black leading-normal">How are we supposed to control the marquee space without an utility for it? I propose this:</p>
                                                                <%-- <div class="bg-grey-lighter border border-grey-light text-grey-darkest text-sm font-mono rounded p-3 mt-2 whitespace-pre overflow-scroll">.marquee-lightspeed { -webkit-marquee-speed: fast; }
                                                                    .marquee-lightspeeder { -webkit-marquee-speed: faster; }</div> --%>
                                                            </div>
                                                        </div>


                                                        <!-- A message -->
                                                        <div class="flex items-start mb-4 text-sm">
                                                            <img src="https://pbs.twimg.com/profile_images/887661330832003072/Zp6rA_e2_400x400.jpg" class="w-10 h-10 rounded mr-3" />
                                                            <div class="flex-1 overflow-hidden">
                                                                <div>
                                                                    <span class="font-bold">Adam Wathan</span>
                                                                    <span class="text-grey text-xs">12:45</span>
                                                                </div>
                                                                <p class="text-black leading-normal">How are we supposed to control the marquee space without an utility for it? I propose this:</p>
                                                                <%-- <div class="bg-grey-lighter border border-grey-light text-grey-darkest text-sm font-mono rounded p-3 mt-2 whitespace-pre overflow-scroll">.marquee-lightspeed { -webkit-marquee-speed: fast; }
                                                                    .marquee-lightspeeder { -webkit-marquee-speed: faster; }</div> --%>
                                                            </div>
                                                        </div>


                                                        <!-- A message -->
                                                        <div class="flex items-start mb-4 text-sm">
                                                            <img src="https://pbs.twimg.com/profile_images/887661330832003072/Zp6rA_e2_400x400.jpg" class="w-10 h-10 rounded mr-3" />
                                                            <div class="flex-1 overflow-hidden">
                                                                <div>
                                                                    <span class="font-bold">Adam Wathan</span>
                                                                    <span class="text-grey text-xs">12:45</span>
                                                                </div>
                                                                <p class="text-black leading-normal">How are we supposed to control the marquee space without an utility for it? I propose this:</p>
                                                                <%-- <div class="bg-grey-lighter border border-grey-light text-grey-darkest text-sm font-mono rounded p-3 mt-2 whitespace-pre overflow-scroll">.marquee-lightspeed { -webkit-marquee-speed: fast; }
                                                                    .marquee-lightspeeder { -webkit-marquee-speed: faster; }</div> --%>
                                                            </div>
                                                        </div>

                                                        <!-- A message -->
                                                        <div class="flex items-start mb-4 text-sm">
                                                            <img src="https://pbs.twimg.com/profile_images/887661330832003072/Zp6rA_e2_400x400.jpg" class="w-10 h-10 rounded mr-3" />
                                                            <div class="flex-1 overflow-hidden">
                                                                <div>
                                                                    <span class="font-bold">Adam Wathan</span>
                                                                    <span class="text-grey text-xs">12:45</span>
                                                                </div>
                                                                <p class="text-black leading-normal">How are we supposed to control the marquee space without an utility for it? I propose this:</p>
                                                                <%-- <div class="bg-grey-lighter border border-grey-light text-grey-darkest text-sm font-mono rounded p-3 mt-2 whitespace-pre overflow-scroll">.marquee-lightspeed { -webkit-marquee-speed: fast; }
                                                                    .marquee-lightspeeder { -webkit-marquee-speed: faster; }</div> --%>
                                                            </div>
                                                        </div>



                                                        <!-- A message -->
                                                        <div class="flex items-start mb-4 text-sm">
                                                            <img src="https://pbs.twimg.com/profile_images/887661330832003072/Zp6rA_e2_400x400.jpg" class="w-10 h-10 rounded mr-3" />
                                                            <div class="flex-1 overflow-hidden">
                                                                <div>
                                                                    <span class="font-bold">Adam Wathan</span>
                                                                    <span class="text-grey text-xs">12:45</span>
                                                                </div>
                                                                <p class="text-black leading-normal">How are we supposed to control the marquee space without an utility for it? I propose this:</p>

                                                            </div>
                                                        </div>


                                                        <!-- A message -->
                                                        <div class="flex items-start mb-4 text-sm">
                                                            <img src="https://pbs.twimg.com/profile_images/887661330832003072/Zp6rA_e2_400x400.jpg" class="w-10 h-10 rounded mr-3" />
                                                            <div class="flex-1 overflow-hidden">
                                                                <div>
                                                                    <span class="font-bold">Adam Wathan</span>
                                                                    <span class="text-grey text-xs">12:45</span>
                                                                </div>
                                                                <p class="text-black leading-normal">How are we supposed to control the marquee space without an utility for it? I propose this:</p>
                                                            </div>
                                                        </div>

                                                        <!-- A message -->
                                                        <div class="flex items-start mb-4 text-sm">
                                                            <img src="https://pbs.twimg.com/profile_images/887661330832003072/Zp6rA_e2_400x400.jpg" class="w-10 h-10 rounded mr-3" />
                                                            <div class="flex-1 overflow-hidden">
                                                                <div>
                                                                    <span class="font-bold">Adam Wathan</span>
                                                                    <span class="text-grey text-xs">12:45</span>
                                                                </div>
                                                                <p class="text-black leading-normal">How are we supposed to control the marquee space without an utility for it? I propose this:</p>

                                                            </div>
                                                        </div>

                                                        <!-- A message -->
                                                        <div class="flex items-start mb-4 text-sm">
                                                            <img src="https://pbs.twimg.com/profile_images/887661330832003072/Zp6rA_e2_400x400.jpg" class="w-10 h-10 rounded mr-3" />
                                                            <div class="flex-1 overflow-hidden">
                                                                <div>
                                                                    <span class="font-bold">Adam Wathan</span>
                                                                    <span class="text-grey text-xs">12:45</span>
                                                                </div>
                                                                <p class="text-black leading-normal">How are we supposed to control the marquee space without an utility for it? I propose this:</p>

                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="flex-none">
                                                        <div class="flex rounded-lg border-2 border-grey overflow-hidden">
                                                            <span class="text-3xl text-grey border-r-2 border-grey p-2">
                                                                <svg class="fill-current h-6 w-6 block" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M16 10c0 .553-.048 1-.601 1H11v4.399c0 .552-.447.601-1 .601-.553 0-1-.049-1-.601V11H4.601C4.049 11 4 10.553 4 10c0-.553.049-1 .601-1H9V4.601C9 4.048 9.447 4 10 4c.553 0 1 .048 1 .601V9h4.399c.553 0 .601.447.601 1z"/></svg>
                                                              </span>
                                                            <form id="messageForm" name="messageForm">
                                                            <input type="text" class="w-full px-4" placeholder="Message #general" />
                                                                <button type="submit" class="primary">Send</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>



                                    <%-- --%>

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
