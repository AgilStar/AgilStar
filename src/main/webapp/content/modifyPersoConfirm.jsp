<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Utilisateur" %>
<%@ page import="model.Profil" %>
<%@ page import="db.dbProfil" %>
<%@ page import="db.dbClient" %>
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
            <%@ include file="/content/templete/menuClient.jsp" %>
            <!-- Page wrapper  -->
            <div class="page-wrapper">
                <!-- Bread crumb -->
                <div class="row page-titles">
                    <div class="col-md-5 align-self-center">
                        <!-- vérifier si le client a déjà fait un bilan d'évaluation -->
                   
                    </div>
                    <div class="col-md-7 align-self-center">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">Profil</li>
                        </ol>
                    </div>
                </div>
                <!-- Container fluid  -->
                <div class="container-fluid" id="mainPage">
                    <!-- Start Page Content -->
                    <div class='row'>

                        <!-- Commmencer ici -->

                        <div class="col-lg-6">

                            <div class="card card-outline-primary">
                                <div class="card-header">
                                    <h4 class="m-b-0 text-white">Modification du profil</h4>
                                </div>
                                <div class="card-body">
                                    <form action="/ServletModifyProfil" method="get">
                                        
                                          <div class="form-body">
                       
                                      
                            
                                            <div class="row p-t-20">
                                                <div class="col-md-6">
                                                    
                                       <%  String ids=(String)session.getAttribute("id");
                                           int id=Integer.parseInt(ids);
                                          
                                         Utilisateur u = new dbClient().getUser(id);
                                  ArrayList<Profil> po= new dbClient().getProfilUser(id);
                                          //   out.print(u.getGenreu());

                                         %>
                                                    <div class="form-group">
                                                        <label class="control-label">Nom</label>
                                                        <input type="text" id="nom" class="form-control" name="nom" value="<%=u.getNomu()%>" >
                                                    </div>
                                                     <div class="form-group">
                                                        <label class="control-label">Prenom</label>
                                                        <input type="text" id="prenom" class="form-control" name="prenom" value="<%=u.getPrenomu()%>">
                                                    </div>
                                                </div>
                                             
                                             
                                            </div>
                                             <div class="row p-t-20">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label">Date de naissance</label>
                                                        <input type="text" id="dn" class="form-control" name="dn" value="<%=u.getDatenaissance()%>" disabled>
                                                    </div>
                                                     <div class="form-group">
                                                        <label class="control-label">genre</label>
                                                        <input type="text" id="genre" class="form-control" name="genre" value="<%=u.getGenreu()%>" disabled>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                          
                                            </div>
                                              <div class="row p-t-20">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label">Objectif sportif</label>
                                                            <%  for (Profil prof : po) {
                                                       out.print( "<input type='text' value='"+prof.getLibelleprofil()+"' disabled>");}
                                                   %>
                                                    </div>
                                                     <div class="form-group">
                                                        <label class="control-label">Adresse</label>
                                                        <input type="text" id="adress" class="form-control" name="adress" value="<%=u.getAdresseu()%>" >
                                                    </div>
                                                </div>
                                                <!--/span-->
                                             
                                            </div>
                                                                    
                                        </div>
                                        <div class="form-actions"> 
                                        <button type="submit" class="btn btn-warning btn-rounded m-b-10 m-l-5"><i class="fa fa-check"></i>Confirmer</button>
                                        </div>
                                    </form>
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