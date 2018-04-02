<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Seanceperso" %>
<%@ page import="model.Exercice" %>
<%@ page import="model.Planifierbilan" %>
<%@ page import="model.Planifiersp" %>
<%@ page import="model.Seancebilan" %>
<%@ page import="db.dbProgramPerso" %>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <title>La séance en cours</title>
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
                        <h3 class="text-primary">La séance en cours</h3> </div>
                    <div class="col-md-7 align-self-center">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Programme</a></li>
                            <li class="breadcrumb-item active">Séance</li>
                        </ol>
                    </div>
                </div>
                <!-- Container fluid  -->
                <div class="container-fluid" id="mainPage">
                    <!-- Start Page Content -->
                    <div class='row'>
                        <!-- Commmencer ici -->
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Séance</h4>

                                    <div class="table-responsive m-t-40">
                                        <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                <tr>
                                                    <th>Ordre</th>
                                                    <th>Libellé</th>
                                                    <th>Objectif</th>
                                                    <th>Série</th>
                                                    <th>Quantité</th>
                                                    <th>Résultat</th>


                                                </tr>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>

                                                </tr>
                                            </tfoot>
                                            <tbody>
                                              
                          <%
    //le code de la seance en cours
    Integer codeS=Integer.parseInt((String) request.getParameter("codeS"));
    // le type de la seance 
    String type=(String) request.getParameter("type");
   //les exercices a faire dans cette seance
   ArrayList<Exercice> listE= new dbProgramPerso().getAllExercices(codeS,type);
  


                             for (Exercice e : listE){
                                   //out.print("<tr style='background-color: rgb(209, 236, 241); color:black' onclick=\"window.location.href='sessionOnGoing.jsp?codeS="+s[1]+"&type="+s[7]+"'\">");
                                 out.print("<tr style='background-color: rgb(209, 236, 241);'>");
                                 if(type.equals("bilan")){
                                     Planifierbilan p =new dbProgramPerso().getPlanForBilan(codeS,e.getCodee());
                                     out.print("<th style='color:black' scope=\"row\">"+p.getOrdreb()+"</th>");//order
                                     out.print("<td style='color:black'>"+e.getLibellee()+"</td>");//libelle
                                     out.print("<td style='color:black'>"+e.getObjectife()+"</td>");//objectif
                                     out.print("<td style='color:black'>--</td>");//serie
                                     out.print("<td style='color:black'>Maximum</td>");//quantite
                                   if(p.getNbmaxu()==null){
                                         out.print("<td style='color:black'>"+p.getTempsmaxu()+"</td>");//resultat
                                     }else{
                                         out.print("<td style='color:black'>"+p.getNbmaxu()+"</td>");//resultat
                                     }
                                     
                                 }else{
                                    Planifiersp p=(Planifiersp)new dbProgramPerso().getPlanForSession(1,1);
                                     //Planifiersp p=new dbProgramPerso().getPlanForSession(codeS,e.getCodee());
                               
                                      out.print("<th style='color:black' scope=\"row\">"+p.getOrdrep()+"</th>");//order
                                      out.print("<td style='color:black'>"+e.getLibellee()+"</td>");//libelle
                                      out.print("<td style='color:black'>"+e.getObjectife()+"</td>");//objectif
                                      out.print("<td style='color:black'>"+p.getSeriep()+"</td>");//serie
                                     if(p.getNbattendue()==null){
                                         out.print("<td style='color:black'>"+p.getDureeattenduee()+"</td>");//quantite
                                     }else{
                                         out.print("<td style='color:black'>"+p.getNbattendue()+"</td>");//quantite
                                     }
                                      out.print("<td style='color:black'>"+p.getResultatu()+"</td>");//resultat
                                     
                                     
                                 }
    
                                    }
                                    %>
                                            <div class="badge badge-primary"></div>
                                            </tbody>
                                        </table>
                                   
                                    </div>
                                  
                                </div>
                          <div class="row justify-content-center">
                              <button type="button" style="margin-top:20px;"class="btn btn-danger btn-rounded m-b-30 m-t-30">Démarrez la séance!</button>

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