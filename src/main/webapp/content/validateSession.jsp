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
        <title>Valider votre séance</title>
        <%@ include file="/content/templete/libHead.jsp" %>
        <script type="text/JavaScript" src="../js/ajaxExercice.js"></script>
        <link href="css/lib/sweetalert/sweetalert.css" rel="stylesheet">
        <script type="text/JavaScript" src="../js/DoingExercice.js"></script>
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
                        <h3 class="text-primary">Valider</h3> </div>
                    <div class="col-md-7 align-self-center">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Séance</a></li>
                            <li class="breadcrumb-item active">Valider</li>
                        </ol>
                    </div>
                </div>
                <!-- Container fluid  -->
                <div class="container-fluid" id="mainPage">
                    <!-- Start Page Content -->
                    <div class='row'>
                        <!-- Commmencer ici -->
                        <%
                            Integer codeS=(Integer)session.getAttribute("codeS");
                            String type=(String)session.getAttribute("type");
                            ArrayList<Exercice> listE=(ArrayList<Exercice>)session.getAttribute("listE");
                            String id=(String)session.getAttribute("id");
                       
                        %>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-title">
                                    <h4>Valider la séance en cochant les cases correspondantes</h4>

                                </div>
                                <div class="card-body">
                                    <div class="basic-form">
                                        <!--<form>-->
                                        <div class="form-group">
                                            <p class="text-muted m-b-15 f-s-12">Si les exercices te paraissent trop facile ou trop difficile, n'hésites pas à augmenter ou réduire les séries et  <code>notes moi les modifications</code>.</p>

                                            <!--parcourir tous les exercices-->
                                            <table class="table">
                                                <thead><tr><th>Exercice</th><th>Quantite</th>
                                                        <%
                                                            if(type.equals("seance")){
                                                                out.print("<th>Niveau</th>");
                                                            }
                                                        %>
                                                        </tr></thead>
                                                            <%
                                                                //pour une seance normale
                                                                  if(type.equals("seance")){
                                                                     for(Exercice e:listE){
                                                                         Planifiersp p=new dbProgramPerso().getPlanForSession(codeS,e.getCodee());
                                                                         out.print("<tr>");
                                                                         out.print("<td>"+e.getLibellee()+"</td>");
                                                                          if( p.getNbattendue()==null ||p.getNbattendue()==0){
                                                                           out.print("<td>"+p.getDureeattenduee()+" secs * "+p.getSeriep()+" séries</td>");
                                                                          }else{
                                                                           out.print("<td>"+p.getNbattendue()+" unités * "+p.getSeriep()+" séries</td>");
                                                                          }
                                                                          out.print("<td><select name='level'><option value='0'>-----</option><option value='1'>Facile</option><option value='2'>Bien</option><option value='3'>Difficle</option></select></td>");
                                                                         out.print("</tr>");
                                                                     }
                                                                     //pour une seance bilan 
                                                                      }else{
                                                                       String[] list=request.getParameter("bilan").split(",");
                                                                       int i=0;
                                                                        for(Exercice e:listE){
                                                                            Planifierbilan p=new dbProgramPerso().getPlanForBilan(codeS,e.getCodee());
                                                                             out.print("<tr>");
                                                                             out.print("<td>"+e.getLibellee()+"</td>");
                                                                             out.print("<td>"+list[i]+" unités </td>");
                                                                              i++;
                                                                            out.print("</tr>");
                                                                         }
                                                                        session.setAttribute("listBilan",list);
                                                                               
                                                                  }
                                                            %>
                                            </table>
                                            <%
                                                if(type.equals("bilan")){
                                                    out.print(" <label class='control-label'>Fréquence cardiaque au repos</label>");
                                                    out.print("<input type='number' id='fcrepos' class='form-control input-focus' name='fcr' required"); 
                                                    
                                                    out.print(" <label class='control-label'>Fréquence cardiaque après 30 flexions complètes en 45 sec</label>");
                                                    out.print("<input type='number' id='fcflexion' class='form-control input-focus' name='fcflexion' required");
                                                    
                                                    out.print(" <label class='control-label'>Fréquence cardiaque après exercice allongé</label>");
                                                    out.print("<input type='number' id='fcallonge' class='form-control input-focus' name='fcallonge' required");
      
                                                }
                                            %>
                                            <div class="sweetalert m-t-15">
                                                <button class="btn btn-info btn sweet-image-message" onclick="checkSeance()">Confirmer la séance!</button>
                                            </div>
                                        </div>
                                        <!--</form>-->
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
        <script src="js/lib/sweetalert/sweetalert.min.js"></script>
    </body>

</html>
