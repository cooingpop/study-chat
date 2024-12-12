let chatApp = {
    stompClient: null,
    username: null,
    activeTab: 'content-overview', // 현재 활성화된 탭 ID 저장

    // 채팅 속도
    messageCount: 0,
    lastMessageTime: 0,
    blockedUntil: 0,

    init: function() {
        const usernameInput = document.getElementById('username');
        const joinButton = document.getElementById('join-button');

        // 페이지 로드 시 username 입력란에 focus
        usernameInput.focus();

        // username 입력란에서 엔터 키 누르면 Join Chat 버튼 클릭
        usernameInput.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') {
                e.preventDefault();
                joinButton.click();
            }
        });

        joinButton.addEventListener('click', () => this.setUsername());
        document.getElementById('send-button').addEventListener('click', () => this.sendMessage());
        document.getElementById('message').addEventListener('keypress', (e) => {
            if (e.key === 'Enter') {
                this.sendMessage();
            }
        });

        // 키보드 단축키 이벤트 리스너 추가
        document.addEventListener("keydown", (e) => {
            if (e.altKey && e.key.toLowerCase() === "z") {
                e.preventDefault();
                this.switchToTab("overview");
            } else if (e.altKey && e.key.toLowerCase() === "x") {
                e.preventDefault();
                this.switchToTab("learn");
            }  else if (e.altKey && e.key.toLowerCase() === "c") {
                e.preventDefault();
                this.clearChat();
            }
        });

        // 탭 전환 이벤트 리스너 추가
        const tabs = document.querySelectorAll('.content-tabs a');
        tabs.forEach(tab => {
            tab.addEventListener('click', (e) => this.switchTab(e));
        });

        // 페이지 로드 시 채팅 페이지를 숨깁니다.
        // document.getElementById('chat-page').style.display = 'none';

        this.showContent(this.activeTab);
    },
    switchToTab: function(tabName) {
        const tab = document.querySelector(`.content-tabs a[href="#${tabName}"]`);
        if (tab) {
            tab.click(); // 탭 클릭 이벤트 트리거
        }
    },
    switchTab: function(e) {
        e.preventDefault();

        // 모든 탭에서 active 클래스 제거
        const tabs = document.querySelectorAll('.content-tabs li');
        tabs.forEach(tab => tab.classList.remove('active'));

        // 클릭된 탭에 active 클래스 추가
        e.target.parentElement.classList.add('active');

        // content-탭이름 형식의 ID 생성
        const targetId = 'content-' + e.target.getAttribute('href').substring(1);
        this.showContent(targetId);
    },

    showContent: function(targetId) {
        // 모든 컨텐츠 숨기기
        const contents = document.querySelectorAll('.content-section');
        contents.forEach(content => content.style.display = 'none');

        // 선택된 컨텐츠만 표시
        const targetContent = document.getElementById(targetId);
        console.log(targetContent);
        if (targetContent) {
            targetContent.style.display = 'block';
            this.activeTab = targetId;

            // OVERVIEW 탭이면 메시지 입력란에 포커스 설정
            if (targetId === 'content-overview') {
                const messageInput = document.getElementById('message');
                if (messageInput) {
                    messageInput.focus();
                }
            }
        }
    },

    setUsername: function() {
        let usernameInput = document.getElementById('username').value.trim();

        // 공백 문자 제거 및 유효성 검사
        if (!usernameInput || this.containsOnlyWhitespace(usernameInput)) {
            console.log("Invalid username. Please enter a valid name without special or whitespace characters.");
            return;
        }

        this.username = this.sanitizeInput(usernameInput);
        if (this.username) {
            document.getElementById('username-page').style.display = 'none';
            document.getElementById('chat-page').style.display = 'block';
            document.querySelector('.chat-container').style.display = 'block'; // 채팅 컨테이너도 표시
            this.connect();
        }
    },

    connect: function() {
        const socket = new SockJS('/ws?name=' + encodeURIComponent(this.username));
        this.stompClient = Stomp.over(socket);
        this.stompClient.connect({}, () => {
            this.stompClient.subscribe('/topic/public', (message) => {
                this.onMessageReceived(JSON.parse(message.body));
            });
            this.stompClient.subscribe('/topic/userCount', (message) => {
                this.updateUserCount(JSON.parse(message.body).count);
            });
            this.addUser();

            // 잠시 대기 후 사용자 수 요청
            setTimeout(() => {
                this.stompClient.send("/app/requestUserCount", {}, {});
            }, 100);
        });
    },

    addUser: function() {
        if (this.stompClient) {
            const chatMessage = {
                sender: this.username,
                content: "has joined the chat",
                type: 'JOIN'
            };
            this.stompClient.send("/app/chat.addUser", {}, JSON.stringify(chatMessage));
        }
    },

    sanitizeInput: function(input) {
        return input.replace(/&/g, '&amp;')
            .replace(/</g, '&lt;')
            .replace(/>/g, '&gt;')
            .replace(/"/g, '&quot;')
            .replace(/'/g, '&#039;');
    },

    // sendMessage: function() {
    //     const messageInput = document.getElementById('message');
    //     let messageContent = messageInput.value.trim();
    //     if (messageContent && this.stompClient) {
    //         messageContent = this.sanitizeInput(messageContent);
    //         const chatMessage = {
    //             sender: this.username,
    //             content: messageContent,
    //             type: 'CHAT'
    //         };
    //         this.stompClient.send("/app/chat.sendMessage", {}, JSON.stringify(chatMessage));
    //         messageInput.value = '';
    //     }
    // },

    sendMessage: function() {
        const now = Date.now();
        if (now < this.blockedUntil) {
            alert(`채팅이 제한되었습니다. ${Math.ceil((this.blockedUntil - now) / 1000)}초 후에 다시 시도해주세요.`);
            return;
        }

        const messageInput = document.getElementById('message');
        let messageContent = messageInput.value.trim();
        if (messageContent && this.stompClient) {
            if (now - this.lastMessageTime > 5000) {
                this.messageCount = 1;
            } else {
                this.messageCount++;
            }

            if (this.messageCount > 7) {
                this.blockedUntil = now + 10000;
                alert("채팅 속도가 너무 빠릅니다. 10초 동안 채팅이 제한됩니다.");
                return;
            }

            messageContent = this.sanitizeInput(messageContent);
            const chatMessage = {
                sender: this.username,
                content: messageContent,
                type: 'CHAT'
            };
            this.stompClient.send("/app/chat.sendMessage", {}, JSON.stringify(chatMessage));
            messageInput.value = '';
            this.lastMessageTime = now;
        }
    },

    onMessageReceived: function(message) {
        const chat = document.getElementById('chat');
        const messageElement = document.createElement('div');

        let time = message.timestamp;

        if (message.type === 'ANNOUNCEMENT') {
            messageElement.classList.add('announcement-message'); // 공지 메시지 스타일 적용
            messageElement.textContent = `공지: ${message.content} [${time}]`;
        } else if (message.type === 'JOIN' || message.type === 'LEAVE') {
            messageElement.classList.add('event-message');
            messageElement.textContent = `${message.sender} (${message.ipAddress}) ${message.content} [${time}]`;
        } else {
            // 기존 CHAT 메시지 처리
            messageElement.classList.add('chat-message');
            if (message.sender === this.username) {
                messageElement.classList.add('own-message');
            } else {
                messageElement.classList.add('other-message');
            }
            messageElement.textContent = `${message.sender} (${message.ipAddress}): ${message.content} [${time}]`;
        }

        chat.appendChild(messageElement);
        chat.scrollTop = chat.scrollHeight;
    },


    updateUserCount: function(count) {
        document.getElementById('user-count').textContent = count;
    },

    containsOnlyWhitespace: function(input) {
        // 모든 공백 문자 및 특수 공백 제거
        const invalidCharRegex = /[\s\u00A0\u2000-\u200F\u202F\u205F\u3000\uFEFF\u3164]/;
        return invalidCharRegex.test(input);
    },

    clearChat: function() {
        const chatContainer = document.getElementById('chat');
        if (chatContainer) {
            chatContainer.innerHTML = '';
        }
    },
};

document.addEventListener('DOMContentLoaded', () => chatApp.init());
