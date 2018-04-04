<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Création d'exercice</title>
    <%@ include file="/content/templete/libHead.jsp" %>
    <script type="text/JavaScript" src="../js/ajaxExercice.js"></script>
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
                    <h3 class="text-primary">Création d'un exercice</h3> </div>
                <div class="col-md-7 align-self-center">
                </div>
            </div>
            <!-- Container fluid  -->
            <div class="container-fluid" id="mainPage">
                <!-- Start Page Content -->
                <div class='row'>
                    
                    <!-- Commmencer ici -->
<div class="col-lg-6" >
                        <div class="card">
                            <div class="card-title">
                                <h4>Création d'un exercice</h4>

                            </div>
                            <div class="card-body">
                                <div class="basic-form">
                                    
                                        <div class="form-group">
                                            <label>Nom</label>
                                            <input type="string" class="form-control" id="nameExercice">
                                        </div>
                                        <div class="form-group">
                                            <label>Objectif</label>
                                            <input type="string" class="form-control" id="objectiveExercice">
                                        </div>
                                     <div class="form-group">
                                            <label>Description</label>
                                            <input type="string" class="form-control"id="descExercice" >
                                        </div>  
                                         <div class="form-group">
                                            <label>Lien de la vidéo</label>
                                            <input type="string" class="form-control"id="videoExercice" >
                                        </div> 
                                    
                                        <div id="errorMessage"></div>
                                        <button type="button"  onclick="insertExercice()">Créer</button>
                                        
                                    
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

</body>

</html>