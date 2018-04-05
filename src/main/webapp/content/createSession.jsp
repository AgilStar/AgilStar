<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Categorieseance" %>
<%@ page import="db.dbCategorie" %>
<%@ page import="model.Exercice" %>
<%@ page import="db.dbExercice" %>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <title>Création de Séance Type</title>
        <%@ include file="/content/templete/libHead.jsp" %>
        <script type="text/JavaScript" src="../js/ajaxTypeSession.js"></script>
        <script type="text/JavaScript" src="../js/gestionTableau.js"></script>
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
                        <h3 class="text-primary">Création de Séance Type</h3> </div>
                </div>
                <!-- Container fluid  -->
                <div class="container-fluid" id="mainPage">
                    <!-- Start Page Content -->
                    <div class='row'>

                        <!-- Commmencer ici -->
                        <div class="col-lg-13" >
                            <div class="card">
                                <div class="card-title">
                                    <h3>Création d'une Séance Type</h3>

                                </div>
                                <div class="card-body">
                                    <div class="basic-form">

                                        <div class="form-group">
                                            <label>Nom de la séance</label>
                                            <input type="string" class="form-control" placeholder="Nom de la séance" id="nameSession">
                                        </div>                                        
                                        <div class="form-group">
                                            <label>Catégorie de la séance</label>
                                            <%
                                                            ArrayList<Categorieseance> listCat=new dbCategorie().getCategories();
                                                            out.print("<select id=\"codeCateg\" name=\"codeCat\">");
                                                            for (Categorieseance cs:listCat){
                                                                out.print("<option value="+cs.getCodecat() +">"+cs.getLibellecat()+"</option>");
                                                            }
                                                            out.print("</select>");
             
                                            %>

                                        </div>
                                        <div class="form-group">
                                            <label>Description de la séance</label>
                                            <textarea  class="form-control" rows="10" cols="30" placeholder="Description de la séance" id="descrSession" ></textarea>
                                        </div>   
                                        <div class="form-group">
                                            <label>Echauffement</label>
                                            <textarea  class="form-control" rows="10" cols="30" placeholder="Description de l'échauffement" id="descrWarmUp" ></textarea>
                                        </div>

                                        <div id="errorMessage"></div>

                                        <div class="card-title">
                                            <h4>Sélection des exercices</h4></br>
                                            </br>
                                            <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th>Exercice</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr><td>
                                                            <%
                                                                ArrayList<Exercice> listEx=new dbExercice().getExercices();
                                                                out.print("<select id=\"exercices\" name=\"exercices\">");
                                                                for (Exercice e:listEx){
                                                                    out.print("<option value='"+e.getLibellee()+"' >"+e.getLibellee()+"</option>");
                                                                }
                                                                out.print("</select>");
             
                                                            %> 
                                                        </td>
                                                        <td><button onClick="addLineT()" value="+">+</button></td>
                                                </tbody>
                                            </table></br>
                                            <h4>Exercices à insérer</h4></br>
                                            </br>
                                            <table id="example24" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th>Exercice</th>
                                                        <th>Séries à faire</th>
                                                        <th>Durée attendue</th>
                                                        <th>R�p�titions</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                            </br>
                                            </br>
                                            <button type="button"  onclick="insertSession()">Créer</button>


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