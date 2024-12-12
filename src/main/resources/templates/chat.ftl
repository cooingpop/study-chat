<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self' https://cdn.jsdelivr.net; style-src 'self';">
    <title>Chatty</title>
    <link rel="stylesheet" href="/css/chat.css">
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
</head>
<body>
<div class="container">
    <h1>Chatty</h1>
    <div id="username-page">
        <div class="input-group">
            <input type="text" id="username" maxlength="20" placeholder="Enter your username" autofocus>
            <button id="join-button">Join Chat</button>
        </div>
    </div>
    <div id="chat-page" style="display: none;">
        <div class="chat-container">
            <div id="chat"></div>
            <div class="input-group">
                <input type="text" id="message" maxlength="50" placeholder="Enter your message...">
                <button id="send-button">Send</button>
            </div>
        </div>
        <div id="user-info">
            <h3>Chat Info</h3>
            <p>Connected Users: <span id="user-count">0</span></p>
        </div>
    </div>
</div>
<script src="/js/chat.js"></script>
</body>
</html>
