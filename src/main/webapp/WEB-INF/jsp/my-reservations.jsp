<%-- 
    Document   : my-reservations
    Created on : Sep 9, 2020, 7:59:06 PM
    Author     : pkontekas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>JSP Page</title>
        <style>
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
            }
            .bookingTitle{
                text-align: center;
                padding-top: 20px;
                padding-bottom: 20px ;
                color: #3282B8;
            }
            .bodyPage{
                height: 65vh;
               
            }
        </style>

    </head>
    <body>
<jsp:include page="navbar.jsp"/>
        <div class="bodyPage container">

            <div class="bookingTitle" >
                <h1>My reservation</h1>
            </div>

            <div class="card">
                <div class="card-body">
                    <table>
                        <thead>
                            <tr>
                                <th>booking id</th>
                                <th>boat type</th>
                                <th>model</th>
                                <th>Check in</th>
                                <th>Check out</th>
                                <th>Final price</th>
                                <th>PayPal</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr >
                                <td>1</td>
                                <td>rib</td>
                                <td>yamaha</td>
                                <td>09/09/2020</td>
                                <td>09/09/2020</td>
                                <td>600</td>
                                <td><div id="paypal-button-container" style="width: 75%;"></div></td>
                            </tr>
                        </tbody>
                    </table>

                </div>
            </div>

        </div>
         <jsp:include page="footer.jsp"/>
        <script>
            paypal.Button.render({
                style: {
                    size: 'responsive'
                    
                }
            }, '#paypal-button-container');
        </script>
        <script src="https://www.paypal.com/sdk/js?client-id=AclT2R2sijDUVaf_NADn4bs6gxmUT186bz3fophkxQLEEhg60z6pioqE0Q8KPoW4in4hqZgKcyiBRWih&currency=EUR">
            // Required. Replace SB_CLIENT_ID with your sandbox client ID. </script>
        <script src="/js/paypal.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>  
    </body>
</html>