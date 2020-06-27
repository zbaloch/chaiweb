<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<html>
<head>
    <%@ include file="../includes/head.jsp"%>
</head>

<body class="font-sans bg-gray-100">

<jsp:include page="includes/nav.jsp"></jsp:include>

<div class=" min-h-screen">

    Welcome this is the main page
    <a href="${contextPath}/projects">Projects</a>

</div>

</body>
</html>

