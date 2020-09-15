<%-- 
    Document   : rate
    Created on : Sep 13, 2020, 9:36:56 PM
    Author     : Dionisis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="springform" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <title>Rate page</title>
        <style>
            .ratePageTitle{
                text-align: center;
                padding-top: 25px;
                padding-bottom: 25px;
            }
            .checkedStar {
                color: gold;
            }
            .rateForm{
                font-style: italic;
                font-family: Georgia, 'Times New Roman', Times, serif;
                font-weight: 600;
                display: d-flex;
                justify-content: center;
                padding-bottom: 40px;
                padding-top: 30px;
            }
        </style>
    </head>
    <body>

        <jsp:include page="navbar.jsp"/>

        <div class="ratePageTitle">
            <h1>Rate your Experience</h1>
            <div class="star">
                <span class="fa fa-star checkedStar"></span>
                <span class="fa fa-star checkedStar"></span>
                <span class="fa fa-star checkedStar"></span>
                <span class="fa fa-star checkedStar"></span>
                <span class="fa fa-star checkedStar"></span>
            </div>
        </div>
        <div class="rateForm container">
            <springform:form cssClass="main-form needs-validation" novalidate="true" action="${pageContext.request.contextPath}/doratereview" method="POST" modelAttribute="newreview">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label for="stars">Stars (1 to 5)</label>
                            <springform:input type="number" value="" cssClass="form-control" min="1" max="5" path="stars" required="true"/>
                        </div>
                        <input hidden name="bid" value="${bookid}" required>
                        <div class="form-group">
                            <label for="generalMaintenance">General Maintenance</label>
                            <springform:input type="number" cssClass="form-control" min="1" max="10" path="generalMaintenance" required="true"/>
                        </div>
                        <div class="form-group">
                            <label for="cleanliness">Cleanliness</label>
                            <springform:input type="number" cssClass="form-control" min="1" max="10" path="cleanliness" required="true"/>
                        </div>
                        <div class="form-group">
                            <label for="comfort">Comfort</label>
                            <springform:input type="number" cssClass="form-control" min="1" max="10" path="comfort" required="true"/>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label for="harbour">Harbour (Rate the Port)</label>
                            <springform:input type="number" cssClass="form-control" min="1" max="10" path="harbour" required="true"/>
                        </div>
                        <div class="form-group">
                            <label for="hospitality">Hospitality</label>
                            <springform:input type="number" cssClass="form-control" min="1" max="10" path="hospitality" required="true"/>
                        </div>
                        <div class="form-group">
                            <label for="valueForMoney">Value for Money</label>
                            <springform:input type="number" cssClass="form-control" min="1" max="10" path="valueForMoney" required="true"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class=" col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <label>Care to put your opinion into words?</label>
                        <springform:textarea path="comment" rows="5" cols="65"/>
                    </div>
                </div>
                <button class="btn btn-primary" type="submit" style="margin-top: 25px">Submit Review</button>
            </springform:form>

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
        <script src="/js/validations.js"></script>
        <script src="https://cdn.rawgit.com/PascaleBeier/bootstrap-validate/v2.2.0/dist/bootstrap-validate.js"></script>
    </body>
</html>
