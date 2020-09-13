<%-- 
    Document   : rate
    Created on : Sep 13, 2020, 9:36:56 PM
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <title>Rate page</title>
        <style>
            .ratePageTitle{
                text-align: center;
                padding-top: 25px;
                padding-bottom: 25px;
            }
            .checked {
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
            <h1>   Rating page</h1>
            <div class="star">
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
            </div>
        </div>


        <div class="rateForm container">


            <form>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label class="form-group" for="">Stars</label>
                            <select class="custom-select" id="">
                                <option selected>Choose number of stars</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                                <option value="4">four</option>
                                <option value="5">Five</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="form-group" for="">General maintenance</label>
                            <select class="custom-select" id="">
                                <option selected>Choose number of stars</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                                <option value="4">four</option>
                                <option value="5">Five</option>
                                <option value="6">Six</option>
                                <option value="7">Seven</option>
                                <option value="8">Eight</option>
                                <option value="9">Nine</option>
                                <option value="10">Ten</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="form-group" for="">Cleanliness</label>
                            <select class="custom-select" id="">
                                <option selected>Choose number of stars</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                                <option value="4">four</option>
                                <option value="5">Five</option>
                                <option value="6">Six</option>
                                <option value="7">Seven</option>
                                <option value="8">Eight</option>
                                <option value="9">Nine</option>
                                <option value="10">Ten</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="form-group" for="">Comfort</label>
                            <select class="custom-select" id="">
                                <option selected>Choose number of stars</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                                <option value="4">four</option>
                                <option value="5">Five</option>
                                <option value="6">Six</option>
                                <option value="7">Seven</option>
                                <option value="8">Eight</option>
                                <option value="9">Nine</option>
                                <option value="10">Ten</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label class="form-group" for="">Harbour</label>
                            <select class="custom-select" id="">
                                <option selected>Choose number of stars</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                                <option value="4">four</option>
                                <option value="5">Five</option>
                                <option value="6">Six</option>
                                <option value="7">Seven</option>
                                <option value="8">Eight</option>
                                <option value="9">Nine</option>
                                <option value="10">Ten</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="form-group" for="">Hospitality</label>
                            <select class="custom-select" id="">
                                <option selected>Choose number of stars</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                                <option value="4">four</option>
                                <option value="5">Five</option>
                                <option value="6">Six</option>
                                <option value="7">Seven</option>
                                <option value="8">Eight</option>
                                <option value="9">Nine</option>
                                <option value="10">Ten</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="form-group" for="">Value for money</label>
                            <select class="custom-select" id="">
                                <option selected>Choose number of stars</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                                <option value="4">four</option>
                                <option value="5">Five</option>
                                <option value="6">Six</option>
                                <option value="7">Seven</option>
                                <option value="8">Eight</option>
                                <option value="9">Nine</option>
                                <option value="10">Ten</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class=" col-xs-12 col-sm-12 col-md-4 col-lg-4">
                        <label for="">Add comment</label>
                        <textarea id="ownerNotes" name="ownerNotes" rows="5" cols="40"></textarea>
                    </div>
                </div>
                
                <button class="btn btn-primary" type="submit" style="margin-top: 25px">Submit form</button>
                
            </form>

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
