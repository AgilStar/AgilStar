<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="model.Mensuration" %>
<%@ page import="model.Seancebilan" %>
<%@ page import="model.Planifierbilan" %>
<%@ page import="db.dbClient" %>
<%@ page import="db.dbProfil" %>
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
                        <h3 class='text-primary'>Remplir/Modifier le profil sportif</h3>






                    </div>
                    <div class="col-md-7 align-self-center">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Profil</a></li>
                            <li class="breadcrumb-item active">Profil sportif</li>
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
                                    <h4 class="m-b-0 text-white">Evaluation condition physique et performances</h4>
                                </div>
                                <div class="card-body">
                                    <form action="/ServletModifySport" method="get">
                                        <div class="form-body">
                                            <%  String ids=(String)session.getAttribute("id");
                                                 int id1=Integer.parseInt(ids);
                                          
                                                 int s = new dbClient().getSeancebilan(id1);
                                                 int code=new dbClient().getExercice("'gainage'");
                                                  

                                                 Planifierbilan pb1=new dbClient().getLastSport(id1,s,code);
out.print(s);

//                                                 Planifierbilan pb2=new dbClient().getLastSport(id1,s,"Fentes jambe gauche devant");
//                                                 Planifierbilan pb3=new dbClient().getLastSport(id1,s,"Fentes jambe droite devant");
//                                                 Planifierbilan pb4=new dbClient().getLastSport(id1,s,"crunch");   
//                                                 Planifierbilan pb5=new dbClient().getLastSport(id1,s,"pompe");
//                                                 Planifierbilan pb6=new dbClient().getLastSport(id1,s,"squat");
//                                                 Planifierbilan pb7=new dbClient().getLastSport(id1,s,"dips");

                                            %>
                                            <div class="row p-t-20">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label">Age</label>
                                                        <input type="text" id="age" class="form-control" name="age">
                                                    </div>
                                                </div>
                                                <!--/span-->
                                                <div class="col-md-6">
                                                    <div class="form-group has-danger">
                                                        <label class="control-label">Poids</label>
                                                        <input type="text" id="poids" class="form-control form-control-danger" name="poids" value="">
                                                    </div>
                                                </div>
                                                <!--/span-->
                                            </div>
                                            <h3 class="card-title m-t-15">Conditions</h3>
                                            <hr>
                                            <!--/row-->
                                            <div class="col-md-12 ">
                                                <div class="form-group has-danger">
                                                    <label class="control-label">Fréquence cardiaque au repos</label>
                                                    <input type="text" id="fcr" class="form-control form-control-danger" name="fcr">
                                                </div>
                                            </div>
                                            <!--/row-->
                                            <div class="col-md-12 ">
                                                <div class="form-group has-danger">
                                                    <label class="control-label">Fréquence cardiaque après 30 flexions complètes en 45 sec</label>
                                                    <input type="text" id="fcf" class="form-control form-control-danger" name="fcf">
                                                </div>
                                            </div>


                                            <!--/row-->
                                            <div class="col-md-12 ">
                                                <div class="form-group has-danger">
                                                    <label class="control-label">Fréquence cardiaque après exercice allongé</label>
                                                    <input type="text" id="fca" class="form-control form-control-danger" name="fca">
                                                </div>
                                            </div>
                                            <!--/row-->


                                            <h3 class="card-title m-t-15">Performance</h3>
                                            <hr>
                                            <small class="form-control-feedback"> Effectuer le maximun de répétitions ou tenir le plus longtemps possible pour chaque exercice </small> 
                                            <div class="row p-t-20">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label"></label>
                                                        <img src="/images/exercices/gainage.jpg" height="100" width="180" alt="gainage" title="gainage">
                                                    </div>
                                                </div>
                                                <!--/span-->

                                                <div class="col-md-6">
                                                    <div class="form-group has-danger">
                                                        <label class="control-label">Evaluation gainage </label>
                                                        <input type="text" id="evalg" class="form-control form-control-danger" name="evalg" value="<%=pb1.getTempsmaxu()%>">
                                                    </div>
                                                </div>
                                                <!--/span-->
                                            </div>
                                            <!--/row-->
                                            <div class="row p-t-20">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label"></label>
                                                        <img src="/images/exercices/fente.jpg" height="150" width="150"alt="fentes" title="fentes">
                                                    </div>
                                                </div>
                                                <!--/span-->
                                                <div class="col-md-6">
                                                    <div class="form-group has-danger">
                                                        <label class="control-label">Evaluation jambe gauche devant </label>
                                                        <input type="text" id="evalfg" class="form-control form-control-danger" name="evalfg" value="" >
                                                        <label class="control-label">Evaluation jambe droite devant </label>
                                                        <input type="text" id="evalfd" class="form-control form-control-danger" name="evalfd" value="">
                                                    </div>
                                                </div>
                                                <!--/span-->
                                            </div>
                                            <div class="row p-t-20">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label"></label>
                                                        <img src="/images/exercices/crunch.jpg" height="60" width="180" alt="crunch" title="crunch">
                                                    </div>
                                                </div>
                                                <!--/span-->
                                                <div class="col-md-6">
                                                    <div class="form-group has-danger">
                                                        <label class="control-label">Evaluation crunch </label>
                                                        <input type="text" id="crunch" class="form-control form-control-danger" name="crunch">
                                                    </div>
                                                </div>
                                                <!--/span-->
                                            </div>

                                            <div class="row p-t-20">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label"></label>
                                                        <img src="/images/exercices/pompe.jpg" height="150" width="200"alt="1/2 pompes" title="1/2 pompes">
                                                    </div>
                                                </div>
                                                <!--/span-->
                                                <div class="col-md-6">
                                                    <div class="form-group has-danger">

                                                        <label class="control-label">Evaluation 1/2 pompes</label>
                                                        <input type="text" id="pompe" class="form-control form-control-danger" name="pompe">
                                                    </div>
                                                </div>
                                                <!--/span-->
                                            </div>
                                            <div class="row p-t-20">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label"></label>
                                                        <img src="/images/exercices/squat.jpg" height="150" width="180"alt="1/2 squat" title="1/2 squat">
                                                    </div>
                                                </div>
                                                <!--/span-->
                                                <div class="col-md-6">
                                                    <div class="form-group has-danger">

                                                        <label class="control-label">Evaluation 1/2 squat</label>
                                                        <input type="text" id="squat" class="form-control form-control-danger" name="squat">
                                                    </div>
                                                </div>
                                                <!--/span-->
                                            </div>

                                            <div class="row p-t-20">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label"></label>
                                                        <img src="/images/exercices/dips.jpg" height="150" width="200"alt="dips" title="dips">
                                                    </div>
                                                </div>
                                                <!--/span-->
                                                <div class="col-md-6">
                                                    <div class="form-group has-danger">

                                                        <label class="control-label">Evaluation dips</label>
                                                        <input type="text" id="dips" class="form-control form-control-danger" name="dips">
                                                    </div>
                                                </div>
                                                <!--/span-->
                                            </div>
                                        </div>
                                        <div class="form-actions">
                                            <button type="submit" class="btn btn-success"> <i class="fa fa-check"></i> Enregistrer</button>
                                            <button type="reset" class="btn btn-inverse">Annuler</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!--                    formulaire pour la mensuration-->

                        <%  
                            if(session!=null){
                            String id=(String)session.getAttribute("id");
 
                            if (new dbProfil().getProfilUser(Integer.parseInt(id)).contains("Amincissement")){
                            Mensuration m=(Mensuration)new dbClient().getLastMensuration(Integer.parseInt(id));

                        %>
                        <%@ include file="/content/mensuration.jsp" %>

                        <%}
                        }%>

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