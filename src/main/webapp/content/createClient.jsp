<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Profil" %>
<%@ page import="db.dbProfil" %>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <title>Jean David Coaching - Création de client</title>
        <%@ include file="/content/templete/libHead.jsp" %>
        <script type="text/JavaScript" src="../js/ajaxExercice.js"></script>
        <script type="text/JavaScript" src="../js/ajaxAdmin.js"></script>
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
                        <h3 class="text-primary">Création d'un Client</h3> </div>
                </div>
                <!-- Container fluid  -->
                <div class="container-fluid" id="mainPage">
                    <!-- Start Page Content -->
                    <div class='row justify-content-center'>

                        <!-- Commmencer ici -->
                        <div class="row justify-content-center">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="form-validation">
                                            <h4>Création d'un client</h4>
                                            <form id="formCreateUser" class="form-valide" action="/ServletInsertUserFromAdmin" method="get">
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label" for="nameUser"> Nom <span class="text-danger">*</span></label>
                                                    <div class="col-lg-6">
                                                         <input type="hidden" name="user" value="admin">
                                                        <input type="text" class="form-control" id="nameUser" name="nameUser" required>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label" for="lastNameUser"> Prénom <span class="text-danger">*</span></label>
                                                    <div class="col-lg-6">
                                                        <input type="text" class="form-control" id="lastNameUser" name="lastNameUser" required>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label" for="mailUser">Email <span class="text-danger">*</span></label>
                                                    <div class="col-lg-6">
                                                        <input type="email" class="form-control" id="mailUser" name="mailUser" required>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label" for="val-password">Mot de Passe <span class="text-danger">*</span></label>
                                                    <div class="col-lg-6">
                                                        <input type="password" class="form-control" id="val-password" name="val-password" >
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label" for="val-confirm-password">Confirmation de mot de passe <span class="text-danger">*</span></label>
                                                    <div class="col-lg-6">
                                                        <input type="password" class="form-control" id="val-confirm-password" name="val-confirm-password" >
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label" for="dateBornUser">Date de naissance <span class="text-danger">*</span></label>
                                                    <div class="col-lg-6">
                                                        <input type="date" class="form-control" id="dateBornUser" name="dateBornUser" required>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label" for="sexUser">Genre <span class="text-danger">*</span></label>
                                                    <div class="col-lg-6">
                                                        <select class="form-control" id="sexUser" name="sexUser">
                                                            <option value="homme">Homme</option>
                                                            <option value="femme">Femme</option>                           
                                                        </select>
                                                    </div>
                                                </div>
                                                 <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label" for="statut">Statut <span class="text-danger">*</span></label>
                                                    <div class="col-lg-6">
                                                        <select class="form-control" id="statut" name="statut">
                                                            <option value="prospect">prospect</option>
                                                            <option value="en attente">en attente</option>   
                                                            <option value="validé">validé</option> 
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label" for="sexUser">Profil <i>(Ctrl+click pour en choisir plusieurs)</i></label>
                                                    <div class="col-lg-6">
                                                        <select class="form-control" id="objUser" name="objUser" multiple>
                                                            <%
                                                               ArrayList<Profil> listProf;
                                                                listProf = new dbProfil().getProfils();                                          
                                                                for (Profil p:listProf){
                                                                out.print("<option value=\""+p.getLibelleprofil()+"\">"+p.getLibelleprofil()+"</option>");                                              
                                                                         }                                                   
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label" for="telUser">Numéro de téléphone <span class="text-danger"></span></label>
                                                    <div class="col-lg-6">
                                                        <input type="text" pattern="[0-9]{10}"class="form-control" id="telUser" name="telUser" placeholder="format : 0xxxxxxxxx">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label" for="adressUser">Adresse <span class="text-danger"></span></label>
                                                    <div class="col-lg-6">
                                                        <input type="text" class="adressUser" id="adressUser" name="adressUser">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label" for="infoUser">Informations<span class="text-danger"></span></label>
                                                    <div class="col-lg-6">
                                                        <input type="text" class="form-control" id="infoUser" name="infoUser">
                                                    </div>
                                                </div>                                 
                                                <div class="form-group row">
                                                    <div class="col-lg-8 ml-auto">
                                                        <button type="submit" class="btn btn-primary">Créer</button>
                                                    </div>
                                                </div>
                                            </form>
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

           
    <script src="../js/lib/form-validation/jquery.validate.min.js"></script>
    <script src="../js/lib/form-validation/jquery.validate-init.js"></script>
    </body>

</html>