<%-- 
    Document   : booking
    Created on : Sep 9, 2020, 6:31:47 PM
    Author     : Dionisis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Document</title>
    <style>
        .bookingTitle {
            text-align: center;
            padding-top: 15px;
            padding-bottom: 15px;
        }
        
        .bookingForm{
              font-style: italic;
                font-family: Georgia, 'Times New Roman', Times, serif;
                font-weight: 600;
        }
        
    </style>
</head>

<body>
    <jsp:include page="navbar.jsp"/>
    
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h3 class="bookingTitle">Booking</h3>
                <img alt="boatimage" class="card-img" style="height: 320px;"
                    src="data:image/jpeg;base64,${boatimage}" />
            </div>
            <div class="container">
                <div class="row text-center">
                    <form class="bookingForm">
                        <h5>booking form</h5>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputEmail4">Check-in</label>
                                <input type="date" class="form-control" id="inputEmail4">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputPassword4">Check-out</label>
                                <input type="date" class="form-control" id="inputPassword4">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputAddress" style="text-align: center;">E-mail</label>
                            <input type="email" class="form-control" id="inputAddress">
                        </div>
                        <div class="form-group">
                            <label for="inputAddress2" style="text-align: center;">Phone number</label>
                            <input type="text" class="form-control" id="inputAddress2">
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputCity">Number of passengers</label>
                                <input type="number" class="form-control" id="inputCity">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="gridCheck">
                                <label class="form-check-label" for="gridCheck">
                                    Check me out
                                </label>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Sign in</button>

                    </form>
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
</body>

</html>