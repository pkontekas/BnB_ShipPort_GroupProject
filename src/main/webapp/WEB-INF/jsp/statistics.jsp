<%-- 
    Document   : statistics
    Created on : Sep 11, 2020, 7:51:49 PM
    Author     : Dionisis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
            html, body {
                height: 100%;
            }
            .wrapper {
                min-height: 100%;
                margin-bottom: -269px;
                padding-bottom: 269px;
            }
            .statisticsTitle{
                 color: navy;
                padding-top: 25px;
                text-align: center;
                 font-style: italic;
                font-family: Georgia, 'Times New Roman', Times, serif;
                font-weight: 600;
            }
            #piechart{
                display: flex;
                justify-content: center;
            }
            .progressBars{
                color: navy;
                margin-top: 23px;
            }
            .progbars{
                padding-bottom: 80px;
                
            }
            #portStatistics{
                text-align: left;
                padding-top: 50px;
                color: navy;
            }
            #boatStatistics{
                text-align: center;
                padding-top: 50px;
                padding-bottom: 50px;
                color: navy;
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <jsp:include page="navbar.jsp"/>

            <div class="statisticsPage container">
                <h1 class="statisticsTitle">BoatBNB Site Statistics</h1>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-4 col-xl-4">
                         <h4 id="portStatistics">Most Popular Port</h4>
                        <div id="piechart"></div>   
                    </div>
                    <div class="progbars col-xs-12 col-sm-12 col-md-12 col-lg-8 col-xl-8">
                        <h4 id="boatStatistics">Most Popular Boat Type</h4>
                        <div class="progressBars">
                            <h5>Yacht</h5>
                            <div class="progress">
                                <div class="progress-bar progress-bar-success progress-bar-striped" style="width:${typesBoatsMap["Yacht"] * 100}%"></div>
                            </div>
                        </div>
                        <div class="progressBars">
                            <h5>Motorboat</h5>
                            <div class="progress">
                                <div class="progress-bar progress-bar-success progress-bar-striped" style="width:${typesBoatsMap["Motorboat"] * 100}%"></div>
                            </div>
                        </div>
                        <div class="progressBars">
                            <h5>Rib boat</h5>
                            <div class="progress">
                                <div class="progress-bar progress-bar-success progress-bar-striped" style="width:${typesBoatsMap["Rib"] * 100}%"></div>
                            </div>
                        </div>
                        <div class="progressBars">
                            <h5>Catamaran</h5>
                            <div class="progress">
                                <div class="progress-bar progress-bar-success progress-bar-striped" style="width:${typesBoatsMap["Catamaran"] * 100}%"></div>
                            </div>
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
                    ['Pireaus', ${portsBoatsMap[(1).intValue()]}],
                    ['Mykonos', ${portsBoatsMap[(3).intValue()]}],
                    ['Paros', ${portsBoatsMap[(2).intValue()]}],
                    ['Herakleion', ${portsBoatsMap[(4).intValue()]}],
                    ['Zakynthos', ${portsBoatsMap[(5).intValue()]}]
                ]);
                let options = {'title': '', 'width': 650, 'height': 500};
                // Display the chart inside the <div> element with id="piechart"
                let chart = new google.visualization.PieChart(document.getElementById('piechart'));
                chart.draw(data, options);
            }
        </script>
    </body>
</html>
