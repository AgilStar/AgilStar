<%@ page import="servlet.Program.ctrlCreateProgram" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Profil" %>
<%@ page import="servlet.Program.ctrlCreateProgram" %>
<%@ page import="model.Seancetype" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Création d'un programme type</title>
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
                                <div class="table-responsive">
                                    <table class="table" id="tableProfil">
                                        <thead>
                                        <tr>
                                            <th>Code de profil</th>
                                            <th>Profil</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            ArrayList<Profil> listProfil=new ctrlCreateProgram().getProfil();
                                            for(Profil p:listProfil){
                                                out.print("<tr onclick=\"changeDelete(this)\" style=\"background-color:#fedee5\">");
                                                out.print("<th scope=\"row\">");
                                                out.print("<input type=\"checkbox\" name=\"profil\" value=\""+p.getCodeprofil()+"\" hidden>");
                                                out.print(p.getCodeprofil());
                                                out.print("</th>");
                                                out.print("<td style=\"color:black\" >"+p.getLibelleprofil()+"</td>");
                                                out.print("</tr>");
                                            }
                                        %>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>




                </div>



                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h3 style="color: #00ccff"> Étape 3</h3>
                                <h4 class="card-title">Choisir ou supprimer les séances à ajouter dans le programme</h4>
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

                            </div>
                        </div>

                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title" style="color: #00ccff">Étape 4</h3>
                                <h4 class="card-title">Organiser vos séances et billans</h4>
                                <button class="btn btn-success" onclick="addBilan()">+</button>
                                <span>Bilan</span>
                                <button class="btn btn-warning" onclick="deleteBilan()">-</button>
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
            <button class="btn btn-danger btn-rounded m-b-5 m-l-5" onclick="confirmProfilProgram()">Confirmer</button>
            <button class="btn btn-danger btn-rounded m-b-5 m-l-5" onclick="window.location.href='listSession.jsp'">Reset</button>

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