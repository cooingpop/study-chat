<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self' https://cdn.jsdelivr.net; style-src 'self';">
    <title>Spring Boot Chat</title>
    <link rel="stylesheet" href="/css/springboot.css">
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
</head>
<body>
<div id="gatsby-focus-wrapper">
    <div class="header">
        <nav class="navbar">
            <div class="container">
                <div class="navbar-brand">
                    <a class="navbar-item" href="/">
                        <img src="/images/spring-logo.svg" alt="Spring" class="spring-logo">
                    </a>
                </div>
                <div class="navbar-menu">
                    <div class="navbar-end">
                        <a href="#" class="navbar-item">Why Spring</a>
                        <a href="#" class="navbar-item">Learn</a>
                        <a href="#" class="navbar-item">Projects</a>
                        <a href="#" class="navbar-item">Academy</a>
                        <a href="#" class="navbar-item">Solutions</a>
                        <a href="#" class="navbar-item">Community</a>
                    </div>
                </div>
            </div>
        </nav>
    </div>
    <div class="main project">
        <div class="container">
            <div class="columns">
                <div class="project-sidebar column">
                    <aside class="menu">
                        <div class="menu-header">
                            <a href="/projects" class="all-projects">
                                All projects
                            </a>
                        </div>
                        <ul class="menu-list">
                            <li><a href="#" class="is-active">Spring Boot</a></li>
                            <li><a href="#">Spring Framework</a></li>
                            <li class="is-parent"><a href="#">Spring Data</a></li>
                            <li class="is-parent"><a href="#">Spring Cloud</a></li>
                            <li><a href="#">Spring Cloud Data Flow</a></li>
                            <li class="is-parent"><a href="#">Spring Security</a></li>
                            <li><a href="#">Spring Authorization Server</a></li>
                            <li><a href="#">Spring for GraphQL</a></li>
                            <li class="is-parent"><a href="#">Spring Session</a></li>
                            <li><a href="#">Spring Integration</a></li>
                            <li><a href="#">Spring HATEOAS</a></li>
                            <li><a href="#">Spring Modulith</a></li>
                            <li><a href="#">Spring REST Docs</a></li>
                            <li><a href="#">Spring AI</a></li>
                            <li><a href="#">Spring Batch</a></li>
                            <li><a href="#">Spring CLI</a></li>
                            <li><a href="#">Spring AMQP</a></li>
                            <li><a href="#">Spring CredHub</a></li>
                            <li><a href="#">Spring Flo</a></li>
                            <li><a href="#">Spring for Apache Kafka</a></li>
                            <li><a href="#">Spring LDAP</a></li>
                            <li><a href="#">Spring for Apache Pulsar</a></li>
                            <li><a href="#">Spring Shell</a></li>
                            <li><a href="#">Spring Statemachine</a></li>
                            <li><a href="#">Spring Vault</a></li>
                            <li><a href="#">Spring Web Flow</a></li>
                            <li><a href="#">Spring Web Services</a></li>
                        </ul>
                    </aside>
                </div>
                <div class="column main-content">
                    <div class="project-header">
                        <h1>
                            <img src="/images/spring-boot-logo.svg" alt="Spring Boot" class="project-logo">
                            Spring Boot Chat
                            <span class="version-badge">3.4.0</span>
                        </h1>
                    </div>
                    <div class="content-tabs">
                        <ul>
                            <li class="active"><a href="#overview">OVERVIEW</a></li>
                            <li><a href="#learn">LEARN</a></li>
                            <li><a href="#support">SUPPORT</a></li>
                            <li><a href="#samples">SAMPLES</a></li>
                        </ul>
                    </div>
                    <div class="talks-and-videos">
                        <div id="username-page">
                            <div class="input-group">
                                <input type="text" id="username" maxlength="20" placeholder="Enter your username" autofocus>
                                <button id="join-button" class="button is-spring">Join Chat</button>
                            </div>
                        </div>
                        <div id="chat-page" style="display: none;">
                            <div class="chat-container">
                                <div id="chat"></div>
                                <div id="user-info">
                                    <h3>Chat Info</h3>
                                    <p>Connected Users: <span id="user-count">0</span></p>
                                </div>
                                <div class="input-group">
                                    <input type="text" id="message" maxlength="50" placeholder="Enter your message...">
                                    <button id="send-button" class="button is-spring">Send</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/chat.js"></script>
</body>
</html>
