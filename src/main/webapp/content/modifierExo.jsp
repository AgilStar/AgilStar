<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Exercice" %>
<%@ page import="db.dbExercice" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Ela - Bootstrap Admin Dashboard Template</title>
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
                    <h3 class="text-primary">Exercices</h3> </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item active">Exercice</li>
                    </ol>
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
                                <h4>Modification d'un exercice</h4>

                            </div>
                            <div class="card-body">
                                <div class="basic-form">
                                   
                                    <%
                                       Integer codee= new Integer(request.getParameter("codee"));
                                           
                                       Exercice e = new dbExercice().getExercice(codee);
                                    %>

                                        <div class="form-group">
                                            <label>Nom d'exercice</label>
                                            <input type="string" class="form-control" id="nameExerciceM" value="<%=e.getLibellee()%>">
                                        </div>
                                        <div class="form-group">
                                            <label>Objectif</label>
                                            <input type="string" class="form-control"  id="objectiveExerciceM"  value="<%=e.getObjectife()%>">
                                        </div>
                                         <div class="form-group">
                                            <label>Description</label>
                                            <input type="string" class="form-control" id="descExerciceM" value="<%=e.getDesc()%>" >
                                        </div>  
                                        <div class="form-group">
                                            <label>Lien multimédia</label>
                                            <input type="string" class="form-control" id="videoExerciceM" value="<%=e.getLienvideo()%>" >
                                        </div>
                                        
                                            <input type="hidden" class="form-control" id="codeeM" value="<%=e.getCodee()%>">
                                  
                                        <div id="errorMessageM"></div>
                                        <button type="button" class="btn btn-danger btn-rounded m-b-10 m-l-5" onclick="modifierExercice()">Modifier</button>
                                        
                                        
                                    
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
