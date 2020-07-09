//require(['https://cdnjs.cloudflare.com/ajax/libs/turbolinks/5.2.0/turbolinks.js',
//    'https://cdn.jsdelivr.net/npm/vue'], function (Turbolinks, Vue) {

    Turbolinks.start()


    var initVue = function initVue() {
        var vueapp = new Vue({
            el: '#app',
            data: {
                isProfileMenuOpen: false,
                isProjectActionsOpen: false,
                isMobileProfileMenuOpen: false,
                stompClient: null,
                senderUsername: document.getElementById("user.username").value,
                senderId: document.getElementById("user.id").value,
                senderFirstName: document.getElementById("user.firstName").value,
                senderLastName: document.getElementById("user.lastName").value,
                senderInitials: document.getElementById("user.initials").value,
                projectId: document.getElementById("project.id").value,
            },
            created() {
                const handleEscape = (e) => {

                    if (event.key === 'Esc' || event.key === 'Escape') {
                        this.isProfileMenuOpen = false
                        this.isProjectActionsOpen = false
                        isMobileProfileMenuOpen: false

                        console.log(this.isProfileMenuOpen + ", " + this.isProjectActionsOpen + ", " + this.isMobileProfileMenuOpen)
                    }
                }
                document.addEventListener('keydown', handleEscape)
                this.connect();

            },
            methods: {
                connect: function(event) {

                    if(this.senderUsername) {
                        // usernamePage.classList.add('hidden');
                        // chatPage.classList.remove('hidden');

                        var socket = new SockJS('/chaiweb/ws');
                        this.stompClient = Stomp.over(socket);

                        this.stompClient.connect({}, this.onConnected, this.onError);
                    }
                },
                onConnected: function() {
                    // Subscribe to the Public Topic
                    this.stompClient.subscribe('/topic/' + this.projectId, this.onMessageReceived);

                    // Tell your username to the server
                    this.stompClient.send("/app/chat.addUser/" + this.projectId, {},
                        JSON.stringify({sender: this.senderUsername, type: 'JOIN'})
                    )

                },

                onError: function(error) {
                    console.log(error);
                },

                sendMessage: function(event) {
                    console.log(event);
                    var messageContent = document.getElementById("chatMessageInput").value;
                    if (messageContent && this.stompClient) {
                        var chatMessage = {
                            senderId: this.senderId,
                            senderUsername: this.senderUsername,
                            content: messageContent,
                            type: 'CHAT',
                            senderFirstName: this.senderFirstName,
                            senderLastName: this.senderLastName,
                            senderInitials: this.senderInitials
                        };
                        this.stompClient.send("/app/chat.sendMessage/" + this.projectId, {}, JSON.stringify(chatMessage));
                        document.getElementById("chatMessageInput").value = '';
                    }
                },

                onMessageReceived: function(payload) {
                    var message = JSON.parse(payload.body);
                    if(message.type === 'CHAT') {
                        var chatMessageHTML = '<div class=\"flex items-start mb-4 text-sm\" >'
                            + '<img src=\"https://avatars.wip.chat/'+ message.senderFirstName.length + '.svg?text=' +  message.senderInitials + '" class=\"w-10 h-10 rounded-full mr-3\"> '
                            + ' <div class=\"flex-1 overflow-hidden\">'
                            + '<div><span class=\"font-bold\">' + message.senderFirstName + ' ' + message.senderLastName + '</span> '
                            + '<span class=\"text-grey text-xs\" wfd-id=\"17\">12:45</span></div> <p class=\"text-black leading-normal\">'
                            + message.content +  '</p></div></div>'
                        // document.getElementById("chat-window").insertAdjacentHTML("beforeend", "<div>Hello World</div>");
                        document.getElementById("chat-window").insertAdjacentHTML("beforeend", chatMessageHTML);
                        document.getElementById("chat-window").scrollTop = document.getElementById("chat-window").scrollHeight
                    }

                    /*

            var messageElement = document.createElement('li');

            if(message.type === 'JOIN') {
                messageElement.classList.add('event-message');
                message.content = message.sender + ' joined!';
            } else if (message.type === 'LEAVE') {
                messageElement.classList.add('event-message');
                message.content = message.sender + ' left!';
            } else {
                messageElement.classList.add('chat-message');

                var avatarElement = document.createElement('i');
                var avatarText = document.createTextNode(message.sender[0]);
                avatarElement.appendChild(avatarText);
                avatarElement.style['background-color'] = getAvatarColor(message.sender);

                messageElement.appendChild(avatarElement);

                var usernameElement = document.createElement('span');
                var usernameText = document.createTextNode(message.sender);
                usernameElement.appendChild(usernameText);
                messageElement.appendChild(usernameElement);
            }

            var textElement = document.createElement('p');
            var messageText = document.createTextNode(message.content);
            textElement.appendChild(messageText);

            messageElement.appendChild(textElement);

            messageArea.appendChild(messageElement);
            messageArea.scrollTop = messageArea.scrollHeight;

             */

                },

                getAvatarColor: function(messageSender) {
                    var hash = 0;
                    for (var i = 0; i < messageSender.length; i++) {
                        hash = 31 * hash + messageSender.charCodeAt(i);
                    }
                    var index = Math.abs(hash % colors.length);
                    return colors[index];
                },
            }
        })
    }



    document.addEventListener('turbolinks:load', () => {

        initVue();

        let objDiv = document.getElementById("chat-window");
        if(objDiv != null) {
            objDiv.scrollTop = objDiv.scrollHeight;
        }

    })







    /* document.addEventListener('turbolinks:start', () => {
        console.log('turbolinks:start...')
        initVue()
    }) */

    /* initVue()
    console.log('initiated in main initVue 2') */

    // View destroy as recommended by Adam Wathan here https://www.youtube.com/watch?v=If6XdbBQqmY


//})