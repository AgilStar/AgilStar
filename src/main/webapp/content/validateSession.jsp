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
                                        <form>
                                            <div class="form-group">
                                                <p class="text-muted m-b-15 f-s-12">Si les exercices te paraissent trop facile ou trop difficile, n'hésites pas à augmenter ou réduire les séries et  <code>notes moi les modifications</code>.</p>
                                                
                                                <!--parcourir tous les exercices-->
                                                <table class="table">
                                                    <thead><tr><th>Exercice</th><th>Quantite</th><th>Niveau</th></tr></thead>
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
                                                              out.print("<td><select><option>-----</option><option>Facile</option><option>Bien</option><option>Difficle</option></select></td>");
                                                             out.print("</tr>");
                                                         }
                                                         
                                                         
                                                         //pour une seance bilan 
                                                          }else{
                                                            for(Exercice e:listE){
                                                            
                                                             }
                                                          
                                                      }
                                                  
                                                    
                                                %>
                                                
                                                
                                               
                                                </table>
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
        <!-- All Jquery -->
        <%@ include file="/content/templete/libJquery.jsp" %>

    </body>

</html>
