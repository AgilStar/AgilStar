<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Utilisateur" %>
<%@ page import="db.dbClient" %>
<%@ page import="servlet.GestionClient.CtrlChangeStatu" %>
<%@ page import="servlet.Program.ctrlCreateProgram" %>
<%@ page import="model.Seancetype" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String profil= request.getParameter("profil");

%>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <title>Création Programme Etape 2</title>
        <%@ include file="/content/templete/libHead.jsp" %>
        <script type="text/JavaScript" src="../js/ajaxExercice.js"></script>
        <script type="text/JavaScript" src="../js/ajaxCoach.js"></script>
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
                        <h3 class="text-primary">Création d'un programme</h3> </div>
                </div>
                <!-- Container fluid  -->
                <div class="container-fluid" id="mainPage">
                    <!-- Start Page Content -->

                    <!-- End PAge Content -->

                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <h3> Deuxième étape </h3>
                                    <h4 class="card-title">Liste des séances à ajouter</h4>
                                    <div class="table-responsive m-t-40">
                                        <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                            <thead>
                                            <tr>
                                            <tr>
                                                <th>Séance</th>
                                                <th>Opération</th>
                                                <th>Catégorie</th>
                                                <th>Description</th>
                                            </tr>
                                            </tr>
                                            </thead>
                                            <tbody id="listSessionTotal">
                                            <%

                                                ArrayList<Seancetype> listUu= new ctrlCreateProgram().getAllSeanceType();

    for (Seancetype u : listUu) {
                                                        /*
                                                        Pour valider ou passer en attente
                                                         */
            out.print("<tr style=\"background-color:#fedee5\" nameSession='"+u.getLibellest()+" ("+u.getDescriptionst()+")' idSession='"+u.getCodest()+"' nbSession=0>");

            out.print("<th scope=\"row\">");
            out.print("<input type=\"checkbox\" name=\"user\" value=\""+u.getCodest()+"\" hidden>");
            out.print(u.getLibellest());
            out.print("</th>");
            out.print("<td>");
        out.print("  <button id='btnAddChoixSession' class='btn btn-success btn-outline' onclick=\"addChoixSession(this)\" >+</button>");
        out.print("  <button id='btnDeleteChoixSession' class='btn btn-warning btn-outline' onclick=\"deleteChoixSession(this)\" >-</button>");
          out.print("</td>");
            out.print("<td>" + u.getCategorieCat() + "</td>");
        out.print("<td>" + u.getDescriptionst() + "</td>");

            out.print("</tr>");





}
                                            %>

                                            </tbody>
                                        </table>

                                    </div>
                                    <button class="btn btn-info btn-rounded m-b-10 m-l-5" onclick="addBilan()">Ajouter un bilan</button>
                                    <button class="btn btn-danger btn-rounded m-b-10 m-l-5" onclick="deleteBilan()">Supprimer un bilan</button>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Séances à insérer</h4>
                                <div class="card-content">
                                    <div class="nestable">
                                        <div class="dd" id="nestable">
                                            <ol class="dd-list" id="listSession">
                                            </ol>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
</div>
                </div>
                <button class="btn btn-danger btn-rounded m-b-5 m-l-5" onclick="checkSession()">Confirmer</button>
                <button class="btn btn-danger btn-rounded m-b-5 m-l-5" onclick="window.location.href='listSession.jsp'">Reset</button>
                <!-- footer -->
                <%@ include file="/content/templete/footer.jsp" %>
            </div>
        </div>
        <!-- All Jquery -->


    </body>

</html>