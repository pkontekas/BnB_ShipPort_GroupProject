<%-- 
    Document   : chat
    Created on : Aug 31, 2020, 2:02:30 PM
    Author     : mapan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="/css/chat.css"/>
        <title>JSP Page</title>
        <style>
            html, body {
                height: 100%;
            }
/*            .wrapper {
                min-height: 100%;
                margin-bottom: -269px;
                padding-bottom: 269px;
            }*/
            #username-page{
                padding-top: 60px;
            }
            #chat-page{
                padding-top: 30px;
            }
        </style>
    </head>
    <body>
<!--        <div class="wrapper">-->
            <jsp:include page="navbar.jsp"/>

            <security:authorize access="isAuthenticated()">
                <div id="username-page">
                    <div class="username-page-container">
                        <h1 class="title">Logged in as</h1>
                        <form id="usernameForm" name="usernameForm">
                            <div class="form-group">
                                <security:authorize access="isAuthenticated()">

                                    <input type="text" id="chat-username" value=${username}
                                           autocomplete="off" class="form-control" disabled="true" />
                                </security:authorize>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="accent username-submit">Start Chatting</button>
                            </div>
                        </form>
                    </div>
                </div>
            </security:authorize>

            <div id="chat-page" class="hidden">
                <div class="chat-container">
                    <div style="background-color:lightblue" class="chat-header">
                        <h2>Join the Current Discussion in BoatBNB!</h2>

                    </div>
                    <div class="connecting">
                        Connecting...
                    </div>
                    <ul id="messageArea">
                    </ul>
                    <form id="messageForm" name="messageForm" nameForm="messageForm">
                        <div class="form-group">
                            <div class="input-group clearfix">
                                <input type="text" id="user-message" placeholder="Type a message..." autocomplete="off" class="form-control"/>
                                <button type="submit" class="primary">Send</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
<!--        </div>-->
        <jsp:include page="footer.jsp"/>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
                integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
        <script src="/js/chat.js"></script>
    </body>
</html>
