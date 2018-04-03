<%@ page import="servlet.Program.ctrlProgram" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Profil" %>
<%@ page import="model.Seancetype" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Création d'un programme type</title>

    <%@ include file="/content/templete/libHead.jsp" %>
    <script type="text/JavaScript" src="../js/ajaxExercice.js"></script>
    <link href="/css/lib/sweetalert/sweetalert.css" rel="stylesheet">
</head>

<body class="fix-header fix-sidebar">
    <!-- Preloader - style you can find in spinners.css -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
			<circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>
    <!-- Main wrapper  -->
    <div id="main-wrapper">
        <!-- header header  -->
        <%@ include file="/content/templete/header.jsp" %>
        <!--Left slider-->
        <%@ include file="/content/templete/menu.jsp" %>
        <!-- Page wrapper  -->
        <div class="page-wrapper">
            <!-- Bread crumb -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-primary">Création d'un programme type</h3> </div>
            </div>
            <!-- Container fluid  -->
            <div class="container-fluid" id="mainPage">
                <!-- Start Page Content -->
                <div class='row'>
                    
                    <!-- Commmencer ici -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-title">
                                <h3 style="color: #00ccff"> Étape 1</h3>
                                <h4>Choisir un ou plusieurs profils</h4>
                            </div>
                            <div class="card-body">
                                <h5>Nom</h5>
                                <input type="text" id="nameProgram" required/>
                                <h5>Description</h5>
                                <input type="text" id="descriptionProgram"/>
                            </div>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="card">
                            <div class="card-title">
                                <h3 style="color: #00ccff"> Étape 2</h3>
                                <h4>Choisir un ou plusieurs profils</h4>
                            </div>
                            <div class="card-body">
                                <jsp:include page="templete/listProfil.jsp" flush="true">
                                    <jsp:param name="codeP" value="-1"/>
                                </jsp:include>
                            </div>
                        </div>
                    </div>




                </div>



                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h3 style="color: #00ccff"> Étape 3</h3>
                                <h4 class="card-title">Organiser vos séances et billans</h4>
                                <%@include file="templete/listSeance.jsp"%>
                            </div>
                        </div>

                    </div>
                </div>


                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div id="errorMessage"></div>
                                <button class="btn btn-success btn sweet-prompt" onclick="confirmProfilProgram('createType','0','0') ">Confirmer</button>
                                <button class="btn btn-danger btn-rounded m-b-5 m-l-5" onclick="window.location.href='listSession.jsp'">Reset</button>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
                <!-- End PAge Content -->
            </div>
            <!-- footer -->
            <%@ include file="/content/templete/footer.jsp" %>
        </div>
    </div>
    <!-- All Jquery -->
     <%@ include file="/content/templete/libJquery.jsp" %>
    <script src="/js/lib/sweetalert/sweetalert.min.js"></script>
    <script src="/js/lib/sweetalert/sweetalert.init.js"></script>
</body>

</html>