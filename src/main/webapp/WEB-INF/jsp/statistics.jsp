<%-- 
    Document   : statistics
    Created on : Sep 11, 2020, 7:51:49 PM
    Author     : Dionisis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <title>Stat Page for Admin</title>
        <style>
            .statisticsTitle{
                padding-top: 25px;
                text-align: center;
            }
            #piechart{
                display: flex;
            }
            .progressBars{
                color: orangered;
                margin-top: 23px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>

        <div class="statisticsPage container">

            <h1 class="statisticsTitle">My Statistics</h1>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-4 col-xl-4">
                    <div id="piechart"></div>   
                </div>
                <div class="container col-xs-12 col-sm-12 col-md-12 col-lg-8 col-xl-8">
                    <h4 style="text-align: center; padding-top: 50px">Most Popular Boat Type</h4>
                    <div class="progressBars">
                        <h5>Yacht</h5>
                        <div class="progress">
                            <div class="progress-bar progress-bar-success progress-bar-striped" style="width:40%"></div>
                        </div>
                    </div>
                    <div class="progressBars">
                        <h5>Motorboat</h5>
                        <div class="progress">
                            <div class="progress-bar progress-bar-success progress-bar-striped" style="width:50%"></div>
                        </div>
                    </div>
                    <div class="progressBars">
                        <h5>Rib Boat</h5>
                        <div class="progress">
                            <div class="progress-bar progress-bar-success progress-bar-striped" style="width:60%"></div>
                        </div>
                    </div>
                    <div class="progressBars">
                        <h5>Catamaran</h5>
                        <div class="progress">
                            <div class="progress-bar progress-bar-success progress-bar-striped" style="width:70%"></div>
                        </div>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

        <script type="text/javascript">
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
                let data = google.visualization.arrayToDataTable([
                    ['Task', 'Popular Ports'],
                    ['Pireaus', 4],
                    ['Mykonos', 4],
                    ['Paros', 4],
                    ['Herakleion', 4],
                    ['Zakynthos', 4]
                ]);
                let options = {'title': 'Most Popular Port', 'width': 650, 'height': 500};
                // Display the chart inside the <div> element with id="piechart"
                let chart = new google.visualization.PieChart(document.getElementById('piechart'));
                chart.draw(data, options);
            }
        </script>
    </body>
</html>