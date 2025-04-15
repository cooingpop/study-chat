<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self' https://cdn.jsdelivr.net; style-src 'self';">
    <title>Spring Boot</title>
    <link rel="icon" type="image/x-icon" href="/images/favicon.ico">
    <link rel="stylesheet" href="/css/chat_v3.css">
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
                        <img src="/images/spring-logo.png" alt="Spring" class="spring-logo">
                    </a>
                </div>
                <div class="navbar-menu">
                    <div class="navbar-end">
                        <div class="navbar-item has-dropdown is-hoverable">
                            <span class="navbar-link">Why Spring</span>
                            <div class="navbar-dropdown">
                                <a class="navbar-item">Overview</a>
                                <a class="navbar-item">Microservices</a>
                                <a class="navbar-item">Reactive</a>
                                <a class="navbar-item">Cloud</a>
                            </div>
                        </div>
                        <div class="navbar-item has-dropdown is-hoverable">
                            <span class="navbar-link">Learn</span>
                            <div class="navbar-dropdown">
                                <a class="navbar-item">Overview</a>
                                <a class="navbar-item">Quickstart</a>
                                <a class="navbar-item">Guides</a>
                            </div>
                        </div>
                        <div class="navbar-item has-dropdown is-hoverable">
                            <span class="navbar-link">Projects</span>
                            <div class="navbar-dropdown">
                                <a class="navbar-item">Overview</a>
                                <a class="navbar-item">Spring Boot</a>
                                <a class="navbar-item">Spring Framework</a>
                            </div>
                        </div>
                        <div class="navbar-item has-dropdown is-hoverable">
                            <span class="navbar-link">Academy</span>
                            <div class="navbar-dropdown">
                                <a class="navbar-item">Courses</a>
                                <a class="navbar-item">Get Certified</a>
                            </div>
                        </div>
                        <div class="navbar-item has-dropdown is-hoverable">
                            <span class="navbar-link">Solutions</span>
                            <div class="navbar-dropdown">
                                <a class="navbar-item">Overview</a>
                                <a class="navbar-item">Support</a>
                            </div>
                        </div>
                        <div class="navbar-item has-dropdown is-hoverable">
                            <span class="navbar-link">Community</span>
                            <div class="navbar-dropdown">
                                <a class="navbar-item">Overview</a>
                                <a class="navbar-item">Events</a>
                            </div>
                        </div>
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
                            <a href="https://spring.io/projects" class="all-projects">
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
                    <div id="content-overview" class="content-section active">
                        <div class="">
                            <p>Spring Boot makes it easy to create stand-alone, production-grade Spring based Applications that you can "just run".</p>
                            <p>We take an opinionated view of the Spring platform and third-party libraries so you can get started with minimum fuss. Most Spring Boot applications need minimal Spring configuration.</p>
                            <p>If you're looking for information about a specific version, or instructions about how to upgrade from an earlier release, check out <a href="#">the project release notes section</a> on our wiki.</p>
                            <h2 id="features">Features</h2>
                            <ul>
                                <li>Create stand-alone Spring applications</li>
                                <li>Embed Tomcat, Jetty or Undertow directly (no need to deploy WAR files)</li>
                                <li>Provide opinionated 'starter' dependencies to simplify your build configuration</li>
                                <li>Automatically configure Spring and 3rd party libraries whenever possible</li>
                                <li>Provide production-ready features such as metrics, health checks, and externalized configuration</li>
                                <li>Absolutely no code generation and no requirement for XML configuration</li>
                            </ul>
                            <h2 id="getting-started">Getting Started</h2>
                            <ul>
                                <li>Super quick — try the <a href="#">Quickstart Guide</a>.</li>
                                <li>More general — try <a href="#">Building an Application with Spring Boot</a></li>
                                <li>More specific — try <a href="#">Building a RESTful Web Service</a>.</li>
                                <li>Or search through all our guides on the <a href="#">Guides</a> homepage.</li>
                            </ul>
                            <h2 id="talks-and-videos">Talks and videos</h2>
                            <ul>
                                <li><a href="#">Mind the Gap: Jumping from Spring Boot 2.x to 3.x</a></li>
                                <li><a href="#">Demystifying Spring Internals</a></li>
                                <li><a href="#">Ahead Of Time and Native in Spring Boot 3.0</a></li>
                                <li><a href="#">Improve Your Developer Experience with Spring Boot Dev Services</a></li>
                            </ul>
                            <p>You can also join the <a href="#">Spring Boot community on Gitter</a>!</p>
                        </div>
                        <div class="chat-container">
                            <div id="username-page">
                                <div class="input-group">
                                    <input type="text" id="username" placeholder="Enter username">
                                    <button id="join-button" class="button is-spring">Join Chat</button>
                                </div>
                            </div>
                            <div id="chat-page">
                                <div id="chat"></div>
                                <div id="user-info">
                                    <h3>Chat Info</h3>
                                    <p>Connected Users: <span id="user-count">0</span></p>
                                </div>
                                <div class="message-input">
                                    <input type="text" id="message" placeholder="Type a message...">
                                    <button id="send-button" class="button is-spring">Send</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="content-learn" class="content-section">
                        <div class="">
                            <p>The Spring Framework provides a comprehensive programming and configuration model for modern Java-based enterprise applications - on any kind of deployment platform.</p>
                            <p>A key element of Spring is infrastructural support at the application level: Spring focuses on the "plumbing" of enterprise applications so that teams can focus on application-level business logic, without unnecessary ties to specific deployment environments.</p>
                            <h2 id="support-policy-and-migration">Support Policy and Migration</h2>
                            <p>For information about minimum requirements, guidance on upgrading from earlier versions and support policies, please check out <a href="#">the official Spring Framework wiki page</a></p>
                            <h2 id="features">Features</h2>
                            <ul>
                                <li>
                                    <p><a href="#">Core technologies</a>: dependency injection, events, resources, i18n, validation, data binding, type conversion, SpEL, AOP.</p>
                                </li>
                                <li>
                                    <p><a href="#">Testing</a>: mock objects, TestContext framework, Spring MVC Test, <code>WebTestClient</code>.</p>
                                </li>
                                <li>
                                    <p><a href="#">Data Access</a>: transactions, DAO support, JDBC, ORM, Marshalling XML.</p>
                                </li>
                                <li>
                                    <p><a href="#">Spring MVC</a> and <a href="#">Spring WebFlux</a> web frameworks.</p>
                                </li>
                                <li>
                                    <p><a href="#">Integration</a>: remoting, JMS, JCA, JMX, email, tasks, scheduling, cache and observability.</p>
                                </li>
                                <li>
                                    <p><a href="#">Languages</a>: Kotlin, Groovy, dynamic languages.</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div id="content-support" class="content-section">
                        <h2>Support</h2>
                        <h3>Keyboard Shortcuts</h3>
                        <ul>
                            <li><strong>Alt + Z:</strong> Switch to OVERVIEW tab</li>
                            <li><strong>Alt + X:</strong> Switch to LEARN tab</li>
                            <li><strong>Alt + C:</strong> Clear chat messages</li>
                        </ul>
                        <p>These keyboard shortcuts allow you to quickly navigate between tabs and manage the chat interface in the Spring Boot Chat application.</p>
                        <h3>Additional Support</h3>
                        <p>For further assistance or inquiries, please refer to our documentation or contact our support team.</p>
                    </div>
                    <div id="content-samples" class="content-section">
                        <h2>Samples</h2>
                        <p>This is the samples section content.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/chat.js"></script>
</body>
</html>
