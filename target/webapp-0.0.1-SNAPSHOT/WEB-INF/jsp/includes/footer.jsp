<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<input type="hidden" id="user.username" value="${sessionScope.current_user.username}"/>
<input type="hidden" id="user.id" value="${sessionScope.current_user.id}"/>
<input type="hidden" id="user.firstName" value="${sessionScope.current_user.firstName}"/>
<input type="hidden" id="user.lastName" value="${sessionScope.current_user.lastName}"/>
<input type="hidden" id="user.initials" value="${sessionScope.current_user.firstName.charAt(0)}${sessionScope.current_user.lastName.charAt(0)}"/>
<input type="hidden" id="project.id" value="${project.id}"/>


</body>
</html>