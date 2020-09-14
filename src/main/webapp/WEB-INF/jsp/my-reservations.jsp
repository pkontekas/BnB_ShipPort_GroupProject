<%-- 
    Document   : my-reservations
    Created on : Sep 9, 2020, 7:59:06 PM
    Author     : pkontekas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>JSP Page</title>
        <style>
            html, body {
                height: 100%;
            }
            .wrapper {
                min-height: 100%;
                margin-bottom: -269px;
                padding-bottom: 269px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }
            tr:nth-of-type(odd) {
                background: #eee;
                text-align: center;
            }
            th {
                background: #3282B8;
                color: white;
                font-weight: bold;
            }
            td,
            th {
                padding: 6px;
                border: 1px solid #ccc;
                text-align: center;
            }
            @media only screen and (max-width: 760px),
            (min-device-width: 768px) and (max-device-width: 1024px) {
                table,
                thead,
                tbody,
                th,
                td,
                tr {
                    display: block;
                }
                thead tr {
                    position: absolute;
                    top: -9999px;
                    left: -9999px;
                }
                tr {
                    border: 1px solid #ccc;
                }
                td {
                    border: none;
                    border-bottom: 1px solid #eee;
                    position: relative;
                    padding-left: 50%;
                }
                td:before {
                    position: absolute;
                    top: 6px;
                    left: 6px;
                    width: 45%;
                    padding-right: 10px;
                    white-space: nowrap;
                }
                td:nth-of-type(1):before {
                    content: "booking id";
                }
                td:nth-of-type(2):before {
                    content: "Check in";
                }
                td:nth-of-type(3):before {
                    content: "Check out";
                }
                td:nth-of-type(4):before {
                    content: "boat type";
                }
                td:nth-of-type(5):before {
                    content: "model";
                }
                td:nth-of-type(6):before {
                    content: "final price";
                }
                td:nth-of-type(7):before {
                    content: "PayPal";
                }
                td:nth-of-type(8):before {
                    content: "Add review";
                }
            }
            .bookingTitle{
                text-align: center;
                padding-top: 20px;
                padding-bottom: 20px ;
                color: #3282B8;
            }
            .reservationPage{
                height: 65%;
            }
        </style>
    </head>
    <body>
        <div class="wrapper">

            <jsp:include page="navbar.jsp"/>

            <div class="reservationPage container">
                <div class="bookingTitle">
                    <h1>${rentername} ${rentersurname}'s Reservations</h1>
                </div>
                <div class="text-center font-italic" style="color:green">${rateMessage}</div>
                <div class="card">
                    <div class="card-body">
                        <table>
                            <thead>
                                <tr>
                                    <th>Booking ID</th>
                                    <th>Boat Type/Model</th>
                                    <th>Port</th>
                                    <th>Check In</th>
                                    <th>Check Out</th>
                                    <th>Final Price</th>
                                    <th class="toolTip" title="The owner offers either Payment through Paypal or Cash up to 5 days before check-in.">Optional Payment*</th>
                                    <th>Add Review</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${mybookings}" var="b">
                                    <tr>
                                        <td>${b.id}</td>
                                        <td>${b.boatsId.boatType}/${b.boatsId.model}</td>
                                        <td>${b.boatsId.portsId.portName}</td>
                                        <td>${b.startDate}</td>
                                        <td>${b.endDate}</td>
                                        <td>${b.finalPrice}</td>
                                        <td>
                                            <div data-prices="${b.finalPrice}" value="${b.finalPrice}" class="paypal-button-container" id="order${b.id}" style="display: block; margin: 0 auto;">
                                            </div>
                                        </td>
                                        <td><a href="/myreservations/rate/${b.id}/"><button type="submit" class="btn btn-info btn-sm">Rate me</button></a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
                
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
        <script src="https://www.paypal.com/sdk/js?client-id=AclT2R2sijDUVaf_NADn4bs6gxmUT186bz3fophkxQLEEhg60z6pioqE0Q8KPoW4in4hqZgKcyiBRWih&currency=EUR">
            // Required. Replace SB_CLIENT_ID with your sandbox client ID. </script>
        <script src="/js/paypal.js"></script>
    </body>
</html>
