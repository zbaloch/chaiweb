//require(['https://cdnjs.cloudflare.com/ajax/libs/turbolinks/5.2.0/turbolinks.js',
//    'https://cdn.jsdelivr.net/npm/vue'], function (Turbolinks, Vue) {

// import axios from "axios";


    Turbolinks.start()



    var initVue = function initVue() {
        var vueapp = new Vue({
            el: '#app',
            data: {
                isProfileMenuOpen: false,
                isProjectActionsOpen: false,
                isMobileProfileMenuOpen: false,
                stompClient: null,
                senderUsername: null,
                senderId: null,
                senderFirstName: null,
                senderLastName: null,
                senderInitials: null,
                projectId: null,
                socket: null,
                contextUrl: null,
                showAvatarModal: false,

                errors: [],
                name: null,
                age: null,
                movie: null,
                hasUnreadNotifications: false,

            },
            created() {
                const handleEscape = (e) => {

                    if (event.key === 'Esc' || event.key === 'Escape') {
                        this.isProfileMenuOpen = false
                        this.isProjectActionsOpen = false
                        isMobileProfileMenuOpen: false
                    }
                }
                document.addEventListener('keydown', handleEscape)
                if(document.getElementById('isChatPage') != null) {
                    var isChatPageField = document.getElementById('isChatPage').value
                    if(isChatPageField != null) {
                        if(document.getElementById("isChatPage").value) {
                            this.chatConnect();
                        }
                    }
                }


                // alert("updated...")
                this.getNotifications();


            },
            methods: {
                chatConnect: function() {
                    this.senderUsername = document.getElementById("user.username").value
                    this.senderId = document.getElementById("user.id").value
                    this.senderFirstName = document.getElementById("user.firstName").value
                    this.senderLastName = document.getElementById("user.lastName").value
                    this.senderInitials = document.getElementById("user.initials").value
                    this.projectId = document.getElementById("project.id").value
                    this.contextUrl = document.getElementById("chat.contextUrl").value
                    this.connect();
                },
                connect: function(event) {

                    if(this.senderUsername) {
                        // usernamePage.classList.add('hidden');
                        // chatPage.classList.remove('hidden');
                        // && !this.stompClient.connected
                        // this.socket = new SockJS('/chaiweb/ws')
                        this.socket = new SockJS('/chaiweb/ws/')
                        this.stompClient = Stomp.over(this.socket);
                        this.stompClient.connect({}, this.onConnected, this.onError);
                    }
                },
                onConnected: function() {
                    // Subscribe to the Public Topic
                    this.stompClient.subscribe('/topic', this.onMessageReceived);

                    // Tell your username to the server
                    this.stompClient.send("/app/chat.addUser", {},
                        JSON.stringify({sender: this.senderUsername, type: 'JOIN'})
                    )

                },

                onError: function(error) {
                    console.log(error);
                },

                sendMessage: function(event) {

                    var messageContent = document.getElementById("chatMessageInput").value

                    if (messageContent && this.stompClient) {
                        var chatMessage = {
                            senderId: this.senderId,
                            senderUsername: this.senderUsername,
                            content: messageContent,
                            type: 'CHAT',
                            senderFirstName: this.senderFirstName,
                            senderLastName: this.senderLastName,
                            senderInitials: this.senderInitials,
                            projectId: this.projectId
                        };
                        this.stompClient.send("/app/chat.sendMessage", {}, JSON.stringify(chatMessage));
                        document.getElementById("chatMessageInput").value = '';
                    }
                },

                onMessageReceived: function(payload) {

                    var currentdate = new Date();

                    var message = JSON.parse(payload.body);
                    if(message.type === 'CHAT' && message.projectId === this.projectId) {

                        var chatMessageHTML = '<div class=\"flex items-start mb-4 text-sm\" >'
                            + '<img title=\"' + message.senderFirstName + ' ' + message.senderLastName
                            + '\" src=\"' + this.contextUrl + '/avatar/'+ message.senderId + '/' + message.senderInitials + '.svg'
                            + '" class=\"w-10 h-10 rounded-full mr-3\"> '
                            + ' <div class=\"flex-1 overflow-hidden\">'
                            + '<div><span class=\"font-bold\">' + message.senderFirstName + ' ' + message.senderLastName + '</span> '
                            + '<span class=\"text-grey text-xs\">' + currentdate.getHours() + ':' + currentdate.getMinutes()
                            + '</span></div> <p class=\"text-black leading-normal\">'
                            + message.content +  '</p></div></div>'


                        $("#chat-window").append(chatMessageHTML);
                        $("#chat-window").scrollTop = $("#chat-window").scrollHeight
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
                showAvatar: function() {
                    this.showAvatarModal = !this.showAvatarModal;
                },
                messageTitleFocus: function () {

                },
                /* deleteComment: function() {
                    // document.getElementById('delete-comment-form').submit()
                    this.$refs.delete_comment_form.submit()
                }, */
                deleteComment: function(projectId, messageId, commentId) {

                    axios.delete("/chaiweb/project/"+ projectId + "/message/" + messageId + "/comment/" + commentId + "/delete") // TODO: need to make chaiweb dynamic
                        .then(response => {
                            $("#comment_" + commentId).addClass('hidden')

                        })
                },
                deleteChatMessage: function(projectId, chatMessageId) {

                    axios.delete("/chaiweb/project/" + projectId + "/chat/" + chatMessageId) // TODO: need to make chaiweb dynamic
                        .then(response => {
                            $("#chat_message_" + chatMessageId).addClass('hidden')

                        })
                },

                getNotifications: function() {
                    axios.get("/chaiweb/hasUnreadNotifications").then(response => {

                        if(response.data) {
                            this.hasUnreadNotifications = true;
                        }
                    })
                }


            }
        })
    }



    document.addEventListener('turbolinks:load', () => {

        initVue();

        let objDiv = $("#chat-window");
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