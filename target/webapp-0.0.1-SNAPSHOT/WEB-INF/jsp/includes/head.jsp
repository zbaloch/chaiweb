<spring:message code="context" var="contextUrl"></spring:message>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title><spring:message code="company.name"></spring:message></title>
    <link rel="stylesheet" href="https://rsms.me/inter/inter.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tailwindcss/ui@latest/dist/tailwind-ui.min.css">
    <link rel="stylesheet" type="text/css" href="${contextUrl}/css/trix.css">
    <link rel="stylesheet" href="${contextUrl}/css/styles.css">

    <!-- <script src="https://requirejs.org/docs/release/2.3.6/minified/require.js"></script> -->
    <%-- Use this with when using turbolinks <script defer src=""></script> --%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/turbolinks/5.2.0/turbolinks.js"></script>

    <%-- <script src="https://cdn.jsdelivr.net/npm/vue"></script> --%>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>


    <script src="${contextUrl}/js/trix.js"></script> 
    <script src="${contextUrl}/js/application.js"></script>
    <script src="${contextUrl}/js/attachments.js"></script>

    <style>
        .first\:ml-0:first-child {
            margin-left: 0;
        }
    </style>

</head>




<%-- TODO: need to include csrf protection --%>
<%-- TODO: neet to add logger --%>
<%-- TODO: need to minimize css and js --%>