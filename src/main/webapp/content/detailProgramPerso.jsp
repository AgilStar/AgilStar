<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Programmeperso" %>
<%@ page import="db.dbProgramPerso" %>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <title>Un programme</title>
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
                        <h3 class="text-primary">Un programme</h3> </div>
                    <div class="col-md-7 align-self-center">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Programmes</a></li>
                            <li class="breadcrumb-item active">detail programme</li>
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
                                    <h4 class="card-title">Programme</h4>

                                    <div class="table-responsive m-t-40">
                                        <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                <tr>
                                                    <th>Ordre</th>
                                                    <th>Type</th>
                                                    <th>Libelle</th>
                                                    <th>Description</th>
                                                    <th>CommentaireCoach</th>
                                                    <th>Etat Ouverture</th>
                                                    <th>Etat Valider</th>

                                                </tr>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>

                                                </tr>
                                            </tfoot>
                                            <tbody>
                                                <%
                            String codeProgramPerso=request.getParameter("codepp");
                            Integer codePP=Integer.parseInt(codeProgramPerso);
                            
                            //0:ordre, 1:codeseance,2:libelleseance,3:descseance,4:commentaire,5:ouvert,6:valider,7:type
                            ArrayList<String[]> listS= new dbProgramPerso().getAllSeances(codePP);
                             for (String[] s : listS){
                                    if(s[5].equals("oui")){
                                        out.print("<tr style='background-color: rgb(209, 236, 241); color:black' onclick=\"window.location.href='sessionOnGoing.jsp?codeS="+s[1]+"&type="+s[7]+"'\">");
                                        out.print("<th style='color:black' scope=\"row\">"+s[0]+"</th>");
                                        out.print("<td style='color:black'>"+s[7]+"</td>");
                                        out.print("<td style='color:black'>"+s[2]+"</td>");
                                        out.print("<td style='color:black'>"+s[3]+"</td>");
                                        out.print("<td style='color:black'>"+s[4]+"</td>");
                                        out.print("<td style='color:black'>"+s[5]+"</td>");
                                        out.print("<td style='color:black'>"+s[6]+"</td>");
                                        out.print("</tr>");
                                    }else{
                                        out.print("<tr>");
                                        out.print("<th scope=\"row\">"+s[0]+"</th>");
                                        out.print("<td>"+s[7]+"</td>");
                                        out.print("<td>"+s[2]+"</td>");
                                        out.print("<td>"+s[3]+"</td>");
                                        out.print("<td>"+s[4]+"</td>");
                                        out.print("<td>"+s[5]+"</td>");
                                        out.print("<td>"+s[6]+"</td>");
                                        out.print("</tr>");
                                    }
                                    
                                    
                                      }
                                                %>
                                            <div class="badge badge-primary"></div>
                                            </tbody>
                                        </table>
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